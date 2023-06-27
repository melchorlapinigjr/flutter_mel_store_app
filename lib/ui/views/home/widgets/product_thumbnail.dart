import 'package:flutter/material.dart';
import 'package:mel_store/ui/common/ui_helpers.dart';
import 'package:mel_store/ui/enums/title_types.dart';
import 'package:mel_store/ui/views/widgets/widgets.dart';

import '../../../common/app_colors.dart';

class ProductThumbnail extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double? imageSize;

  const ProductThumbnail(
      {super.key,
      required this.name,
      required this.imageUrl,
      this.imageSize = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
      color: kcLightGrey),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: MyImageViewer(
              imageUrl: imageUrl,
            ),
          ),
          verticalSpaceSmall,
          Expanded(
            child: MyTitle(
              title: name,
              type: TitleTypes.medium,
            ),
          )
        ],
      ),
    );
  }
}
