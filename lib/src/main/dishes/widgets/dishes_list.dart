import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/dishes/bloc/dishes_bloc.dart';
import 'package:cafe_app/src/main/dishes/widgets/dish_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishesList extends StatelessWidget {
  const DishesList({super.key});

  bool isEnters(Set<String> from, Set<String> to) {
    for (var i = 0; i < from.length; i++) {
      if (!to.contains(from.elementAt(i))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<DishesBloc, DishesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
                backgroundColor: backgroundColor,
              ),
            );
          } else if (state is DishesUploaded) {
            var dishes = state.dishes;
            if (state.pickedTagFilters.isNotEmpty) {
              dishes = state.dishes
                  .where((dish) => isEnters(
                        state.pickedTagFilters,
                        dish.tags.toSet(),
                      ))
                  .toList();
            }
            if (dishes.isEmpty) {
              return Text(
                "oops... Dishes list is empty",
                textAlign: TextAlign.start,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(fontSize: 18.0),
              );
            }
            return FadedSlideAnimation(
              beginOffset: const Offset(1.0, 0),
              endOffset: const Offset(0, 0),
              slideDuration: const Duration(milliseconds: 300),
              slideCurve: Curves.ease,
              child: GridView.builder(
                itemCount: dishes.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return DishCard(dishModel: dishes[index]);
                },
              ),
            );
          }
          return Text(
            "oops... Dishes list is empty",
            textAlign: TextAlign.start,
            style: CupertinoTheme.of(context)
                .textTheme
                .textStyle
                .copyWith(fontSize: 18.0),
          );
        },
      ),
    );
  }
}
