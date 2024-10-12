
# Real-Time Chat Interface with Firebase Integration - Educatly 2024

## Overview

This project implements a real-time chat interface using Flutter and Firebase. The app features user authentication, real-time messaging, online status, and typing indicators. It follows a dark theme design based on the [Text Chat Bubbles UI Kit for Figma](https://www.figma.com/design/qnsKfFoD4hgWVj5Tx8Ep5R/Text-Chat-Bubbles-UI-Kit-for-Figma-(Community)?node-id=63-4715). The app is built exclusively for Android devices.

## Features

1. **User Authentication**
   - Sign up, Login, and Logout functionalities using Firebase Auth.
   - Secure storage of user credentials with Flutter Secure Storage.

2. **Real-Time Messaging**
   - Firebase Firestore is used for real-time messaging.
   - Send and receive messages instantly.
   - Chat history is displayed with message timestamps.

3. **Online Status & Typing Indicators**
   - Online status indicators show users’ availability.
   - Typing indicators are displayed in real-time.

4. **Chat Interface**
   - Clean and user-friendly chat UI with chat bubbles.
   - User avatars and timestamps for messages.
   - A text input field and send button.

5. **State Management**
   - The app uses Bloc for state management.

6. **Push Notifications**
   - Firebase Cloud Messaging (FCM) is used for push notifications.

## Firebase Integration Setup

1. **Firebase Project Setup**:
   - Create a Firebase project in [Firebase Console](https://console.firebase.google.com/).
   - Add your Android app and download the `google-services.json` file.
   - Place the `google-services.json` file in `android/app`.

2. **Enable Firebase Services**:
   - In the Firebase Console, enable Firebase Authentication, Firestore, and Cloud Messaging.
   - Ensure these services are correctly configured for your project.

3. **Google Service Account**:
   - For Firebase Admin tasks, create a **Google Service Account** via the [Google Cloud Console](https://console.cloud.google.com/).
   - Download the service account key as a JSON file.
   - This key should be used for server-side tasks, such as sending push notifications with FCM.

4. **Add Firebase SDKs**:
   - Add the required Firebase SDKs to your `pubspec.yaml` file:
     ```yaml
     dependencies:
       firebase_core: latest_version
       firebase_auth: latest_version
       cloud_firestore: latest_version
       firebase_messaging: latest_version
     ```
   - Run `flutter pub get` to install these packages.

5. **Firebase Cloud Messaging (FCM)**:
   - To send push notifications using FCM, use the service account to generate access tokens.
   - The function `_getAccessToken()` in `fcm_service.dart` is responsible for obtaining access tokens via the service account credentials.

   Example function to obtain an access token:
   ```dart
   Future<String> _getAccessToken() async {
     List<String> scopes = [
       'https://www.googleapis.com/auth/firebase.messaging',
       'https://www.googleapis.com/auth/firebase.database',
       'https://www.googleapis.com/auth/userinfo.email',
     ];

     var serviceAccountCredentials = auth.ServiceAccountCredentials.fromJson(kServiceAccountInfo);

     final auth.AutoRefreshingAuthClient client = await auth.clientViaServiceAccount(
       serviceAccountCredentials,
       scopes,
     );

     String accessToken = client.credentials.accessToken.data;
     client.close();

     return accessToken;
   }
   ```

## Installation

### Prerequisites
- Flutter SDK: 3.24.3
- Dart: 3.5.3
- Android Studio or an Android emulator.
- Firebase account with a project setup.

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Mahm0ud-Ahmed/chat_bubbles.git
   ```
2. Navigate to the project directory:
   ```bash
   cd chat_bubbles
   ```
3. Install the required dependencies:
   ```bash
   flutter pub get
   ```
4. Set up Firebase:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Add an Android app to your Firebase project.
   - Download the `google-services.json` file and place it in the `android/app` directory.
   - Enable Firebase Auth, Firestore, and Cloud Messaging in the Firebase Console.

5. Run the application:
   ```bash
   flutter run
   ```

## Screenshots

<p>
    <img src="https://github.com/user-attachments/assets/3561fdd8-e8aa-4572-93c0-70bd8bbdac51" width="200" />
    <img src="https://github.com/user-attachments/assets/38dd0783-5934-49c9-9910-7ea08dd59b33" width="200" />
    <img src="https://github.com/user-attachments/assets/8b583775-f7d0-47fa-ae95-dfc1787db663" width="200" />
    <img src="https://github.com/user-attachments/assets/4984d8b6-815f-4438-9b4b-aa329b00ffb0" width="200" />
    <img src="https://github.com/user-attachments/assets/a2f6d9d6-7f0b-4ffd-8a34-eeebd37fd37b" width="200" />
    <img src="https://github.com/user-attachments/assets/464c37ed-5452-475c-a654-8722613d2027" width="200" />
   <img src="https://github.com/user-attachments/assets/b17e6a9b-f5e0-4d7d-ac6e-f28d86fa5fcc" width="200" />
   <img src="https://github.com/user-attachments/assets/fed479b2-6fff-43fa-a3ba-b51fefc6c06c" width="200" />
   <img src="https://github.com/user-attachments/assets/244d697e-c768-4630-b223-3c66811abbde" width="200" />
   <img src="https://github.com/user-attachments/assets/0d9c7d1f-9d2d-4f78-9cb0-e8098c414e91" width="200" />
   
</p>

## Usage

1. **Sign Up/Login**: Users can register and log in using email and password.
2. **Chat**: Users can chat in real-time, see who is online, and view typing indicators.
3. **Logout**: Users can log out of the app, and their session will be securely ended.

## Testing

To run the app on an emulator or Android device, follow the installation steps and execute:
```bash
flutter run
```

## Contribution

Feel free to fork this repository and create a pull request for any improvements or new features.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

