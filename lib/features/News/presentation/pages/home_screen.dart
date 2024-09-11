import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';
import 'package:testbloc2/features/News/data/services/get_all_prodict_services.dart';
import 'package:testbloc2/features/News/presentation/cubit/news_cubit.dart';
import 'package:testbloc2/features/News/presentation/pages/update_product_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('New Trend'),
          centerTitle: true,
        ),
        body: const GridViewbuilderPage());
  }
}

class GridViewbuilderPage extends StatelessWidget {
  const GridViewbuilderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetAllproductsModel>>(
      future: GetAllProdictServices().getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GetAllproductsModel> model = snapshot.data!;
  return GridView.builder(
    itemCount: model.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) => CardPage(
      model:model[index],
     
    ),
  );
} else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}

class CardPage extends StatelessWidget {
  const CardPage({
    super.key,
    required this.model,
  
  });

  final GetAllproductsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  UpdateProductPage(),
                    settings: RouteSettings(arguments: model),
                  ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: const Card(
                elevation: 8,
                color: Colors.white,
              ),
            ),
            Positioned(
              
                top: -20,
                right: 20,
                child: Image.network(
                  model.image!,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                )),
            const Positioned(
              bottom: 60,
              right: 30,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
             Positioned(
              bottom: 50,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title!.substring( 0,10),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text('\$ ${model.price}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
