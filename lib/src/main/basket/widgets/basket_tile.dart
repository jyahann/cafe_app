import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/basket/models/basket_model.dart';
import 'package:cafe_app/src/main/basket/widgets/basket_counter.dart';
import 'package:flutter/cupertino.dart';

class BasketTile extends StatelessWidget {
  final BasketModel basketModel;

  const BasketTile({
    super.key,
    required this.basketModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                  basketModel.dish.imageUrl,
                  height: 60.0,
                  width: 60.0,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                children: [
                  Text(
                    basketModel.dish.name,
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${basketModel.dish.price.toString()} ₽",
                        textAlign: TextAlign.start,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(fontSize: 14.0),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "· ${basketModel.dish.weight.toString()} г",
                        textAlign: TextAlign.start,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: hintColor,
                            ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          BasketCounter(dish: basketModel.dish),
        ],
      ),
    );
  }
}
