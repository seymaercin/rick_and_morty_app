import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odev_firebase/model/character.dart';

class HomePageViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  HomePageViewModel() {
    _getAllCharacters();
  }

  void _getAllCharacters() async {
    Uri uri = Uri.parse(_apiUrl);

    http.Response response = await http.get(uri);

    List<dynamic> allCharacters = jsonDecode(response.body)["results"];

    _characters = allCharacters
        .map((characterMap) => Character.fromMap(characterMap))
        .toList();

    notifyListeners();
  }
}
