import 'package:chat_bubbles/src/core/error/app_exception.dart';
import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChat {
  late final FirebaseFirestore _firestore;
  FirebaseChat() {
    _firestore = FirebaseFirestore.instance;
  }

  // Method to send a message and handle conversation creation if necessary
  Future<void> sendMessage(String otherUserUid, String message) async {
    try {
      String currentUserUid = UserService.currentUser!.uid;

      // Get or create a conversation between the current user and the other user
      String chatId = await getOrCreateConversation(otherUserUid);

      // Add the message to the messages sub-collection of the chat
      await _firestore.collection('chats').doc(chatId).collection('messages').add({
        'sender_uid': currentUserUid,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Update the conversation's last message and last message time
      await _firestore.collection('chats').doc(chatId).update({
        'last_message': message,
      });
    } catch (e) {
      throw AppException('Failed to send message: $e');
    }
  }

  // Stream for real-time messages in a conversation
  Stream<List<Map<String, dynamic>>> getMessagesStream(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  // Stream to get all users and listen for real-time updates
  Stream<List<Map<String, dynamic>>> getAllUsersAsStream() {
    try {
      // Listen to the users collection for real-time updates
      return _firestore.collection('users').snapshots().map((querySnapshot) {
        // Convert each document into a Map<String, dynamic> and return the list
        return querySnapshot.docs
            .map((docSnapshot) {
              if (docSnapshot.data()['uid'] != UserService.currentUser?.uid) {
                return docSnapshot.data();
              } else {
                return null;
              }
            })
            .where((user) => user != null)
            .cast<Map<String, dynamic>>()
            .toList();
      });
    } catch (e) {
      throw AppException(e);
    }
  }

  // Method to check if a conversation exists or create one when the first message is sent
  Future<String> getOrCreateConversation(String otherUserUid) async {
    try {
      // Search for a conversation where the current user and the other user are participants
      final querySnapshot = await getGroups();

      // Check if a conversation exists between the current user and the other user
      for (var doc in querySnapshot) {
        List<dynamic> users = doc['users'];
        if (users.contains(otherUserUid)) {
          // Conversation already exists, return the chat ID
          return doc['uid'];
        }
      }

      // If no conversation exists, create a new one
      DocumentReference newChatDoc = await _firestore.collection('chats').add({
        'uid': '',
        'users': [UserService.currentUser!.uid, otherUserUid],
        'last_message': '',
      });
      await _firestore.collection('chats').doc(newChatDoc.id).update({'uid': newChatDoc.id});

      return newChatDoc.id; // Return the new conversation ID
    } catch (e) {
      throw AppException(e);
    }
  }

  Future<List<Map<String, dynamic>>> getGroups() async {
    try {
      String currentUserUid = UserService.currentUser!.uid;

      // Search for a conversation where the current user and the other user are participants
      QuerySnapshot querySnapshot = await _firestore.collection('chats').where('users', arrayContains: currentUserUid).get();
      return querySnapshot.docs
          .map(
            (e) => e.data() as Map<String, dynamic>,
          )
          .toList();
    } catch (e) {
      throw AppException(e);
    }
  }

  // Stream to get the other user's details
  Stream<Map<String, dynamic>> getOtherUser(String id) {
    return _firestore.collection('users').doc(id).snapshots().map((docSnapshot) => docSnapshot.data()!);
  }

  // Get conversations that involve the current user
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> _getUserConversations() async {
    try {
      String currentUserUid = UserService.currentUser!.uid;

      // Query Firestore to get conversations where the current user is a participant
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('chats')
          .where('users', arrayContains: currentUserUid) // Find conversations where the user is one of the participants
          .get();

      // Return the list of conversations
      return querySnapshot.docs;
    } catch (e) {
      throw AppException(e);
    }
  }

  // Get the other user's data given their UID
  Future<Map<String, dynamic>?> _getOtherUserData(String otherUserUid) async {
    try {
      // Fetch the user document from Firestore
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore.collection('users').doc(otherUserUid).get();

      if (userDoc.exists) {
        return userDoc.data(); // Return the user's data
      } else {
        throw AppException('User not found');
      }
    } catch (e) {
      throw AppException(e);
    }
  }

  // Get conversations and combine them with the other user's data
  Future<List<Map<String, dynamic>>> getConversationLogs() async {
    try {
      // Get all conversations involving the current user
      List<QueryDocumentSnapshot<Map<String, dynamic>>> conversations = await _getUserConversations();

      List<Map<String, dynamic>> conversationLogs = [];

      // Loop through each conversation and get the other user's data
      for (var conversation in conversations) {
        Map<String, dynamic> conversationData = conversation.data();

        // Get the participants of the conversation
        List<dynamic> users = conversationData['users'];

        // Find the other user's UID (the one that is not the current user)
        String otherUserUid = users.firstWhere((uid) => uid != UserService.currentUser!.uid);

        // Get the other user's data from the users collection
        Map<String, dynamic>? otherUserData = await _getOtherUserData(otherUserUid);

        // Combine the conversation data with the other user's data
        conversationLogs.add({
          'conversation_id': conversation.id,
          'last_message': conversationData['last_message'],
          'user': otherUserData,
        });
      }

      return conversationLogs;
    } catch (e) {
      throw AppException(e);
    }
  }
}
