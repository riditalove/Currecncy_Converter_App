import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:opo/currency_converter_material_design.dart';


void main()
{
  // using 'const' keyword right before the main app will increase the performance
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp is extending StatelessWidget class, again StatelessWidget is extending Widget, Widget class has constructor that is Widget(), so we are also compelled to use constructor
  // key is important to differentiate different widgets
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialDesign(),
      
    );
  }
}
