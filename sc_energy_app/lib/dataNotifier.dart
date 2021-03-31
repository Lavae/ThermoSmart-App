import 'dart:collection';

import 'package:flutter/material.dart';
import 'lib/someData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DataNotifier with ChangeNotifier {
  List<SomeData> _someDataList = [];
  SomeData _currentData;

  UnmodifiableListView<SomeData> get someDataList =>
      UnmodifiableListView(_someDataList);

  SomeData get currentData => _currentData;

  set someDataList(List<SomeData> someDataList) {
    _someDataList = someDataList;
    notifyListeners();
  }

  set currentData(SomeData dt) {
    _currentData = dt;
  }
}
