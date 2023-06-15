import 'package:cafe_app/get_it_setup.dart';
import 'package:cafe_app/src/main/dishes/models/dish_model.dart';
import 'package:cafe_app/utils/api_url.dart';

class DishesRepository {
  const DishesRepository();

  Future<List<DishModel>> getAll() async {
    final apiUrl = getIt.get<ApiUrl>();
    final dishes = await apiUrl.request<Map<String, dynamic>>(
      method: r"GET",
      path: r'/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b',
    );

    if (dishes == null) {
      throw Exception("Dishes response is empty");
    }

    final dishesList = dishes["dishes"];
    List<DishModel> models = [];
    for (var dish in dishesList) {
      models.add(
        DishModel(
          id: dish["id"],
          name: dish["name"],
          description: dish["description"],
          imageUrl: dish["image_url"],
          price: dish["price"],
          weight: dish["weight"],
          tags: (dish["tegs"] as List<dynamic>)
              .map((tag) => tag as String)
              .toList(),
        ),
      );
    }

    return models;
  }
}
