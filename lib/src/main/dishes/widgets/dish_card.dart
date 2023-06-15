import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:cafe_app/src/main/dishes/widgets/dish_info_dialog_builder.dart';
import 'package:flutter/cupertino.dart';

class DishCard extends StatelessWidget {
  final DishModel dishModel;

  const DishCard({super.key, required this.dishModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          useRootNavigator: false,
          builder: (context) => DishInfoDialogBuilder(
            dishModel: dishModel,
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: brightBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            width: 110,
            height: 110,
            alignment: Alignment.center,
            child: Image.network(
              dishModel.imageUrl,
              height: 80.0,
              width: 80.0,
            ),
          ),
          SizedBox(
            width: 110,
            child: Text(
              dishModel.name,
              textAlign: TextAlign.start,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
