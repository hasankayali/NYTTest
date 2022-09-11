import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nytimestest/features/new_york_times/data/models/media_meta_data_data_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tMediaMetaDataModel =
      MediaMetaDataDataModel(url: "", height: 0, width: 0, format: "");

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson(
              'helpers/dummy_data/dummy_media_meta_data_data_response.json'),
        );

        // act
        final result = MediaMetaDataDataModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tMediaMetaDataModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tMediaMetaDataModel.toJson();

        // assert
        final expectedJsonMap = {
          "url": "",
          "format": "",
          "height": 0,
          "width": 0
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
