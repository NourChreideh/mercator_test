

import 'package:flutter/material.dart';
import 'package:mercator_test/Models/Request/ApiResponse.dart';
import 'package:mercator_test/Models/Request/Status.dart';
import 'package:mercator_test/Models/Request/articleReqModel.dart';
import 'package:mercator_test/Models/Response/articles_model/article.dart';
import 'package:mercator_test/Network/Repository/homeRepository/homeRepoImpl.dart';


class HomeViewModel extends ChangeNotifier {
  final homrServices = HomeRepoImpl();

 

Future<ApiResponse<List<Article>>> getAppliedJobs(ArticlesReqModel req) async {
  try {
    ApiResponse response = await homrServices.getAllArticlesAsync(req);
    if (response.status == Status.COMPLETED) {
      List<Article> jobStateModel = (response.data as List)
          .map((map) => Article.fromJson(map))
          .toList();
      return ApiResponse.completed(jobStateModel);
    } else {
      return ApiResponse.error();
    }
  } catch (e) {
    print('Exception fetching AppliedJobs: $e');
    return ApiResponse.error();
  }
}

       
}
