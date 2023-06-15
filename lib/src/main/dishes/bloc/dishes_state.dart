part of 'dishes_bloc.dart';

@immutable
abstract class DishesState {
  final bool isLoading;

  const DishesState({required this.isLoading});

  DishesState copyWith({bool? isLoading});
}

class DishesInitial extends DishesState {
  const DishesInitial({
    bool isLoading = false,
  }) : super(isLoading: isLoading);

  @override
  DishesInitial copyWith({bool? isLoading}) {
    return DishesInitial(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class DishesUploaded extends DishesState {
  final Set<String> tagFilters;
  final Set<String> pickedTagFilters;
  final List<DishModel> dishes;

  const DishesUploaded({
    bool isLoading = false,
    this.pickedTagFilters = const {},
    required this.tagFilters,
    required this.dishes,
  }) : super(isLoading: isLoading);

  @override
  DishesUploaded copyWith({
    bool? isLoading,
    Set<String>? tagFilters,
    Set<String>? pickedTagFilters,
    List<DishModel>? dishes,
  }) {
    return DishesUploaded(
      pickedTagFilters: pickedTagFilters ?? this.pickedTagFilters,
      isLoading: isLoading ?? this.isLoading,
      tagFilters: tagFilters ?? this.tagFilters,
      dishes: dishes ?? this.dishes,
    );
  }
}
