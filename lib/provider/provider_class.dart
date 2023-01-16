import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  List _Fav = [];
  List _img = [];
  get myList => _Fav;
  get imList => _img;
  void favour(String word,String image) {
    final Lt = _Fav.contains(word);
    if (Lt) {
      _Fav.remove(word);
      _img.remove(image);
    } else {
      _Fav.add(word);
      _img.add(image);
    }
    notifyListeners();
  }

  bool icn(String word) {
    final lst = _Fav.contains(word);
    return lst;
  }
}
