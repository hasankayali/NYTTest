import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tNewsModel = NewsModel(
      num_results: 10, copyright: "test", status: "true", results: []);

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_news_response.json'),
        );

        // act
        final result = NewsModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tNewsModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tNewsModel.toJson();

        // assert
        final expectedJsonMap = {
          "status": "true",
          "copyright": "test",
          "num_results": 10,
          "results": []
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
