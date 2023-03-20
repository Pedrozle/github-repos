import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_repos/models/repositorio.dart';
import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'api.github.com';

  static Dio dio = Dio();

  void getRepositories(String username) async {
    try {
      var response =
          await dio.get("https://api.github.com/users/$username/repos");

      var repositories =
          (response.data).map((item) => Repositorio.fromJson(item)).toList();

      debugPrint(repositories.toString());
      // return repositories;
    } on DioError catch (error) {
      debugPrint("deuu erro $error");
    }
  }
}
