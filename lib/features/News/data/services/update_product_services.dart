import 'package:testbloc2/core/api.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';

class UpdateProductServices {
  
  Future<GetAllproductsModel> updateProduct(
      {
    //  required String id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    try {
      Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
      );
      return GetAllproductsModel.fromJson(data);
    } catch (e) {     
      throw Exception('Failed to load data updateProduct${e.toString()}');
    }
  }
}