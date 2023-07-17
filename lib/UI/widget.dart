import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget Input2(String title, String hint, double largeur, Color col,
    {TextEditingController? controller, void Function(String)? onChanged}) {
  return SizedBox(
    width: largeur,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          controller: controller,
          // validator: (val){}
          inputFormatters: [
            FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true)
          ],
          onChanged: onChanged,
          decoration: InputDecoration(
              filled: true,
              hintText: hint,
              fillColor: col,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    ),
  );
}

Widget Hspace(double h) {
  return SizedBox(height: h);
}

Widget Wspace(double w) {
  return SizedBox(width: w);
}
