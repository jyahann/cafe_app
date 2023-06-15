import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:cafe_app/src/main/basket/widgets/basket_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketList extends StatelessWidget {
  const BasketList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: BlocBuilder<BasketBloc, BasketState>(
        buildWhen: (previous, current) =>
            previous.basketDishes.length != current.basketDishes.length,
        builder: (context, state) {
          if (state.basketDishes.isEmpty) {
            return Text(
              "oops... Your basket is empty",
              textAlign: TextAlign.start,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .textStyle
                  .copyWith(fontSize: 18.0),
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: state.basketDishes
                .map<BasketTile>(
                    (basketDish) => BasketTile(basketModel: basketDish))
                .toList(),
          );
        },
      ),
    );
  }
}
