import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nytimestest/features/new_york_times/data/models/media_data_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tMediaDataModel = MediaDataModel(
      type: "",
      copyright: "",
      approved_for_syndication: 0,
      caption: "",
      metadata: [],
      subtype: "");

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_media_data_response.json'),
        );

        // act
        final result = MediaDataModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tMediaDataModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tMediaDataModel.toJson();

        // assert
        final expectedJsonMap = {
          "type": "",
          "subtype": "",
          "caption": "",
          "copyright": "",
          "approved_for_syndication": 0,
          "media-metadata": []
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
