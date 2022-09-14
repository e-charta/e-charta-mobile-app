import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helper/colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/custom_text_field.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({Key? key}) : super(key: key);

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  final TextEditingController _dateFieldController = TextEditingController();
  final TextEditingController _timeFieldController = TextEditingController();
  final TextEditingController _telephoneFieldController =
      TextEditingController();
  final TextEditingController _locationFieldController =
      TextEditingController();
  final TextEditingController _quantityFieldController =
      TextEditingController();
  int quantity = 0;
  double price = 0;
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double statusBar = MediaQuery.of(context).padding.top;

    void dropdownCallBack(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _dropdownValue = selectedValue;
        });
      }
    }

    void _openPage() {
      print('Type: $_dropdownValue');
      print('Date: $_dateFieldController');
      print('Time: $_timeFieldController');
      print('Telephone: $_telephoneFieldController');
      print('Location: $_locationFieldController');
      print('Quatity: $_quantityFieldController');
      print('Price: $price');
    }

    void _showDatePicker(BuildContext context) async {
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _dateFieldController.text =
              DateFormat('EEE, dd-MM-yyyy').format(pickedDate);
        });
      });
    }

    void _showTimePicker(BuildContext context) async {
      await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 0, minute: 0),
      ).then((pickedTime) {
        if (pickedTime == null) {
          return;
        }
        setState(() {
          _timeFieldController.text =
              '${pickedTime.hour.toString().padLeft(2, '0')} : ${pickedTime.minute.toString().padLeft(2, '0')}';
        });
      });
    }

    void calculatePrice() {
      setState(() {
        price = quantity * 25;
      });
    }

    void addWastePaperQuatity() {
      setState(() {
        quantity++;
        _quantityFieldController.text = quantity.toString();
        calculatePrice();
      });
    }

    void reduceWastePaperQuatity() {
      if (quantity > 0) {
        quantity--;
        setState(() {
          _quantityFieldController.text = quantity.toString();
          calculatePrice();
        });
      }
    }

    void showAlertDialogBox(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: AlertDialog(
                title: const Text(
                  "Choisissez la date et l'heur souhaitées",
                  style: TextStyle(fontSize: 12.0, color: AppColors.lightGrey),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      editingController: _dateFieldController,
                      icon: Icons.date_range,
                      lableText: 'Date de ramassage',
                      isTap: true,
                      isReadOnly: true,
                      inputType: TextInputType.number,
                      openPicker: () => _showDatePicker(context),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextField(
                      editingController: _timeFieldController,
                      icon: Icons.alarm,
                      lableText: 'Heure de ramassage',
                      isTap: true,
                      isReadOnly: true,
                      inputType: TextInputType.number,
                      openPicker: () => _showTimePicker(context),
                    ),
                  ],
                ),
                actions: <Widget>[
                  SizedBox(
                    width: double.maxFinite,
                    child: MyButton(
                      buttonText: 'Planifier le ramassage',
                      callBack: _openPage,
                    ),
                  )
                ],
              ),
            );
          });
    }

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
                      CustomTextField(
                        editingController: _telephoneFieldController,
                        icon: Icons.phone,
                        lableText: 'Téléphone',
                        inputType: TextInputType.number,
                      ),
                      CustomTextField(
                        editingController: _locationFieldController,
                        icon: Icons.place,
                        lableText: 'Votre emplacement',
                        inputType: TextInputType.text,
                      ),
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
                              reduceWastePaperQuatity, // TODO: when the button is pressed it's should decrease the quatity
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
                            controller: _quantityFieldController,
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
                              addWastePaperQuatity, // TODO: when the button is pressed it's should increase the quatity
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
                      children: [
                        const Text(
                          'Prix',
                          style: TextStyle(color: AppColors.lightGrey),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$price FCFA',
                          style: const TextStyle(
                              fontSize: 20.0, color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    MyButton(
                        buttonText: 'Ramasser',
                        callBack: () => showAlertDialogBox(context)),
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
