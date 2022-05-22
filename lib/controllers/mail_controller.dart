import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';
import 'package:tweet_vote_app/models/tweet.dart';

class MailController extends GetxController {
  final mailController = TextEditingController();
  late TweetController tweetController;
  late String mail;
  var csvFilePath;

  Future sendEmail(String mail) async {
    String username = 'twreportbot@gmail.com';
    String password = 'yurticikg';

    final smtpServer = gmail(username, password);
    print(csvFilePath);

    final message = Message()
      ..from = Address(username, 'TwReportBot')
      ..recipients.add(mail)
      ..subject = 'User Data'
      ..text = '${DateTime.now()}'
      ..attachments = [
        FileAttachment(File(csvFilePath))..location = Location.attachment
      ];

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void generateCsvFile(List<Tweet> data, String mail) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    List<List<dynamic>> rows = [];

    List<dynamic> row = [];
    row.add("ID");
    row.add("Tweet");
    row.add("Like");
    row.add("Dislike");
    row.add("Neutral");
    rows.add(row);
    for (int i = 0; i < data.length; i++) {
      List<dynamic> row = [];
      row.add(data[i].id);
      row.add(data[i].tweet);
      row.add(data[i].like);
      row.add(data[i].dislike);
      row.add(data[i].neutral);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);

    final file = await _localFile;

    file.writeAsString(csv);

    sendEmail(mail);
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    csvFilePath = '$path/data.csv'.toString();
    return File('$path/data.csv');
  }

  Future<String> get _localPath async {
    final directory = await Directory.systemTemp.createTemp();
    print(directory);

    return directory.path;
  }

  @override
  void onInit() {
    tweetController = Get.find<TweetController>();
    tweetController.queryAll();

    super.onInit();
  }
}
