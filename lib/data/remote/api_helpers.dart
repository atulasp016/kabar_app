import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as httpClient;
import 'package:kabar_app/data/models/news_model.dart';
import 'package:kabar_app/data/remote/app_exceptions.dart';
import 'package:kabar_app/data/remote/app_urls.dart';

class ApiHelper {
  bool isSpeaking = false;
  FlutterTts flutterTts = FlutterTts();

  Future<dynamic> getAPI({required String url}) async {
    var uri = Uri.parse(url);

    try {
      var response = await httpClient.get(uri);
      return returnJsonResponse(response);
    } on SocketException catch (e) {
      throw (FetchDataException(errorMsg: 'No Internet!!'));
    }
  }

/*
  Future<dynamic> postAPI(
      {required String url, Map<String, dynamic>? bodyParams}) async {
    var uri = Uri.parse(url);

    var response = await httpClient.post(uri, body: bodyParams ?? {});

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      return mData;
    } else {
      return null;
    }
  }*/

  Future<NewsData> getTopHeadlines() async {



    var data = await ApiHelper().getAPI(
        url:
            '${AppUrls.ENDPOINT_TOP_HEADLINES_URL}?country=in&apiKey=${AppUrls.API_KEY_1}');
    NewsData model = NewsData.fromJson(data);
    return model;
  }

  Future<NewsData> getSearchNews({required String query}) async {
    var data = await ApiHelper().getAPI(
        url:
            '${AppUrls.ENDPOINT_EVERYTHING_URL}?q=$query&pageSize=20&apiKey=${AppUrls.API_KEY_1}');
    print(data);
    NewsData model = NewsData.fromJson(data);

    return model;
  }

  Future<Void?> speak({required String text}) async {
     isSpeaking = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
     isSpeaking = false;
     return null;
  }

  void stop({required String text}) async {
    await flutterTts.stop();
    isSpeaking = false;

  }

  dynamic returnJsonResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var mData = jsonDecode(response.body);
          return mData;
        }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());

      case 500:
      case 502:
      default:
        throw FetchDataException(
            errorMsg:
                'Error occurred while Communication with Server with StatusCode : ${response.body}');
    }
  }
}
