part of 'dishes_bloc.dart';

@immutable
abstract class DishesEvent {
  const DishesEvent();
}

class DishesUpload extends DishesEvent {
  const DishesUpload();
}

class DishesPickTagFilter extends DishesEvent {
  final String tagFilter;

  const DishesPickTagFilter({required this.tagFilter});
}

class DishesUnpickTagFilter extends DishesEvent {
  final String tagFilter;

  const DishesUnpickTagFilter({required this.tagFilter});
}
