import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/pickupPageWidgets/evaluate_individual_agent.dart';

class EvaluateAgentPage extends StatelessWidget {
  const EvaluateAgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void backToPreviousPage() {}

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: "Évaluer l'agent",
        callback: backToPreviousPage,
      ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              width: double.infinity,
              height: 90.0,
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
                  ]),
              child: EvaluateIndividualAgent(),
            );
          }),
    );
  }
}
