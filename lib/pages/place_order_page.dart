import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../helper/colors.dart';
import '../widgets/my_button.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  int? selectedValue = 0;
  final selectedColor = AppColors.secondaryColor;
  final unselectedColor = AppColors.lightGrey;

  void confirmTransaction() {}

  final telephoneTextField = TextField(
    style: const TextStyle(fontSize: 12.0),
    keyboardType: TextInputType.text,
    cursorColor: AppColors.lightGrey,
    decoration: InputDecoration(
      labelText: 'Telephone',
      labelStyle: TextStyle(
        color: Colors.black.withOpacity(0.3),
        fontSize: 12.0,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: const Icon(
        Icons.phone,
        color: AppColors.secondaryColor,
        size: 16.0,
      ),
      filled: true,
      fillColor: AppColors.lighterGrey,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.mainColor.withOpacity(0.5), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  final locationTextField = TextField(
    style: const TextStyle(fontSize: 12.0),
    keyboardType: TextInputType.text,
    cursorColor: AppColors.lightGrey,
    decoration: InputDecoration(
      labelText: 'Location',
      labelStyle: TextStyle(
        color: Colors.black.withOpacity(0.3),
        fontSize: 12.0,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: const Icon(
        Icons.place,
        color: AppColors.secondaryColor,
        size: 16.0,
      ),
      filled: true,
      fillColor: AppColors.lighterGrey,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.mainColor.withOpacity(0.5), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    void goToPrevoiusPage() {}
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          appBarText: 'Mode de paiement',
          callback: goToPrevoiusPage,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        kToolbarHeight) *
                    0.6,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: RadioListTile<int>(
                        activeColor: AppColors.secondaryColor,
                        value: 0,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        title: const Text('Orange Money'),
                        subtitle: const Text(
                          'Validé via votre compte OM',
                          style: TextStyle(fontSize: 8.0),
                        ),
                        secondary: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Orange-Money-Logo.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: RadioListTile<int>(
                        activeColor: AppColors.secondaryColor,
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        title: const Text("Cash"),
                        subtitle: const Text(
                          "Paiement à la livraison",
                          style: TextStyle(fontSize: 8.0),
                        ),
                        // secondary: Icon(Icons.attach_money_outlined),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      'Informations sur la livraison',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    const SizedBox(height: 10.0),
                    telephoneTextField,
                    const SizedBox(height: 10.0),
                    locationTextField,
                  ],
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        kToolbarHeight) *
                    0.05,
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        kToolbarHeight) *
                    0.33,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.lighterGrey,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      )
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Coût :',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            '18000 FCFA',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Livrqison :',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            '500 FCFA',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            '2300 FCFA',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      MyButton(
                        buttonText: 'Passer la commande',
                        callBack: confirmTransaction,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
