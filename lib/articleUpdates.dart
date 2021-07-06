import 'package:flutter/foundation.dart';
import 'articleClass.dart';
import 'networking.dart';

class articleUpdates extends ChangeNotifier {
  List<articleClass> myArticle = [];

  articleUpdates(){
    Network().getAllData().then((value){
      myArticle.addAll(value);
      notifyListeners();
    });
  }
}