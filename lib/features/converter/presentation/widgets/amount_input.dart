import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;

  const AmountInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: 'Amount'),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
