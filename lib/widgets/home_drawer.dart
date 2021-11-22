import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peoplesafety/Screens/faq_screen.dart';
import 'package:peoplesafety/Screens/help_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap:  () {tapHandler();} ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blue,
            child: const Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
              'Help',
              Icons.info,
                  () {
                  Get.to(HelpScreen());
              }
          ),
          buildListTile(
              'FAQ',
              Icons.help,
                  () {
                  Get.to(FAQScreen());
              }
          )
        ],
      ),
    );
  }
}
