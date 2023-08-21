import 'package:dolaptanevarapp/profile_page.dart';
import 'package:dolaptanevarapp/security_page.dart';
import 'package:dolaptanevarapp/sss_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Ayarlar'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader(context, 'Genel Ayarlar'),
          _buildSwitchListTile(context, 'Karanlık Mod', false),
          _buildSwitchListTile(context, 'Bildirimler', true),
          _buildSectionHeader(context, 'Hesap'),
          _buildAccountTile(context, 'Profil', Icons.person),
          _buildAccountTile(context, 'Güvenlik', Icons.lock),
          _buildSectionHeader(context, 'Destek'),
          _buildSupportTile(context, 'SSS', Icons.question_answer),
          _buildSupportTile(context, 'İletişim', Icons.mail),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[300],
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchListTile(BuildContext context, String title, bool value) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: (newValue) {
          // Switch değer değiştiğinde yapılacak işlemler burada gerçekleştirilebilir.
        },
      ),
    );
  }

  Widget _buildAccountTile(BuildContext context, String title, IconData iconData) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: () {
        if (title == 'Güvenlik') {
        // "Güvenlik" tile'ına tıklandığında "Güvenlik Sayfası"na yönlendirme yapın
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecurityPage()),
        );
      }else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
        
      },
    );
  }

 Widget _buildSupportTile(BuildContext context, String title, IconData iconData) {
  return ListTile(
    leading: Icon(iconData),
    title: Text(title),
    onTap: () {
      if (title == 'SSS') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SssPage()), // SSSPage widgetını eklediğinizden emin olun
        );
      } else if (title == 'İletişim') {
        // İletişim sayfasına yönlendirme işlemini burada gerçekleştirin, eğer varsa
      }
    },
  );
}
}