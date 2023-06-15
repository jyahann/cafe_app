import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/components/headers/primary_header.dart';
import 'package:flutter/cupertino.dart';

class PrimaryScrollScreen extends StatelessWidget {
  final Widget scrollChild;
  final Widget? footer;

  const PrimaryScrollScreen(
      {super.key, required this.scrollChild, this.footer});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: Column(children: [
        const PrimaryHeader(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: scrollChild,
          ),
        ),
        if (footer != null) footer!,
      ]),
    );
  }
}
