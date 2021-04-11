import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';

class TextSelectorInput extends StatelessWidget {
  TextSelectorInput({
    this.suggestions,
    this.controller,
    this.onSuggestionSelected,
    this.hintText,
  });

  final String hintText;
  final List<String> suggestions;
  final TextEditingController controller;
  final void Function(String) onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Flexible(
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller,
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF595959),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return suggestions.where((element) => element
                    .toLowerCase()
                    .contains(controller.text.toLowerCase()));
              },
              itemBuilder: (context, s) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(s),
              ),
              onSuggestionSelected: onSuggestionSelected,
            ),
          ),
          SvgPicture.asset(R.images.svg.dropdownButton),
        ],
      ),
    );
  }
}
