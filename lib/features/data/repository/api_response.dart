import 'dart:convert';
import 'dart:developer';
import 'package:convert_app/features/data/repository/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiResponse extends StatefulWidget {
  const ApiResponse({super.key});

  @override
  State<ApiResponse> createState() => _ApiResponseState();
}

class _ApiResponseState extends State<ApiResponse> {
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


  

  // Future buildBody() async {
  //   final dio = Dio();
  //   final apiService = ApiService(dio);
  //   try {
  //     final response = await apiService.getCryptoCoinResponseModel();

  //     final users = response.data;

  //     log(users.coinInfo as num);
  //   } catch (e) {
  //     // Handle exception
  //     print('Error occurred: $e');
  //   }
  // }



