import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void backToPreviousPage() {}

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Calendrier',
        callback: backToPreviousPage,
      ),
      body: const Center(
        child: Text('Calendar page'),
      ),
    );
  }
}
