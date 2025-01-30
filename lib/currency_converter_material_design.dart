import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialDesignPage extends StatefulWidget {
  CurrencyConverterMaterialDesignPage({super.key})
  {
    print('Constructor created');
  }

  @override
  State<CurrencyConverterMaterialDesignPage> createState() {
    print("It is material state");
    return _CurrencyConverterMaterialState();
  }
}

class _CurrencyConverterMaterialState
    extends State<CurrencyConverterMaterialDesignPage> {
  late double res;

  @override
  void initState()
  {
    super.initState();
    res=0;
    print('rebuilt');
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(65.0)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                res.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon:
                      const Icon(Icons.attach_money, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final inputAmount = double.parse(textEditingController.text);
                  setState(() {
                    res = inputAmount * 100;
                  });
                  if (kDebugMode) {
                    print("Convert button pressed");
                    print("Entered amount: ${inputAmount * 100}");
                  }
                  // You can add conversion logic here
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Convert'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  textEditingController.clear();
                  setState(() {
                    res = 0;
                  });
                  if (kDebugMode) {
                    print("Reset button clicked");
                    print("Input cleared");
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
