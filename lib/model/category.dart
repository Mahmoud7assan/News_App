import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/model/provider.dart';
import 'package:provider/provider.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  int color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.color,
      required this.imagePath});

//business entertainment general health science sports technology
  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          color: 0xffC91C22,
          imagePath: 'assets/images/sports.png'),
      CategoryModel(
          id: 'general',
          title: 'General',
          color: 0xff003E90,
          imagePath: 'assets/images/Politic.png'),
      CategoryModel(
          id: 'health',
          title: 'Health',
          color: 0xffED1E79,
          imagePath: 'assets/images/health.png'),
      CategoryModel(
          id: 'business',
          title: 'Business',
          color: 0xffCF7E48,
          imagePath: 'assets/images/bussines.png'),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          color: 0xff4882CF,
          imagePath: 'assets/images/environment.png'),
      CategoryModel(
          id: 'science',
          title: 'Science',
          color: 0xffF2D352,
          imagePath: 'assets/images/science.png'),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          color: 0xffF2D352,
          imagePath: 'assets/images/science.png')
    ];
  }
}

