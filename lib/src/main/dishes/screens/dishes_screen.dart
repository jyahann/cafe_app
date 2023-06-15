import 'package:cafe_app/src/main/dishes/bloc/dishes_bloc.dart';
import 'package:cafe_app/src/main/dishes/dishes_repository.dart';
import 'package:cafe_app/src/main/dishes/widgets/dishes_list.dart';
import 'package:cafe_app/src/main/dishes/widgets/tag_filters_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishesScreen extends StatelessWidget {
  final String title;

  const DishesScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final dishesBloc = DishesBloc(
      dishesRepository: context.read<DishesRepository>(),
    );
    dishesBloc.add(const DishesUpload());

    return BlocProvider.value(
      value: dishesBloc,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: Border.all(color: Colors.transparent),
          middle: Text(
            title,
            style: CupertinoTheme.of(context)
                .textTheme
                .navLargeTitleTextStyle
                .copyWith(fontSize: 18.0),
          ),
          trailing: GestureDetector(
            child: CircleAvatar(
              radius: 22,
              backgroundImage: Image.asset(
                "assets/user_photo/avatar.jpg",
              ).image,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              TagFiltersList(),
              DishesList(),
            ],
          ),
        ),
      ),
    );
  }
}
