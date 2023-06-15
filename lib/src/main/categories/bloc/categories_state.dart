part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {
  final bool isLoading;

  const CategoriesState({required this.isLoading});

  CategoriesState copyWith({bool? isLoading});
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial({
    bool isLoading = false,
  }) : super(isLoading: isLoading);

  @override
  CategoriesInitial copyWith({bool? isLoading}) {
    return CategoriesInitial(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CategoriesUploaded extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesUploaded({
    bool isLoading = false,
    required this.categories,
  }) : super(isLoading: isLoading);

  @override
  CategoriesUploaded copyWith({
    bool? isLoading,
    List<CategoryModel>? categories,
  }) {
    return CategoriesUploaded(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
