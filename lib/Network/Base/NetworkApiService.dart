import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mercator_test/Models/Request/ApiResponse.dart';
import 'package:mercator_test/Models/Request/Status.dart';

import 'package:mercator_test/Network/Base/baseAPIservice.dart';

class NetworkApiService extends BaseApiService {
  
Future<ApiResponse> fetchData(String url, Map<String, dynamic> data) async {
  Uri uri = Uri.parse(baseUrl + url).replace(queryParameters: data);
  print("Request URI: $uri");
  try {
    final response = await http.get(
      uri,
      headers: {
        'Cache-Control': 'no-cache',
        'User-Agent': 'PostmanRuntime/7.41.2',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );
    print("Response Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print("Decoded JSON Data: $jsonData");
      var articles = jsonData['articles'];
      if (articles is List) {
        return ApiResponse(
          Status.COMPLETED,
          articles,
          jsonData['hasNextPage']
        );
      } else {
        print('Unexpected data type for articles: ${articles.runtimeType}');
        return ApiResponse(Status.ERROR, 'Unexpected data format.', null);
      }
    } else {
      print('Failed to load data: ${response.reasonPhrase}');
      return ApiResponse(Status.ERROR, response.reasonPhrase, null);
    }
  } on SocketException {
    print('No Internet connection');
    return ApiResponse(Status.ERROR, 'No Internet connection', null);
  } catch (e) {
    print('Error occurred: $e');
    return ApiResponse(Status.ERROR, 'An error occurred: $e', null);
  }
}



}
