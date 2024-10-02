import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Widget child;
  final Radius? borderRadius;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool? showShadow;
  final Color? buttonColor;

  const ReusableButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.width,
    this.height,
    this.padding,
    this.showShadow,
    this.borderRadius, this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              borderRadius ?? Radius.circular(8.0)),
          boxShadow: (showShadow == true)
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
          color: buttonColor ?? Colors.grey,
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: child,
      ),
    );
  }
}
