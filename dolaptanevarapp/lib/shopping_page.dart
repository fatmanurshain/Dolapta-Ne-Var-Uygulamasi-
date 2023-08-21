import 'package:flutter/material.dart';


class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  TextEditingController _productController = TextEditingController();
  List<String> _shoppingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alışveriş Listesi'),
        backgroundColor: Colors.redAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _productController,
              decoration: InputDecoration(labelText: 'Ürün Adı'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addProductToList();
              },
              child: Text('Ürünü Ekle'),
            ),
            Expanded(
            child: ListView.builder(
              itemCount: _shoppingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_shoppingList[index]),
                  trailing: IconButton(
                    color: Colors.deepPurple,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeProductFromList(index);
                    },
                  ),
                );
              },
            ),
          ),
          ],
        ),
        
      ),
    );
  }
  

  void _addProductToList() {
    String product = _productController.text.trim();
    if (product.isNotEmpty) {
      setState(() {
        _shoppingList.add(product);
        _productController.clear();
      });
    }
  }
  
  void _removeProductFromList(int index) {
    setState(() {
    _shoppingList.removeAt(index);
  });
  }
}