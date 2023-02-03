import 'dart:convert';
import 'package:http/http.dart';

import '../model/user_model.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';
//getting the response
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
//if the response is success we are decoding the body and accessing the data from api
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      //here we are converting into object and returning to list
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}