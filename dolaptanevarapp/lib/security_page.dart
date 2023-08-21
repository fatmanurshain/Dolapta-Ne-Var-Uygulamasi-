import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final _formKey = GlobalKey<FormState>();
  String _currentPassword = '';
  String _newPassword = '';
  // ignore: unused_field
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Güvenlik'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mevcut Şifre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen mevcut şifrenizi girin.';
                  }
                  // Mevcut şifrenin doğruluğunu kontrol etmek için gerekli işlemler.
                  return null;
                },
                onSaved: (value) {
                  _currentPassword = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Yeni Şifre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen yeni şifrenizi girin.';
                  }
                  // Yeni şifrenin gerekli şartları sağladığını kontrol etmek için gerekli işlemler.
                  return null;
                },
                onSaved: (value) {
                  _newPassword = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Yeni Şifre Tekrar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen yeni şifrenizi tekrar girin.';
                  }
                  if (value != _newPassword) {
                    return 'Şifreler eşleşmiyor. Lütfen doğru girdiğinizden emin olun.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value!;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Şifreyi Değiştir'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Kullanıcının mevcut oturumunu al
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          // Kullanıcının mevcut şifresini doğrulama
          AuthCredential credentials = EmailAuthProvider.credential(email: user.email!, password: _currentPassword);
          await user.reauthenticateWithCredential(credentials);

          // Kullanıcının şifresini güncelleme
          await user.updatePassword(_newPassword);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Şifreniz başarıyla değiştirildi.')),
          );
        } catch (e) {
          print("Şifre değiştirme hatası: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Şifre değiştirme işlemi başarısız oldu. Lütfen tekrar deneyin.')),
          );
        }
      } else {
        // Kullanıcı oturumu açmamışsa uygun bir hata mesajı göster
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kullanıcı oturumu açmamış. Lütfen önce giriş yapın.')),
        );
      }
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SecurityPage(),
  ));

  
}

