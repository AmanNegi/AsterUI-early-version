import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'TextFormBuilder.dart';

class PhoneNumberBlockBuilder extends StatelessWidget {
  final Function onSavedCountryCode;
  final Function onSavedPhoneNumber;

  const PhoneNumberBlockBuilder(
      {this.onSavedCountryCode, this.onSavedPhoneNumber});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CountryCodePicker(
            favorite: ["+91", "भारत"],
            showFlagDialog: true,
            initialSelection: "भारत",
            onChanged: onSavedCountryCode),
        Expanded(
          child: TextFormBuilder(
            hintText: "Phone Number",
            onSaved: onSavedPhoneNumber,
            validator: (String value) {
              if (value.length == 0)
                return "Enter your number";
              else if (value.length < 10 || value.length > 10)
                return "Enter a valid Number";
              return null;
            },
            icon: Icon(Icons.contact_phone),
            keybordType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}
