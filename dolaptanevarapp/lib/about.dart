import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Hakkında'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
              ),
              SizedBox(height: 16),
              Text(
                'D O L A P T A  N E  V A R',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Sürüm 1.0.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'V İ S Y O N',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                '"DolapDostu", kullanıcıların evlerinde bulunan sınırlı malzemelerle lezzetli yemek tarifleri oluşturmasını sağlayan lider bir mobil uygulama olmak için çabalıyor. Kullanıcılarımızın dolaplarındaki malzemeleri en iyi şekilde değerlendirerek ekonomik, çevre dostu ve keyifli bir yemek deneyimi yaşamalarına yardımcı oluyoruz. DolapDostu, yaratıcı ve kolay tarifleri kullanıcılarımızın hayatını kolaylaştıran bir arkadaş gibi sunarak, herkesin mutfakta ustalaşabileceği ve besleyici yemekler pişirebileceği bir platform oluşturuyoruz.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Text(
                'M İ S Y O N',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Text('Mutfakta her anınıza değer katmak, DolapDostunun temel misyonudur. Misyonumuzu gerçekleştirmek için:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height:10),
              Text('1) Kullanıcı Odaklılık: Kullanıcılarımızın ihtiyaçlarını ve beklentilerini anlamak için sürekli çaba sarf ediyoruz. Onların geri bildirimlerini dinliyor ve uygulamamızı sürekli olarak geliştiriyoruz.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              Text('2) Lezzet ve Sağlık Dengesi: Dolapta bulunan malzemelerle hazırlanan tariflerimiz, hem lezzetli hem de besleyici olacak şekilde tasarlanır. Sağlıklı ve dengeli beslenmeyi teşvik ediyoruz.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text('3) Kullanım Kolaylığı: Kullanıcılarımızın uygulamamızı rahatlıkla kullanabilmeleri için basit ve kullanıcı dostu bir arayüz sunuyoruz. Yemek tariflerine kolayca erişebilme ve malzemeleri arayarak tarifleri filtreleme imkanları sunuyoruz.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height:10),
              Text('4) Sürdürülebilirlik ve Tasarruf: Dolapta bulunan malzemelerin israfını önleyerek sürdürülebilir bir mutfak uygulaması olarak katkıda bulunuyoruz. Ekonomik ve çevre dostu yemek tarifleri sunarak kullanıcılarımıza tasarruf etme fırsatı veriyoruz.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Handle "Contact Us" button tap
                },
                child: Text('Bize Ulaşın'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
