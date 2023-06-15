import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:cafe_app/src/main/dishes/widgets/dish_info_dialog_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishInfoDialogBuilder extends StatelessWidget {
  final DishModel dishModel;

  const DishInfoDialogBuilder({
    Key? key,
    required this.dishModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        //side: BorderSide(color: primaryColor, width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      insetAnimationCurve: Curves.ease,
      insetAnimationDuration: const Duration(milliseconds: 300),
      insetPadding: const EdgeInsets.all(32.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DishInfoDialogImage(
              imageUrl: dishModel.imageUrl,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              dishModel.name,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${dishModel.price.toString()} ₽",
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 14.0),
                ),
                const SizedBox(
                  width: 2.0,
                ),
                Text(
                  "· ${dishModel.weight.toString()} г",
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: hintColor,
                          ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              dishModel.description,
              textAlign: TextAlign.start,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                onPressed: () {
                  BlocProvider.of<BasketBloc>(context)
                      .add(BasketAdd(dish: dishModel));
                  Navigator.of(context).pop();
                },
                color: primaryColor,
                child: Text(
                  "Добавить в корзину",
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
