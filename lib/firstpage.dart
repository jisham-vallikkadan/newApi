import 'package:apifirstdemo/homepage.dart';
import 'package:apifirstdemo/service/newsApi.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  TextEditingController countrycontroler = TextEditingController();
  TextEditingController categorycontroler = TextEditingController();
  String? Country;

  List country = [
    'ar',
    'ae',
    'at',
    'br',
    'ca',
    'us',
    'sa',
    'za',
    'sk',
    'nl',
    'ng',
    'si',
    'sk',
  ];
  String? Category;
  List category = [
    'entertainment',
    'business',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];
  NewsApi newsApi = NewsApi();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Select Country & Category'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffB4D1E7FF),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.zero),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.zero)),
                  hint: Text(
                    'Select Country',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: Country,
                  onChanged: (vale) {
                    setState(() {
                      Country = vale.toString();
                    });
                  },
                  items: country
                      .map((vale) =>
                          DropdownMenuItem(value: vale, child: Text(vale)))
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)
                              ,borderRadius: BorderRadius.zero),
                      focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.zero,borderSide: BorderSide(color: Colors.white, width: 3))),
                  hint: Text(
                    'Select Category',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: Category,
                  onChanged: (vale) {
                    setState(() {
                      Category = vale.toString();
                    });
                  },
                  items: category
                      .map((vale) =>
                          DropdownMenuItem(value: vale, child: Text(vale)))
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: TextButton(
                    onPressed: () {
                      print(Country);
                      print(Category);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homepage(
                                    country: Country.toString(),
                                    category: Category.toString(),
                                  )));

                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
