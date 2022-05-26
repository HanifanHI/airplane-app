import 'package:airplane_apps/models/destination_model.dart';
import 'package:airplane_apps/services/destination_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  // * CREATE METHODE
  void fetchDestinations() async {
    try {
      // * KETIKA LOADING
      emit(DestinationLoading());

      // * MENGAKSES METHODE FETCH DATA PADA DESTINATION SERVICES
      List<DestinationModel> destinations =
          await DestinationServices().fetchDestinations();

      // * KETIKA SUCCESS
      emit(DestinationSuccess(destinations));
    } catch (e) {
      // * KETIKA ERROR
      emit(DestinationFailed(e.toString()));
    }
  }
}
