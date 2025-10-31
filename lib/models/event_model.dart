import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel{
  CategoryModel category;
  String title;
  String description;
   DateTime data;
   TimeOfDay timeOfDay;
  EventModel ({required this.category,required this.title,required this.description,required this.data,required this.timeOfDay});

}