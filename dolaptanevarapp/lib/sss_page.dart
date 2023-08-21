import 'package:flutter/material.dart';

class SssPage extends StatelessWidget {
  final List<FAQItem> faqList = [
    FAQItem(
      question: 'Dolaptaki meyve ve sebzelerle nasıl tarifler oluşturabilirim?',
      answer: 'Dolaptaki meyve ve sebzelerle tarif oluşturmak için "Tarif Oluştur" sayfasına gidin. Orada mevcut malzemelerinizi seçip, size uygun tarifleri görebilirsiniz.',
    ),
    FAQItem(
      question: 'Bir tarifi nasıl kaydedebilirim?',
      answer: 'Bir tarifi kaydetmek için tarif detay sayfasına gidin ve sayfanın altında bulunan "Kaydet" düğmesine tıklayın. Bu şekilde tarif favorilerinize eklenir.',
    ),
  ];



    @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sıkça Sorulan Sorular'),
            backgroundColor: Colors.redAccent,
          ),
          body: ListView.builder(
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(faqList[index].question),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(faqList[index].answer),
                  ),
                ],
              );
            },
          ),
        );
      }
    }

    class FAQItem {
      final String question;
      final String answer;

      FAQItem({required this.question, required this.answer});
    }

    void main() {
      runApp(MaterialApp(
        home: SssPage(),
      ));
    }