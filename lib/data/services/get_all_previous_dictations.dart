import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/model/previous_dictations.dart';

import 'package:http/http.dart' as http;

class Services {
  // static const String url = 'https://jsonplaceholder.typicode.com/users';

//get All Previous Dictations
  Future<PreviousDictations> getAllPreviousDictations() async {
    try {
      var endpointUrl = ApiUrlConstants.getAllPreviousDictations;
      Map<String, String> queryParams = {
        'EpisodeId': '39308',
        'AppointmentId':'34537',
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        PreviousDictations preDictions = parseProviders(response.body);
        return preDictions;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static PreviousDictations parseProviders(String responseBody) {
    final PreviousDictations previousDictations = PreviousDictations.fromJson(json.decode(responseBody));
    return previousDictations;
  }
}