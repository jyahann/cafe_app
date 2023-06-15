import 'package:cafe_app/app_config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishInfoDialogImage extends StatelessWidget {
  final String imageUrl;

  const DishInfoDialogImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 230,
          decoration: const BoxDecoration(
            color: brightBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          alignment: Alignment.center,
          child: Image.network(
            imageUrl,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  onPressed: () {},
                  color: Colors.white,
                  child: Image.asset("assets/dish_info_icons/like.png"),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                  child: Image.asset("assets/dish_info_icons/close.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
