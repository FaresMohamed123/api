import 'package:dio/dio.dart';
import 'package:testbloc2/core/api.dart';

class GetAllCategoriesServices {
  late Dio dio;
  GetAllCategoriesServices({required this.dio});

  Future<List<dynamic>> getAllCategories() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products/categories');

      return data;
    } catch (e) {
      throw Exception('Failed to load data getAllCategories${e.toString()}');
    }
  }
}
