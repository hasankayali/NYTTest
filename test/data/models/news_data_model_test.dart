import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_data_model.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tNewsDataModel = NewsDataModel(
      id: 0,
      type: "",
      title: "",
      url: "",
      abstract: "",
      adx_keywords: "",
      asset_id: 0,
      byline: "",
      des_facet: [""],
      eta_id: 0,
      geo_facet: [""],
      media: [],
      nytdsection: "",
      org_facet: [""],
      per_facet: [""],
      published_date: "",
      section: "",
      source: "",
      subsection: "",
      updated: "",
      uri: "");

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_news_data_response.json'),
        );

        // act
        final result = NewsDataModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tNewsDataModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tNewsDataModel.toJson();

        // assert
        final expectedJsonMap = {
          "uri": "",
          "url": "",
          "id": 0,
          "asset_id": 0,
          "source": "",
          "published_date": "",
          "updated": "",
          "section": "",
          "subsection": "",
          "nytdsection": "",
          "adx_keywords": "",
          "byline": "",
          "type": "",
          "title": "",
          "abstract": "",
          "des_facet": [""],
          "org_facet": [""],
          "per_facet": [""],
          "geo_facet": [""],
          "media": [],
          "eta_id": 0
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
