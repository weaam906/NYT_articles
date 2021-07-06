import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'networking.dart';
import 'articleClass.dart';
import 'articleUpdates.dart';
import 'articleDetails.dart';

class articlesList extends StatefulWidget {
  @override
  _articlesListState createState() => _articlesListState();
}

class _articlesListState extends State<articlesList> {
  Future<List<articleClass>> articles;

  @override
  void initState() {
    super.initState();
    setState(() {
      articles = Network().getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NYT BEST STORIES'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<articleUpdates>(builder: (context, model, child) {
            return FutureBuilder<List<articleClass>>(
                future: Network().getAllData(),
                builder: (context, snapshot){

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data[position].title}'),
                      subtitle: Row(
                        children: <Widget>[
                          Text('${snapshot.data[position].abstrct}'),
                          SizedBox(
                            width: 100,
                          ),
                          Image.network('${snapshot.data[position].imgURL}'),
                        ],
                      ),
                onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return articleDetails(articleModel.id);
                            }));
                          },
                    ),
                  );
                });
             });
            ),
    );
  }
}