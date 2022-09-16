import 'package:flutter/material.dart';

import './top_10_best_recyclers_item.dart';

class Top10BestRecyclersList extends StatelessWidget {
  const Top10BestRecyclersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 200.0,
              margin: index == 0
                  ? const EdgeInsets.only(
                      left: 20.0, right: 10.0, top: 10.0, bottom: 10.0)
                  : index == 9
                      ? const EdgeInsets.only(
                          right: 20.0, left: 10.0, top: 10.0, bottom: 10.0)
                      : const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: const Top10BestRecyclersItem(),
            );
          }),
    );
  }
}
