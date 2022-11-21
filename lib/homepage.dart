import 'package:apifirstdemo/articlesmodelcalss.dart';
import 'package:apifirstdemo/service/newsApi.dart';
import 'package:flutter/material.dart';

import 'detailspage.dart';

class Homepage extends StatefulWidget {
  String? country;
  String? catergory;
  Homepage({Key? key, required this.country, required this.catergory})
      : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List<Newscad> newscard = <Newscad>[
  //   Newscad(image: 'images/sports.jpg', newsname: 'foodball',discription: 'abcdefg'),
  //   Newscad(image: 'images/avengers.jpg', newsname: 'Avengers',discription: 'abcghshfas'),
  //   Newscad(image: 'images/pabther.jpg', newsname: 'black panther',discription: 'fadgsfsdafadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfadgsfsdafasdfasdfgasddgfasdfasdfgasddg'),
  //
  // ];

  NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<List<Newscad>>(
          future: newsApi.getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    var news = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print(newsApi.category);
                              // print(newsApi.county);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailspage(
                                      namea: news.source!.name,
                                      image: news.urlToImage.toString(),
                                      name: news.title.toString(),
                                      discription: news.description.toString(),
                                    ),
                                  ));
                            },
                            child: snapshot.data?[index].urlToImage != null
                                ? Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data![index].urlToImage
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000'))),
                                  ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                      news.source!.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  color: Colors.red,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.transparent))),
                              Text(
                                news.title.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                news.description.toString(),
                                style: TextStyle(fontSize: 15),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
