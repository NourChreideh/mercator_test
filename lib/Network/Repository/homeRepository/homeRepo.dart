import 'package:mercator_test/Models/Request/ApiResponse.dart';
import 'package:mercator_test/Models/Request/articleReqModel.dart';

abstract class HomeRepo {

  Future<ApiResponse> getAllArticlesAsync(ArticlesReqModel req);
}