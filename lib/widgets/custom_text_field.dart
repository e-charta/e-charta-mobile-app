import 'package:flutter/material.dart';

import '../helper/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController editingController;
  final IconData icon;
  final String lableText;
  final TextInputType inputType;
  final bool isTap;
  final bool isReadOnly;
  final VoidCallback? openPicker;
  const CustomTextField(
      {Key? key,
      required this.editingController,
      required this.icon,
      this.isTap = true,
      this.isReadOnly = false,
      this.openPicker,
      required this.inputType,
      required this.lableText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      onTap: isTap ? openPicker : () {},
      controller: editingController,
      style: const TextStyle(fontSize: 12.0),
      keyboardType: inputType,
      cursorColor: AppColors.lightGrey,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 12.0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(
          icon,
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
  }
}
