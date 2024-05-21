

import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{

   int _count = 0;

  int get count=> _count;
}

class NumberListProvider extends ChangeNotifier{

  List<int> num=[1,2,3,4];

  void add(){
    int last= num.last;
    num.add(last+1);
    notifyListeners();
  }
}