import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:cafe_app/src/main/categories/models/category_model.dart';
import 'package:cafe_app/src/main/dishes/screens/dishes_screen.dart';
import 'package:flutter/cupertino.dart';

class CategoriesListTile extends StatelessWidget {
  final CategoryModel category;
  final Color color;

  const CategoriesListTile({
    super.key,
    required this.category,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      beginOffset: const Offset(1.0, 0),
      endOffset: const Offset(0, 0),
      slideDuration: const Duration(milliseconds: 300),
      slideCurve: Curves.ease,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => DishesScreen(
                title: category.name,
              ),
            ),
          );
        },
        child: Container(
          height: 150,
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.network(
                  category.imageUrl,
                  height: 150,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: SizedBox(
                    width: 200.0,
                    child: Text(
                      category.name,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
