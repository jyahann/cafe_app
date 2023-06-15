import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/dishes/bloc/dishes_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagFiltersList extends StatelessWidget {
  const TagFiltersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: buildContent(),
      ),
    );
  }

  BlocBuilder<DishesBloc, DishesState> buildContent() {
    return BlocBuilder<DishesBloc, DishesState>(
      builder: (context, state) {
        if (state is! DishesUploaded) {
          return const SizedBox.shrink();
        }
        final tags = state.pickedTagFilters.toSet();
        tags.addAll(state.tagFilters);

        List<Widget> buttons = [];
        for (var i = 0; i < tags.length; i++) {
          final tag = tags.elementAt(i);
          final isPicked = state.pickedTagFilters.contains(tag);

          buttons.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                onPressed: () {
                  if (isPicked) {
                    context.read<DishesBloc>().add(
                          DishesUnpickTagFilter(tagFilter: tag),
                        );
                  } else {
                    context.read<DishesBloc>().add(
                          DishesPickTagFilter(tagFilter: tag),
                        );
                  }
                },
                color: isPicked ? primaryColor : brightBackgroundColor,
                child: Text(
                  tag,
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: isPicked ? Colors.white : Colors.black,
                          ),
                ),
              ),
            ),
          );
        }
        return Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: buttons,
        );
      },
    );
  }
}
