import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_gridview/model/product.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLoading;
  List<Product> list = [];

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    final response = await http.get(
      Uri.parse('https://somonnoy.xyz/api/demo/product.php'),
    );
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Product.fromJson(data))
          .toList();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API & GridView'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) => Card(
                margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 3.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(list[index].image),
                      SizedBox(height: 5.0),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(list[index].name)),
                            SizedBox(width: 5.0),
                            Icon(Icons.favorite_border, color: Colors.pink),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 165, height: 35),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart),
                          label: Text('Add'),
                        ),
                      ),
                      // SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
