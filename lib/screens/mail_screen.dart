import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tweet_vote_app/controllers/mail_controller.dart';

class MailScreen extends GetView<MailController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Mail"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 0.82,
              height: MediaQuery.of(context).size.height * 0.08,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.002,
                  left: MediaQuery.of(context).size.height * 0.008,
                  right: MediaQuery.of(context).size.height * 0.008,
                  bottom: MediaQuery.of(context).size.height * 0.002),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              child: TextField(
                controller: controller.mailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: 'Mail',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.6,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (controller.mailController.text.isEmail) {
                      controller.generateCsvFile(
                          controller.tweetController.sqfdata,
                          controller.mailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Check your mailbox!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05)),
                          duration: Duration(milliseconds: 500)));
                    } else
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please just mail",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.05)),
                          duration: Duration(milliseconds: 500)));
                  },
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  label: Text(
                    "I WANT DATA !",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
