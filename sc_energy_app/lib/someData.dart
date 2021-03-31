import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class SomeData {
  String id;
  String category;
  List subData;

  SomeData.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    category = data['category'];
    subData = data['subData'];
  }
}
