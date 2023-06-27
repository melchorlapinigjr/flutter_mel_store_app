import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageViewer extends StatelessWidget {
  final String imageUrl;

  const MyImageViewer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
    );
  }
}
