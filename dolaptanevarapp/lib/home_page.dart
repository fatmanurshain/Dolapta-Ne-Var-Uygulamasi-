import 'dart:io' if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'bottom_nav_bar.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _selectedCategory = "";

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSettingsButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  void _onAboutButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }

  void _openTarif(String meyve) async {
    String url = "https://yemek.com/tarif/${meyve.toLowerCase()}-corbasi/";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Web için platform kontrolü
      if (kIsWeb) {
        // Web platformunda desteklenmediğini belirten bir mesaj gösterin
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Web platformunda URL başlatma desteklenmiyor.')),
        );
      } else {
        // Diğer platformlar için hata fırlatın
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
              'D O L A P T A  N E  V A R',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/fridge.jpg',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Dolabınızdaki Meyve Ve Sebzelerle Tarifleri Keşfedin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (String choice) {
                  if (choice == 'Ayarlar') {
                    _onSettingsButtonPressed();
                  } else if (choice == 'Hakkında') {
                    _onAboutButtonPressed();
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Ayarlar',
                      child: Text('Ayarlar'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Hakkında',
                      child: Text('Hakkında'),
                    ),
                  ];
                },
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "S E B Z E",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Domates";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Domates'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Biber";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Patlıcan'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Patlıcan";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Kabak'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Fasulye";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Fasulye'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Seçilen Kategori: $_selectedCategory",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String message = "";
                      if (_selectedCategory.isEmpty) {
                        message = "Lütfen önce bir kategori seçin.";
                      } else {
                        message = "Seçilen meyve kategorisi: $_selectedCategory";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                    child: Text('E K L E'),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'H A Y V A N S A L  G I D A',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Tavuk";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Tavuk'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Dana";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Dana'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Balık";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Balık'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Seçilen Kategori: $_selectedCategory",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String message = "";
                      if (_selectedCategory.isEmpty) {
                        message = "Lütfen önce bir kategori seçin.";
                      } else {
                        message = "Seçilen hayvansal gıda kategorisi: $_selectedCategory";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                    child: Text('E K L E'),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'B A K L A G İ L',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Mercimek";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Mercimek'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Nohut";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Nohut'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategory = "Fasulye";
                              });
                              _openTarif(_selectedCategory);
                            },
                            child: Text('Fasulye'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Seçilen Kategori: $_selectedCategory",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String message = "";
                      if (_selectedCategory.isEmpty) {
                        message = "Lütfen önce bir kategori seçin.";
                      } else {
                        message = "Seçilen baklagil kategorisi: $_selectedCategory";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    },
                    child: Text('E K L E'),
                  ),
                ],
              ),
            ),
          ),

          // ... Diğer kodlar ...
        ],
      ),
      bottomNavigationBar: CustomCurvedNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
