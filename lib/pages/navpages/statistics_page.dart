import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/statisticsPageWidgets/user_balance.dart';
import '../../helper/colors.dart';
import '../../widgets/statisticsPageWidgets/top_10_best_recyclers_list.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
        actions: [
          PopupMenuButton(
            elevation: 5,
            // onSelected: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                height: 35.0,
                child: const Text(
                  "Récupérer de l'argent",
                  style: TextStyle(fontSize: 12.0),
                ),
                // value: FilterOptions.Favorites,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: (height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight -
                    statusBar) *
                0.25,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const UserBalance(),
          ),
          Container(
            width: double.infinity,
            height: (height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight -
                    statusBar) *
                0.50,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: (width - 40) * 0.6,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Quantité de papier recyclés',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      CircularPercentIndicator(
                        percent: 0.3,
                        radius: 80,
                        lineWidth: 20,
                        progressColor: AppColors.secondaryColor,
                        backgroundColor:
                            AppColors.secondaryColor.withOpacity(0.3),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          '30 kg',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                      ),
                      const Text(
                        'Niveau 1 : 100 kg',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (width - 40) * 0.4,
                  // color: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Les collecteurs  que  vous possédez',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            width: 40,
                            height: 40,
                            alignment: const Alignment(0, 0),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Nombre de produits achetés',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            width: 40,
                            height: 40,
                            alignment: const Alignment(0, 0),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (height -
                    kToolbarHeight -
                    kBottomNavigationBarHeight -
                    statusBar) *
                0.25,
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    top: 15.0,
                  ),
                  child: const Text(
                    'Top 10 des meilleurs recycleurs',
                    style: TextStyle(color: AppColors.lightGrey),
                  ),
                ),
                const Top10BestRecyclersList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
