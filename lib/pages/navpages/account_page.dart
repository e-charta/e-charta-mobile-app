import 'package:flutter/material.dart';

import '../../helper/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    List<String> titles = [
      'Edit profil',
      'Langue',
      'Mode sombre',
      'Aide',
      'Nous contacter',
      "Conditions d'utilisation",
    ];

    List<Map<String, String>> socialMedias = [
      {'linkedin': 'assets/images/LinkedIn.png'},
      {'Facebook': 'assets/images/facebook-remove.png'},
      {'Instagram': 'assets/images/Instagram.png'},
      {'Twitter': 'assets/images/Twitter.png'},
    ];

    void openPage() {}

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: (height -
                      statusBar -
                      kToolbarHeight -
                      kBottomNavigationBarHeight) *
                  0.56,
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 50.0,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            titles[index],
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.8)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: (height -
                      statusBar -
                      kToolbarHeight -
                      kBottomNavigationBarHeight) *
                  0.44,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              width: double.infinity,
              color: Colors.red,
              child: Column(
                children: const [
                  Text(
                    'Des médias sociaux',
                    style: TextStyle(color: AppColors.lightGrey),
                  ),
                  // Container(
                  //   color: Colors.blue,
                  //   width: double.maxFinite,
                  //   child: ListView.builder(itemBuilder: (context, index) {
                  //     return Container();
                  //   }),
                  // )
                ],
              ),
            )
          ],
        ));
  }
}
