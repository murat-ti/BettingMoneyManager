import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  static final firebaseLocalNotificationPlugin =
  FlutterLocalNotificationsPlugin();
  static BuildContext? buildContext;

  static void initNotification(BuildContext? context) {
    buildContext = context;
    var initAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotifications);

    var initSetting =
    InitializationSettings(android: initAndroid, iOS: initIOS);

    firebaseLocalNotificationPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  static Future onDidReceiveLocalNotifications(
      int id, String? title, String? body, String? payload) async {
    await showDialog(
      context: buildContext!,
      builder: (context) => CupertinoAlertDialog(
        title: Text('${title!}'),
        content: Text('${body!}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future onSelectNotification(String? payload) async {
    if (payload != null) print('Get payload $payload');
  }
}