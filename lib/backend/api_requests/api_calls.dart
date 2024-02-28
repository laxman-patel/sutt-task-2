import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetMoviesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMovies',
      apiUrl: 'https://movies-api14.p.rapidapi.com/movies',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'b86611b0fdmsh0cc804dcb662c70p1c6b8bjsn4824cc4241d5',
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? movies(dynamic response) => getJsonField(
        response,
        r'''$.movies''',
        true,
      ) as List?;
}

class GetMovieDetailsCall {
  static Future<ApiCallResponse> call({
    String? id = '27205',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMovieDetails',
      apiUrl: 'https://movies-api14.p.rapidapi.com/movie/${id}',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'b86611b0fdmsh0cc804dcb662c70p1c6b8bjsn4824cc4241d5',
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? movie(dynamic response) => getJsonField(
        response,
        r'''$.movie''',
      );
}

class SearchMoviesCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchMovies',
      apiUrl: 'https://movies-api14.p.rapidapi.com/search',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'b86611b0fdmsh0cc804dcb662c70p1c6b8bjsn4824cc4241d5',
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? contents(dynamic response) => getJsonField(
        response,
        r'''$.contents''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
