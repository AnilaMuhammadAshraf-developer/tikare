import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // iOS permissions
  
     NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
   );
  
    // 🔽 Add this block to initialize local notifications plugin
  const AndroidInitializationSettings androidInitSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher'); // <-- your small icon

  const InitializationSettings initSettings = InitializationSettings(
    android: androidInitSettings,
  );

  await _flutterLocalNotificationsPlugin.initialize(initSettings);
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  
    // Foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showLocalNotification(message);
    });

    // When app is opened by tapping on notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Navigate or handle tap
    });

    // Background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }else {
    print("User declined or has not accepted permission");
  }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    // Handle background messages
    print("background push notifications");
  }


  static void showLocalNotification(RemoteMessage message) {
    
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
    );
  }

  static Future<void> getDeviceToken() async{
       String? token = await _messaging.getToken();
      print("Device Token: $token");
  }
}
