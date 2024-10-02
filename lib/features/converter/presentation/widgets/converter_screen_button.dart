import 'package:code_challenge/config/routes/app_routes.dart';
import 'package:code_challenge/core/utils/app_colors.dart';
import 'package:code_challenge/shared/reusable_components/reusable_elevated_button.dart';
import 'package:flutter/material.dart';

class ConverterScreenButton extends StatelessWidget {
  const ConverterScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReusableButton(
        buttonColor: AppColors.homePageButtonBackGround,
        height: MediaQuery.sizeOf(context).height / 20,
        width: MediaQuery.sizeOf(context).width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Converter Feature',
              style: TextStyle(color: AppColors.homePageFeatureButtonText),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColors.homePageFeatureButtonIcon,
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.converterPageRoute);
        },
      ),
    );
  }
}