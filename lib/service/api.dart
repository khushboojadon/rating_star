import 'package:http/http.dart' as http;
import 'package:khushboo_task/model/data.dart';

class Api {
  String url =
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
  getdata() async {
    final response = await http.get(url);
    final baseresponse = response.body;
    return dataFromJson(baseresponse);
  }
}
