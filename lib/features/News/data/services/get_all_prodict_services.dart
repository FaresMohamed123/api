import 'package:testbloc2/core/api.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';

class GetAllProdictServices {
  Future<List<GetAllproductsModel>> getAllProducts() async {
    try {
      List<dynamic> data =
          await Api().get(url: 'https://fakestoreapi.com/products');
      List<GetAllproductsModel> productsList = [];
      for (var i = 0; i < data.length; i++) {
        productsList.add(GetAllproductsModel.fromJson(data[i]));
      }
      return productsList;
    } catch (e) {
      throw Exception('Failed to load data getAllProducts${e.toString()}');
    }
  }
}
