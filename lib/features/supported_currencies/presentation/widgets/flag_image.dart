import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  final String countryCode;

  const FlagImage({Key? key, required this.countryCode}) : super(key: key);

  String getFlagUrl() {
    return 'https://flagcdn.com/48x36/${countryCode.toLowerCase()}.png';
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: getFlagUrl(),
      width: 48,
      height: 36,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.flag),
    );
  }
}
