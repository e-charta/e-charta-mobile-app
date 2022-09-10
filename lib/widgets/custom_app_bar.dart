import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final VoidCallback callback;
  const CustomAppBar({
    Key? key,
    required this.appBarText,
    required this.callback,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: callback,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.7),
            ),
          );
        },
      ),
      title: Container(
        alignment: const Alignment(1, 0),
        child: Text(
          appBarText,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
