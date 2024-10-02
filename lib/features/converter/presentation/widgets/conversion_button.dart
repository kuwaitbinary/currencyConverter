import 'package:flutter/material.dart';
import 'package:code_challenge/shared/reusable_components/reusable_elevated_button.dart';

class ConversionButton extends StatelessWidget {
  final VoidCallback onTap;

  const ConversionButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableButton(
      onTap: onTap,
      child: Text(
        'Convert',
        style: TextStyle(color: Colors.white),
      ),
      height: MediaQuery.sizeOf(context).height / 20,
      buttonColor: Colors.green,
    );
  }
}
