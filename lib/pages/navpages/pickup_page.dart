import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import '../../widgets/my_button.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;
    String? _dropdownValue;

    void dropdownCallBack(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    void openPage() {}

    final typeOfWasteTextField = DropdownButtonFormField(
      items: const [
        DropdownMenuItem<String>(
          child: Text('Papier'),
          value: 'Papier',
        ),
        DropdownMenuItem<String>(
          child: Text('Carton'),
          value: 'Carton',
        ),
      ],
      value: _dropdownValue,
      onChanged: dropdownCallBack,
      style: TextStyle(
          fontSize: 12.0,
          color: Colors.black.withOpacity(0.8),
          fontFamily: 'Montserrat'),
      iconDisabledColor: AppColors.secondaryColor,
      decoration: InputDecoration(
        labelText: 'Papier ou carton',
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 12.0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: const Icon(
          Icons.menu_rounded,
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
          borderSide: BorderSide(
              color: AppColors.mainColor.withOpacity(0.5), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final telephoneTextField = TextField(
      style: const TextStyle(fontSize: 12.0),
      keyboardType: TextInputType.number,
      cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        labelText: 'Téléphone',
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
          borderSide: BorderSide(
              color: AppColors.mainColor.withOpacity(0.5), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final locationTextField = TextField(
      style: const TextStyle(fontSize: 12.0),
      keyboardType: TextInputType.text,
      cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        labelText: 'Votre emplacement',
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
          borderSide: BorderSide(
              color: AppColors.mainColor.withOpacity(0.5), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recyclez vos papier'),
          actions: [
            Stack(children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
              Container(
                width: 5.0,
                height: 5.0,
                margin: const EdgeInsets.only(left: 28.0, top: 10.0),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(50.0)),
              )
            ]),
            IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
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
                    "Évaluer l'agent",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  // value: FilterOptions.Favorites,
                  onTap: () {},
                ),
                PopupMenuItem(
                  height: 35.0,
                  child: const Text(
                    'Calendrier',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  // value: FilterOptions.All,
                  onTap: () {},
                ),
                PopupMenuItem(
                  // padding: const EdgeInsets.symmetric(vertical: 0.0),
                  height: 35.0,
                  child: const Text(
                    'Demander un collecteur',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  // value: FilterOptions.All,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                height: (height -
                        statusBar -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      typeOfWasteTextField,
                      telephoneTextField,
                      locationTextField,
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                height: (height -
                        statusBar -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lighterGrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Quantite de papier (kg)',
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed:
                              () {}, // TODO: when the button is pressed it's should decrease the quatity
                          child: const Text(
                            '-',
                            style: TextStyle(color: AppColors.secondaryColor),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.square(25.0),
                            fixedSize: const Size.fromHeight(30.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: AppColors.lighterGrey,
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 60.0,
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 22.0),
                                child: const Text('0',
                                    textAlign: TextAlign.center),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:
                              () {}, // TODO: when the button is pressed it's should increase the quatity
                          child: const Text('+'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.square(25.0),
                            fixedSize: const Size.fromHeight(30.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '1kg de papier vous rapporte 25 FCFA',
                      style: TextStyle(
                        color: AppColors.lightGrey,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: (height -
                        statusBar -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lighterGrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Prix',
                          style: TextStyle(color: AppColors.lightGrey),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '0.0 FCFA',
                          style: TextStyle(
                              fontSize: 20.0, color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    MyButton(buttonText: 'Ramasser', callBack: openPage),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
