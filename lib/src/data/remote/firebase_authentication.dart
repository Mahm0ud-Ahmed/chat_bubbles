import 'dart:io';

import 'package:chat_bubbles/src/core/config/injector.dart';
import 'package:chat_bubbles/src/core/error/app_exception.dart';
import 'package:chat_bubbles/src/core/services/fcm_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseAuthentication {
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _firestore;
  FirebaseAuthentication() {
    _firebaseAuth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
  }

  Future<Object?> signInWithEmailAndPassword(Map<String, dynamic> data) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(email: data['email'], password: data['password']);
      if (user.user != null) {
        // Update Fcm Token
        await _firestore.collection('users').doc(user.user!.uid).update({'fcm_token': injector<FcmService>().fcmToken});
        return await _getCurrentUser();
      }
    } catch (e) {
      throw AppException(e);
    }
    return null;
  }

  Future<Object?> createUserWithEmailAndPassword(Map<String, dynamic> data) async {
    // create user and save it in storage
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(email: data['email'], password: data['password'])
          .then((userCredential) async {
        if (userCredential.user != null) {
          // First Upload User Avatar by firebase and get Url
          var avatarUrl = await uploadAvatar(data['avatar']);
          // Save user data to Firestore
          await _firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'user_name': data['user_name'],
            'email': data['email'],
            'avatar': avatarUrl,
            'online_status': true,
            'last_active': DateTime.now().toIso8601String(),
            'is_typing': false,
            'password': data['password'],
            'fcm_token': injector<FcmService>().fcmToken,
          });
          return await _getCurrentUser();
        }
        return null;
      });
    } catch (e) {
      throw AppException(e);
    }
  }

  Future<Object?> _getCurrentUser() async {
    // get Current My Own user data from Storage
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          print('===>>>> ${userDoc.data()}');
          return userDoc.data();
        } else {
          throw AppException('User data not found in Firestore');
        }
      } else {
        throw AppException('No user is currently signed in');
      }
    } catch (e) {
      throw AppException(e);
    }
  }

  Future<Object?> updateUser(Map<String, dynamic> newData) async {
    // Get Current My Own user data from Firestore as a Stream
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        // Update the user document with new data
        await _firestore.collection('users').doc(user.uid).update(newData);

        // Return a stream that listens to real-time updates on the user document
        final snapshot = await _firestore.collection('users').doc(user.uid).get();

        if (snapshot.exists) {
          print('===>>>> ${snapshot.data()}');
          return snapshot.data(); // Return the data as an Object
        } else {
          throw AppException('User data not found in Firestore');
        }
      } else {
        throw AppException('No user is currently signed in');
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<String?> uploadAvatar(XFile data) async {
    // Upload Avatar to Firebase Storage
    final storageRef = FirebaseStorage.instanceFor(bucket: "gs://chatbubbles-c09b5.appspot.com").ref();
    try {
      final String fileName = data.path.split('/').last;
      var snapshot = await storageRef.child('avatars/$fileName').putFile(File(data.path));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      print(downloadUrl);
      return downloadUrl;
    } catch (e) {
      throw AppException(e);
    }
  }

  // Logout User
  Future<void> logoutUser() async {
    try {
      // Update user status before logging out
      await updateUser({
        'online_status': false,
      });

      // Sign out the current user from Firebase Auth
      await _firebaseAuth.signOut();

    } catch (e) {
      throw AppException('Failed to log out: $e');
    }
  }
}
