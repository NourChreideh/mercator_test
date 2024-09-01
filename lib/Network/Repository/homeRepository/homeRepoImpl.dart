
import 'package:flutter/material.dart';
import 'package:mercator_test/Models/Request/ApiResponse.dart';
import 'package:mercator_test/Models/Request/Status.dart';
import 'package:mercator_test/Models/Request/articleReqModel.dart';
import 'package:mercator_test/Network/Base/ApiEndPoints.dart';
import 'package:mercator_test/Network/Repository/homeRepository/homeRepo.dart';
import 'package:mercator_test/main.dart';

class HomeRepoImpl implements HomeRepo {
    @override
  Future<ApiResponse> getAllArticlesAsync(
    ArticlesReqModel req) async {

    try {
      ApiResponse response = await networkApiService.fetchData(
          ApiEndPoints().getAllArticles,
          {
            "id": req.id.toString(),
            "authorId": req.authorId.toString(),
            "start": req.start.toString(),
              "end": req.end.toString(),
            "keywordId": req.keywordId.toString(),
            "onlyWithSource": req.onlyWithSource.toString(),
              "type": req.type.toString(),
            "platform": req.platform.toString(),
            "isLatin":req.isLatin.toString()
          },
          );
print("opwo${response.data}");
      return response;
   } catch (e) {
  print('Exception in getAllArticlesAsync: $e');
  return ApiResponse(Status.ERROR, null, null);
}
  }
}

