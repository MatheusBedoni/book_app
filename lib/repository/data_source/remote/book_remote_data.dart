
import 'dart:convert';

import 'package:book_app/core/config/api.dart';
import 'package:book_app/core/config/routes.dart';
import 'package:book_app/repository/books/book_repository.dart';
import 'package:http/http.dart' as http;

class BookRemoteData implements BookRepository {

  @override
  Future? getVolumes({String? volume}) async {
    var url = Uri.parse(
        '${ConfigService.baseUrl}${Routes.volumes}?q=$volume');
    var response = await http.get(url);
    print(response.body);
    Map<String, dynamic> volumeMap = jsonDecode(response.body);
    return volumeMap['items'];
  }
}
