import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/basket/bloc/basket_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPayButton extends StatelessWidget {
  const BasketPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        if (state.basketDishes.isEmpty) {
          return const SizedBox.shrink();
        }
        int count = 0;
        for (var basketDish in state.basketDishes) {
          count += basketDish.count * basketDish.dish.price;
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                onPressed: () {},
                color: primaryColor,
                child: Text(
                  "Оплатить ${count} ₽",
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
