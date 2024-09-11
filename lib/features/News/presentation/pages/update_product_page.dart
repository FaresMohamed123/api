import 'package:flutter/material.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';
import 'package:testbloc2/features/News/data/services/update_product_services.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, description, image;

  String? price;

  @override
  Widget build(BuildContext context) {
    GetAllproductsModel models = ModalRoute.of(context)!.settings.arguments as GetAllproductsModel;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Product Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    image = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Product image',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    price = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Product Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    UpdateProductServices().updateProduct(
                       
                        title: name!,
                        price: price!.toString(),
                        description: description!,
                        image: image!,
                        category: models.category!);
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ));
  }
}
