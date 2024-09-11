
import 'package:dio/dio.dart';
import 'package:testbloc2/core/api.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';

class GetCategoriesServices {
  late Dio dio;

  GetCategoriesServices({required this.dio});

  Future<List<GetAllproductsModel>> getCategories(
      {required String categoryname}) async {
    try {
      List<dynamic> data = await Api()
          .get(url:'https://fakestoreapi.com/products/category/$categoryname');

      List<GetAllproductsModel> productsList = [];
      for (var i = 0; i < data.length; i++) {
        productsList.add(GetAllproductsModel.fromJson(data[i]));
      }
      return productsList;
    } catch (e) {
      throw Exception('Failed to load data getCategories${e.toString()}');
    }
  }
}
