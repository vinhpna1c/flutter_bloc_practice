import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';
import 'package:flutter_bloc_practice/models/place.dart';
import 'package:flutter_bloc_practice/services/data_service.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices dataService;
  late final places;
  AppCubits({required this.dataService}) : super(InitialState()) {
    emit(WelcomeState());
  }
  void getData() async {
    try {
      emit(LoadingState());
      places = await dataService.getInfo();
      emit(LoadedState(places: places));
    } catch (e) {}
  }

  void getDetailPlace(Place detailPlace) {
    emit(DetailState(place: detailPlace));
  }

  void goHome() {
    emit(LoadedState(places: places));
  }
}
