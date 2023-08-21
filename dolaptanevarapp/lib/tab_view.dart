import 'package:flutter/material.dart';

class AtomikAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;

  AtomikAppBar({
    required this.title,
    this.backgroundColor = Colors.red, // Varsayılan arkaplan rengi
    this.textColor = Colors.white, // Varsayılan metin rengi
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      leading: IconButton(
        onPressed: () {},
        icon: IconButton(
          icon:const Icon(Icons.menu), 
          onPressed: () { }),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)
            )
          ),
           actions: [
        IconButton(
          onPressed: () {
            // Kullanıcıyı düzenle işlemi için yapılacak işlemler
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
