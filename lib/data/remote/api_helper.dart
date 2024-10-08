import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpClient;
import 'package:task7_wallpaper/utils/app_exceptions.dart';

class ApiHelper {
  Future<dynamic> getApi({required String url}) async {
    Uri uri = Uri.parse(url);
    try {
      var res = await httpClient.get(uri, headers: {
        "Authorization":
            "sDgcPyOZMlAyhezlyNjImDQM3MWCr3sQXTE8Scuk4AqUmiRYMJG4OIvD"
      });
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      throw (FetchDataException(errorMsg: "No Internet!!"));
    }
  }

  dynamic returnJsonResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 300:
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 403:
        throw UnauthourisedException(errorMsg: response.body.toString());
      case 500:
      case 502:
      default:
        throw FetchDataException(
            errorMsg: "There is a error while communicated with server");
    }
  }
}
