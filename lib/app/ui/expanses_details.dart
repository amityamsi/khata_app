import 'package:flutter/material.dart';

class ExpansesDetailScreen extends StatelessWidget {
  const ExpansesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Account Name"),
        actions: [
          const Text("Bal: ₹501.0"),
          IconButton(onPressed: () {}, icon: Icon(Icons.share))
        ],
      ),
      body: Column(),
    ));
  }
}
