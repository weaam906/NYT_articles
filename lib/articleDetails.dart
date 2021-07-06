import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyt_best_stories_task/articleClass.dart';
import 'package:nyt_best_stories_task/articleDetailsRepository.dart';
import 'networking.dart';

class articleDetails extends StatefulWidget {
   final int id;
   articleDetails(this.id);

  @override
  _articleDetailsState createState() => _articleDetailsState();
}

class _articleDetailsState extends State<articleDetails> {
  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getContent());
  }


  Widget getContent() {
    return appView(context);
  }

  Widget appView(BuildContext context) {
    return FutureBuilder(
      future: articleDetailsRepository().getArticleDetails(widget.id),
        builder: (context, articleSnapsShot) {
          if (articleSnapsShot.connectionState == ConnectionState.waiting &&
              !articleSnapsShot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (articleSnapsShot.hasError) {
            return Center(child: Text("Error"));
          } else {
            articleClass detailsModel = articleSnapsShot.data;
            return Column(
              //  mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 375,
                      width: double.infinity,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(
                              'https://image.tmdb.org/t/p/w500${detailsModel.imgURL}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8,top:20),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 170.0,
                      left: 15.0,
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(7.0),
                        child: Container(
                          height: 200.0,
                          width: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            image: new DecorationImage(
                              image: new NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${detailsModel.imgURL}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 215,
                      left: 165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 165,
                            child: Text(
                              detailsModel.title,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(detailsModel.title,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      )),
                                  SizedBox(
                                    height: 10.0,
                                  ),

                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 1.0, right: 2.0),
                                      ),
                                      Text(
                                        detailsModel.toString(),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 165,
                            child: Text(
                                detailsModel.Multimedia
                                    .join(' - '),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 15.0, right: 8.0),
                        child: Text(
                          'Description :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            );
          }
        });
  }

  void _reviewModelSheet(context, articleClass detailsModel) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //image
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/${detailsModel.imgURL}")),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //title
                              Container(
                                width: MediaQuery.of(context).size.width - 124,
                                child: Text(
                                  detailsModel.title,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}


