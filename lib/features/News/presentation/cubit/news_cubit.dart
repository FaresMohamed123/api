import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testbloc2/features/News/data/models/GetAllproductsModel.dart';
import 'package:testbloc2/features/News/data/services/get_all_prodict_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  
  NewsCubit() : super(NewsInitial());

  List<GetAllproductsModel> model = [];

  void getAllProducts() async {
    emit(NewsLoading());
   GetAllProdictServices().getAllProducts().then(
      (value) {
        model = value;
        emit(NewsLoaded(model: model));
        
      },
    );
    
  }


 
}
