// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatefulWidget {
  final ValueChanged<String>?
      onCountrySelected; // Callback to pass selected country code

  const CountryCodeDropdown({super.key, this.onCountrySelected});

  @override
  // ignore: library_private_types_in_public_api
  _CountryCodeDropdownState createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  List<Map<String, String>> countryCodes = [];
  String? selectedCode;

  get http => null;

  @override
  void initState() {
    super.initState();
    fetchCountryCodes(); //rinqil@gmail.com
  }

  Future<void> fetchCountryCodes() async {
    final url = Uri.parse("https://restcountries.com/v3.1/all");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          countryCodes = data.map((country) {
            final countryName = country['name']['common'] ?? 'Unknown';
            final flag = country['flag'] ?? '';
            final dialCode = country['idd']['root'] != null
                ? '${country['idd']['root']}${(country['idd']['suffixes'] ?? [
                      ''
                    ])[0]}'
                : 'Unknown';
            return {
              'code': dialCode,
              'name': '$flag $countryName',
            };
          }).toList();
          countryCodes.sort((a, b) => a['name']!.compareTo(b['name']!));
          selectedCode = countryCodes.first['code'];
        });
      } else {
        throw Exception("Failed to load country codes");
      }
    } catch (e) {
      print("Error fetching country codes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return countryCodes.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : DropdownButton<String>(
            items: countryCodes.map((country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Text(country['name']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCode = value;
              });
              if (widget.onCountrySelected != null && value != null) {
                widget.onCountrySelected!(value);
              }
            },
            value: selectedCode,
          );
  }
}
