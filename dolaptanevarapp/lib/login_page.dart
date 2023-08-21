import 'package:dolaptanevarapp/home_page.dart';
import 'package:dolaptanevarapp/register_page.dart';
import 'package:dolaptanevarapp/utulities/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Scaffold'ın arka planını şeffaf yapın
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_pic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
      
                // Hello Again
                Text(
                  "Bilinçli Bir Tüketici Olma Yolunda!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bebasNeue(
                    fontSize: 34, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                  
                ),
                SizedBox(height: 10),
      
                Text(
                  "Seni Özledik, Hoşgeldin.",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),),
                SizedBox(height: 50),
      
                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "E-posta adresinizi girin", 
                        border: OutlineInputBorder(), // Text alanı etrafında kenarlığı olan bir kutu oluşturur
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 10), // E-posta alanı ile parola alanı arasında bir boşluk ekledim
      
                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.white),
                    ),
                    child: const TextField(
                      obscureText: true, // Parolanın gizli karakterlerle görüntülenmesini sağlar
                      decoration: InputDecoration(
                        hintText: "Parolanızı girin",
                        border: OutlineInputBorder(), // Text alanı etrafında kenarlığı olan bir kutu oluşturur
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 20), // Parola alanı ile giriş butonu arasında bir boşluk ekledim
      
                // sign in button
                ElevatedButton(
                  onPressed: () {
                    // Giriş butonuna tıklandığında yapılacak işlemler
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
                  },
                   style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple), // Buton arka plan rengi
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Butonun kenar yuvarlatması
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 48)), // Butonun minimum boyutu
                ),
                  child: Text("Giriş Yap",
                  style: TextStyle(fontSize: 18),),
                ),
      
                SizedBox(height: 50), // Giriş butonu ile "not a member? register now" metni arasında bir boşluk ekledim

                // Google ile giriş yap butonu
                ElevatedButton(
                  onPressed: () {
                    signInWithGoogle();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple), // Buton arka plan rengi
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Butonun kenar yuvarlatması
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 48)), // Butonun minimum boyutu
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google_logo.png", // Google logosunun olduğu bir resim ekleyin
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 10), // Logo ile metin arasında bir boşluk ekleyin
                      Text("Google ile Giriş Yap",
                        style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),

                // Giriş sayfası sınıfınızın altına ekleyin
                // not a member? register now
                GestureDetector(
                  onTap: () {
                    // "Üye değil misiniz? Hemen kaydolun!" metnine tıklandığında yapılacak işlemler
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()), // Yeni sayfanın adını ve sınıfını burada belirtin
                    );
                  },
                  child: Text(
                    "Üye değil misiniz? Hemen kaydolun!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, // Metni altı çizili gösterir
                    ),
                  ),
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}
