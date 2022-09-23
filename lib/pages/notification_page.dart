import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/pickupPageWidgets/notication_context.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double statusBar = MediaQuery.of(context).padding.top;

    void backToPreviousPage() {}

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Notification',
        callback: backToPreviousPage,
      ),
      body: Container(
        width: double.maxFinite,
        height: (height - statusBar - kToolbarHeight) * 1,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 80.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 7.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: const NotificationContent(),
              );
            }),
      ),
    );
  }
}
