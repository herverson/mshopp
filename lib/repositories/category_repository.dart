import 'package:dio/dio.dart';
import '../models/category_list.dart';
import '../utilities/constants.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((course) => CategoryListItemModel.fromJson(course))
        .toList();
  }
}
