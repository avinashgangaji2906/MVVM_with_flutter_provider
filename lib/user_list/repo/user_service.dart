import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_provider/utils/constants.dart';
import 'package:mvvm_provider/user_list/models/user_model.dart';
import 'package:mvvm_provider/user_list/repo/api_status.dart';

class UserService {
  static Future<Object> getUserList() async {
    try {
      Uri url = Uri.parse(USER_LIST_URL);
      final response = await http.get(url);

      if (response.statusCode == SUCCESS) {
        return Success(
          code: SUCCESS,
          response: userModelFromJson(response.body),
        );
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'Http Error');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
