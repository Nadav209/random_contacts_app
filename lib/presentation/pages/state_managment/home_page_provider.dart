import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_contacts_app/model/contacts_model.dart';

const String randomContactsURL = "https://randomuser.me/api/";

class HomePageProvider with ChangeNotifier {
  Future<List<ContactsModel>> fetchContacts(int amount) async {
    http.Response response =
        await http.get(Uri.parse(("$randomContactsURL?results=$amount")));

    if (response.statusCode == 200) {
      Map contactsData = jsonDecode(response.body);
      List<dynamic> contacts = contactsData["results"];
      return contacts.map((json) => ContactsModel.fromJson(json)).toList();
    } else {
      throw Exception(
          "משהו קרה אנא בדוק את חיבור אינטרט שלך ונסה שוב, ${response.statusCode}");
    }
  }
}
