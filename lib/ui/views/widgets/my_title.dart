import 'package:flutter/material.dart';
import 'package:mel_store/ui/enums/title_types.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final TitleTypes? type;

  const MyTitle({super.key, required this.title, this.type});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getTitleStyle(context),
    );
  }

  TextStyle getTitleStyle(context) {
    switch (type) {
      case TitleTypes.medium:
        return Theme.of(context).textTheme.titleMedium!;
      case TitleTypes.small:
        return Theme.of(context).textTheme.titleSmall!;
      default:
        return Theme.of(context).textTheme.titleLarge!;
    }
  }
}
