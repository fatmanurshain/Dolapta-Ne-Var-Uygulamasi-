import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
            width: 400,
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/profile.png'),
                child: Image(
                  image: AssetImage('assets/profile.png'),
                  height: 160,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          Text(
            'Kullanıcı Adı', // Kullanıcının adını buraya ekleyin.
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),

          Text(
            'Email Adresi', // Kullanıcının e-posta adresini buraya ekleyin.
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),

          SizedBox(
            width: 350,
            height: 50,
            child: TextButton(
              onPressed: () {
                // Profili Düzenle butonuna tıklandığında yapılacak işlemi burada belirleyebilirsiniz.
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle, 
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: 8), // İkon ile metin arasında boşluk eklemek için SizedBox kullandım
                  Text(
                    'Profili Düzenle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, 
                      fontSize: 16),
                    
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
