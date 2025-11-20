

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:flutter/material.dart';

class EventModel{
 String ?uid;
  String id;
  CategoryModel category;
  String title;
  String description;
   DateTime dateTime;

  EventModel ({required this.id,required this.category,required this.title,required this.description,required this.dateTime,  this.uid});
  EventModel.fromJson(Map<String, dynamic> json, BuildContext context)
      : this(
  uid:json["uid"],
    id: json["id"],
    category: CategoryModel.getCategory(
      context,
    ).firstWhere((category) => category.categId == json["categoryId"]),
    title: json["title"],
    description: json["description"],
    dateTime: (json["dateTime"] as Timestamp).toDate(),
  );

  Map<String, dynamic> toJson() => {
     "uid":uid,
    "id": id,
    "categoryId": category.categId,
    "title": title,
    "description": description,
    "dateTime": dateTime,
  };

}