import 'package:cafe_app/get_it_setup.dart';
import 'package:cafe_app/src/main/categories/models/category_model.dart';
import 'package:cafe_app/utils/api_url.dart';

class CategoriesRepository {
  const CategoriesRepository();

  Future<List<CategoryModel>> getAll() async {
    final apiUrl = getIt.get<ApiUrl>();
    final categories = await apiUrl.request<Map<String, dynamic>>(
      method: r"GET",
      path: r'/v3/058729bd-1402-4578-88de-265481fd7d54',
    );

    if (categories == null) {
      throw Exception("Categories response is empty");
    }
    final categoriesList = categories["сategories"];
    List<CategoryModel> models = [];
    for (var category in categoriesList) {
      models.add(
        CategoryModel(
          id: category["id"],
          name: category["name"],
          imageUrl: category["image_url"],
        ),
      );
    }

    return models;
  }
}
