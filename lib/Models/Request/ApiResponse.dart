



import 'package:mercator_test/Models/Request/Status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  bool? hasNextPage;

  
  ApiResponse(this.status,this.data,this.hasNextPage);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status  \n Data : $data";
  }
}