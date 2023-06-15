import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cafe_app/src/main/dishes/dishes_repository.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as log;
import 'package:meta/meta.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final DishesRepository dishesRepository;

  DishesBloc({
    required this.dishesRepository,
  }) : super(const DishesInitial()) {
    on<DishesUpload>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        var response = await dishesRepository.getAll();
        Set<String> tagFilters = {};
        for (var dish in response) {
          for (var tag in dish.tags) {
            tagFilters.add(tag);
          }
        }
        emit(DishesUploaded(
          isLoading: state.isLoading,
          tagFilters: tagFilters,
          dishes: response,
        ));
      } on DioException catch (e) {
        log.log("Error on loading dishes: ${e.message}");
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<DishesPickTagFilter>(
      (event, emit) {
        if (state is DishesUploaded) {
          final uploadedState = state as DishesUploaded;
          Set<String> tags = uploadedState.pickedTagFilters.toSet();
          final isAdded = tags.add(event.tagFilter);
          if (isAdded) {
            emit(uploadedState.copyWith(
              pickedTagFilters: tags,
            ));
          }
        }
      },
    );

    on<DishesUnpickTagFilter>(
      (event, emit) {
        if (state is DishesUploaded) {
          final uploadedState = state as DishesUploaded;
          Set<String> tags = uploadedState.pickedTagFilters.toSet();
          final isRemoved = tags.remove(event.tagFilter);
          if (isRemoved) {
            emit(
              uploadedState.copyWith(
                pickedTagFilters: tags,
              ),
            );
          }
        }
      },
    );
  }
}
