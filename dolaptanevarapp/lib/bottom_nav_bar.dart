import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_page.dart';
import 'shopping_page.dart';

class CustomCurvedNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  CustomCurvedNavigationBar({
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  _CustomCurvedNavigationBarState createState() =>
      _CustomCurvedNavigationBarState();
}

class _CustomCurvedNavigationBarState extends State<CustomCurvedNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.selectedIndex,
      height: 50.0,
      backgroundColor: Colors.red,
      items: <Widget>[
        Icon(
          Icons.home, 
          size: 30),
        Icon(
          Icons.search, 
          size: 30),
        Icon(
          Icons.shopping_cart_sharp, 
          size: 30),
      ],
        onTap: (index) {
          if (index == 0) {
            // 0. indekse tıklandığında 'HomePage' sayfasına yönlendirin
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Sayfa adını ve yolunu buraya yazın
            );
          } else if (index == 2) {
            // 2. indekse tıklandığında 'ShoppingListPage' sayfasına yönlendirin
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingListPage()),
            );
          } else {
            // Diğer sekmeler için, sağlanan geri çağırma fonksiyonunu çağırın
            widget.onTabChanged(index);
          }
        },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alışveriş Listesi Uygulaması',
      theme: ThemeData(primarySwatch: Colors.red),
      home: ShoppingListPage(),
    );
  }
}
