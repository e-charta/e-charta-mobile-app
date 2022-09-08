import 'package:flutter/material.dart';

class PickupPage extends StatelessWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recyclez vos papier'),
      ),
      body: const Center(
        child: Text('Pickup Page'),
      ),
    );
  }
}
