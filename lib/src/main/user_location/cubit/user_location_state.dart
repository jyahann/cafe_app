part of 'user_location_cubit.dart';

@immutable
abstract class UserLocationState {
  const UserLocationState();
}

class UserLocationInitial extends UserLocationState {
  const UserLocationInitial();
}

class UserLocationDefined extends UserLocationState {
  final String currentUserCity;

  const UserLocationDefined({required this.currentUserCity});
}
