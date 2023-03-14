import 'dart:math';

import 'package:flutter/material.dart';
import 'package:khata_app/app/constants/colors.dart';
import 'package:khata_app/app/provider/theme_provider.dart';
import 'package:khata_app/app/widgets/custom_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [ElevatedButton(onPressed: () {}, child: Text("Bal: 1002"))],
      ),
      drawer: SafeArea(
        child: SizedBox(
          height: height * .5,
          child: Drawer(
            shadowColor: AppColors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: width * .01),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.cloud_upload),
                            Text("Change Theme"),
                            Switch(
                                value:
                                    Provider.of<ThemeProvider>(context).isDark,
                                onChanged: (value) {
                                  Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .changeTheme();
                                })
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.cloud_upload),
                            Text("Backup"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.restore),
                            Text("Restore"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.password_rounded),
                            Text("Change Password"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.currency_exchange_outlined),
                            Text("Change Currency"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.article_outlined),
                            Text("Terms & Conditions"),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.share),
                            Text("Share"),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewExpanse(context, width);
        },
        child: Icon(Icons.add),
      ),
      body: CustomTileListWidget(),
    );
  }

  addNewExpanse(context, width) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text('Add a new account'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Account Name"),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Cancel")),
                      ElevatedButton(onPressed: () {}, child: Text("Save"))
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
