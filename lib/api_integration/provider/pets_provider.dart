import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider_example/api_integration/model/pets_model.dart';

class PetsProvider extends ChangeNotifier {
  bool isLoading = true;
  String error = '';
  Pets pets = Pets(data: []);
  Pets serachedPets = Pets(data: []);
  String searchText = '';

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://jatinderji.github.io/users_pets_api/users_pets.json"));
      if (response.statusCode == 200) {
        pets = petsFromJson(response.body);
        log("message ${response.body}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    serachedPets.data.clear();
    if (searchText.isEmpty) {
      serachedPets.data.addAll(pets.data);
    } else {
      serachedPets.data.addAll(pets.data
          .where((element) =>
              element.userName.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username;
    updateData();
  }
}
