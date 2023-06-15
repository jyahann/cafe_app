import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/categories/bloc/categories_bloc.dart';
import 'package:cafe_app/src/main/categories/widgets/categories_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  static const List<Color> colorsPalitra = [
    Color(0xffFFF2D2),
    Color(0xffFFEBE0),
    Color(0xffD8F5F3),
    Color(0xffEFF5CF),
  ];

  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 16.0,
      ),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: backgroundColor,
                color: primaryColor,
              ),
            );
          } else if (state is CategoriesUploaded) {
            List<CategoriesListTile> categoriesListTiles = [];
            for (var i = 0; i < state.categories.length; i++) {
              categoriesListTiles.add(CategoriesListTile(
                category: state.categories[i],
                color: getCardColor(i),
              ));
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              //children: [],
              children: categoriesListTiles,
            );
          }
          return Text(
            "oops... Categories list is empty",
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

  Color getCardColor(int index) {
    return colorsPalitra[index % colorsPalitra.length];
  }
}
