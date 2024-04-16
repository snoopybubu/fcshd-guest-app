import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class searchField extends StatelessWidget {
  void Function(String) onChangeFunction;
  VoidCallback suffixFunction;
  TextEditingController searchText;

  searchField({required this.onChangeFunction, required this.suffixFunction, required this.searchText});

  @override
  Widget build(BuildContext context) {   
    return SizedBox(
      width: double.infinity,
      child: TextField(
          controller: searchText,
          onChanged: onChangeFunction,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.cyan[50]!)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.cyan[50]!)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
              filled: true,
              fillColor: Colors.cyan[50],
              prefixIcon: const Icon(LineAwesomeIcons.search),
              prefixIconColor: Colors.grey,
              suffix: Padding(
                padding: const EdgeInsets.only(right:10),
                child: InkWell(
                  onTap: suffixFunction,
                  child: const Icon(
                    LineAwesomeIcons.times_circle,
                    color: Colors.grey,
                    
                  ),
                ),
              ),
              hintText: "Search...",
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
    );
  }
}
