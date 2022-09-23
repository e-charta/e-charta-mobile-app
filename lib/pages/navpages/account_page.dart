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
      {'socialMediaName': 'linkedin', 'image': 'assets/images/LinkedIn.png'},
      {'socialMediaName': 'Facebook', 'image': 'assets/images/Facebook.png'},
      {'socialMediaName': 'Instagram', 'image': 'assets/images/Instagram.png'},
      {'socialMediaName': 'Twitter', 'image': 'assets/images/Twitter.png'},
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
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20.0),
              height: (height -
                      statusBar -
                      kToolbarHeight -
                      kBottomNavigationBarHeight) *
                  0.06,
              child: const Text(
                'Des médias sociaux',
                style: TextStyle(fontSize: 12.0, color: AppColors.lightGrey),
              ),
            ),
            Container(
                height: (height -
                        statusBar -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.38,
                padding: const EdgeInsets.symmetric(),
                width: double.infinity,
                child: ListView.builder(
                    itemCount: socialMedias.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.maxFinite,
                        height: 50.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                width: 40.0,
                                margin: const EdgeInsets.only(right: 15.0),
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          '${socialMedias[index]['image']}'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Text(
                                '${socialMedias[index]['socialMediaName']}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
