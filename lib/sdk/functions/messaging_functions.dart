import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../src/utils/logger/logger.dart';
import '../../src/utils/utils.dart';

class NotificationHandler {
  static final _fcm = FirebaseMessaging.instance;
  static final _firestore = FirebaseFirestore.instance;

  /// upload the [deviceToken] for FCM
  static Future<String?> uploadDeviceToken({required String userId}) async {
    final _token = await _fcm.getToken();
    await _firestore.collection('users').doc(userId).set(
      {
        'deviceToken': _token,
      },
      SetOptions(merge: true),
    );

    return _token;
  }

  /// Clear the device token when the [User] is logged out or turned off their notifications
  static Future<void> clearDeviceToken({required String userId}) async {
    await _firestore.collection('users').doc(userId).set(
      {
        'deviceToken': "",
      },
      SetOptions(merge: true),
    );

  }

  /// Configure the app for FCM notifications
  void configureFcm(BuildContext context) {
    void _showToast(String msg) {
      Fluttertoast.showToast(
        msg: msg,
        textColor: Theme
            .of(context)
            .textTheme
            .bodyMedium
            ?.color,
        backgroundColor: Theme
            .of(context)
            .brightness == Brightness.dark
            ? Theme
            .of(context)
            .backgroundColor
            : Colors.grey[800],
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_LONG,
        fontSize: screenHeight * 0.01511817,
      );
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      // final String data = message['notification']['body'].toString();
      final String data = message.notification?.body ?? "";
      _showToast("$data \nRefresh, to see the change");
    });
  }
}