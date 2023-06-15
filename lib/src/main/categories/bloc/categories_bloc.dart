import 'package:bloc/bloc.dart';
import 'package:cafe_app/src/main/categories/categories_repository.dart';
import 'package:cafe_app/src/main/categories/models/category_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as log;
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;

  CategoriesBloc({
    required this.categoriesRepository,
  }) : super(const CategoriesInitial()) {
    on<CategoriesUpload>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        var response = await categoriesRepository.getAll();
        emit(CategoriesUploaded(
          isLoading: state.isLoading,
          categories: response,
        ));
      } on DioException catch (e) {
        log.log("Error on loading categories: ${e.message}");
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
