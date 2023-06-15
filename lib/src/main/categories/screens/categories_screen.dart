import 'package:cafe_app/src/components/template_screens/primary_scroll_screen.dart';
import 'package:cafe_app/src/main/categories/bloc/categories_bloc.dart';
import 'package:cafe_app/src/main/categories/categories_repository.dart';
import 'package:cafe_app/src/main/categories/widgets/categories_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesBloc = CategoriesBloc(
      categoriesRepository: context.read<CategoriesRepository>(),
    );
    categoriesBloc.add(const CategoriesUpload());

    return BlocProvider.value(
      value: categoriesBloc,
      child: const PrimaryScrollScreen(
        scrollChild: CategoriesList(),
      ),
    );
  }
}
