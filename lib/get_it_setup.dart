import 'package:cafe_app/utils/api_url.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiUrl>(ApiUrl(
    apiUrl: "https://run.mocky.io",
  ));
}
