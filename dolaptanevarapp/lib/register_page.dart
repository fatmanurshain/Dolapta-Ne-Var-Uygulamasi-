import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


class RegisterPage extends StatelessWidget {
   final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Üye Ol"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "E-posta adresinizi girin",
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Parolanızı girin",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  () async {
                    try {
                      String email = "kullanici_eposta@example.com"; // Buraya e-posta alanındaki veriyi alın
                      String password = "kullanici_parola"; // Buraya parola alanındaki veriyi alın

                      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // Giriş başarılı ise, kullanıcıyı ana sayfaya yönlendirin
                      if (userCredential.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } else {
                        // Giriş başarısız ise kullanıcıya hata mesajı gösterin
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Giriş başarısız. Lütfen e-posta ve parolanızı kontrol edin.")),
                        );
                      }
                    } catch (e) {
                      // Hata durumunda işlemleri burada yönetebilirsiniz.
                      print("Giriş işlemi başarısız: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Bir hata oluştu. Lütfen daha sonra tekrar deneyin.")),
                      );
                    }
                  };
                },
                
                child: Text("Üye Ol"),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

