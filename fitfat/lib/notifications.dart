import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify extends StatelessWidget {
  // Initializing the plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    // Initializing the settings for the plugin
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    // Initializing the plugin with the settings
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Notification Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Defining the notification details
              const AndroidNotificationDetails androidNotificationDetails =
                  AndroidNotificationDetails(
                'channel_id',
                'channel_name',
                importance: Importance.max,
              );

              const NotificationDetails notificationDetails =
                  NotificationDetails(android: androidNotificationDetails);

              // Scheduling the notification to be shown after 5 seconds
              flutterLocalNotificationsPlugin.schedule(
                0,
                'Flutter Notification Example',
                'This is a notification example',
                DateTime.now().add(const Duration(seconds: 5)),
                notificationDetails,
              );
            },
            child: const Text('Show Notification'),
          ),
        ),
      ),
    );
  }
}
