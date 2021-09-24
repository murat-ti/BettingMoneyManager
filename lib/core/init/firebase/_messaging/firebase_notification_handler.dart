import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification_handler.dart';

class FirebaseNotifications {
  BuildContext? buildContext;

  void setupFirebase(BuildContext? context) {
    NotificationHandler.initNotification(context);
    firebaseCloudMessagingListener(context);
    buildContext = context;
  }

  void firebaseCloudMessagingListener(BuildContext? context) async {
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      if (Platform.isAndroid) {
        showNotification(remoteMessage.data['title'], remoteMessage.data['body']);
      } else if (Platform.isIOS) {
        showNotification(remoteMessage.notification!.title, remoteMessage.notification!.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      if (Platform.isIOS) {
        showDialog(
          context: buildContext!,
          builder: (context) => CupertinoAlertDialog(
            title: Text('${remoteMessage.notification!.title}'),
            content: Text('${remoteMessage.notification!.body!}'),
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
    });
  }

  static void showNotification(String? title, String? body) async {
    var androidChannel = AndroidNotificationDetails(
      'flutter_fcm',
      'Flutter FCM',
      'Flutter FCM Description',
      autoCancel: false,
      ongoing: true,
      importance: Importance.high,
      priority: Priority.high,
      //styleInformation: BigTextStyleInformation(''),//for big text
    );

    var iosChannel = IOSNotificationDetails();

    var platForm = NotificationDetails(
      android: androidChannel,
      iOS: iosChannel,
    );

    await NotificationHandler.firebaseLocalNotificationPlugin.show(0, title, body, platForm, payload: 'My Payload');
  }
}
