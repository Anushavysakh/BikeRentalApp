

import 'package:flutter/material.dart';

Text buildTextSubtitle(String text1,String text2) {
  return  Text.rich(
    TextSpan(
        text: text1,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            style: const TextStyle(
                fontSize: 16,color: Colors.grey
            ),
          )
        ]),
  );
}
Text buildTextCategory(String text1,String text2) {
  return  Text.rich(
    TextSpan(
        text: text1,
        style: TextStyle(fontSize: 18,color: Colors.grey),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,
                fontSize: 18,
            ),
          )
        ]),
  );
}