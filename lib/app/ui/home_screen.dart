import 'package:flutter/material.dart';
import 'package:khata_app/app/widgets/custom_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [ElevatedButton(onPressed: () {}, child: Text("Bal: 1002"))],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SizedBox(
              height: 500,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.cloud_upload),
                        Text("Backup"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.restore),
                        Text("Restore"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.password_rounded),
                        Text("Change Password"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.currency_exchange_outlined),
                        Text("Change Currency"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.article_outlined),
                        Text("Terms & Conditions"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: CustomTileListWidget(),
    );
  }

  Widget addNewExpanse() {
    return Container();
  }
}
