import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  final channelID = 'appNotifications';
  final channelName = 'App Notifications';
  final channelDescription = 'App Notification Channnel';

  var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  NotificationDetails platformChannelInfo;
  var notificationID = 100;

  void init() {
    var initializationSettingsAndroid = new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings(
      onDidReceiveLocalNotification: (int id, String title, String body, String payload) { return null; }
    );
    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification
    );

    var androidPlatformChannelInfo = AndroidNotificationDetails(
      channelID,
      channelName,
      channelDescription,
      importance: Importance.Max,
      priority: Priority.High,
      ticker: 'ticker'
    );

    var iOSPlatformChannelInfo = IOSNotificationDetails();
    platformChannelInfo = NotificationDetails(
      androidPlatformChannelInfo,
      iOSPlatformChannelInfo
    );

  }

  Future onSelectNotification(var payload) async {
    if (payload != null) {
      print('notificationSelected: payload=$payload.');
    }
    //... redirect to purchasing membership?
  }

  Future<void> sendNotificationsNow(String title, String body, String payload) async {
    flutterLocalNotificationsPlugin.show(
      notificationID++,
      title,
      body,
      platformChannelInfo,
      payload: payload
    );
  }

  Future<void> sendNotificationsWhen(String title, String body, DateTime when, String payload) async {
    flutterLocalNotificationsPlugin.schedule(
      notificationID++,
      title,
      body,
      when,
      platformChannelInfo,
      payload: payload
    );
  }

  Future<List<PendingNotificationRequest>> getPendingNotificationRequests() async {
    return flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
  
}