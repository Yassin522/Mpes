import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  var _url = Uri.parse("http://localhost80/login");

  postData(data) async {
    return await http.post(_url,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    return await http.get(_url, headers: _setHeaders());
  }

  _setHeaders() => {};
}
