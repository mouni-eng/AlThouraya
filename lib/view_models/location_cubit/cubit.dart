import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:althouraya/extensions/list_extension.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/models/address.dart';
import 'package:althouraya/models/tour_model.dart';
import 'package:althouraya/models/location.dart';
import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/services/location_service.dart';
import 'package:althouraya/services/map/map_service.dart';
import 'package:althouraya/view_models/location_cubit/states.dart';
import 'package:althouraya/widgets/widgets/map/rentx_map_card.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit() : super(LocationStates());

  static LocationCubit get(context) => BlocProvider.of(context);

  final LocationService _locationService = LocationService();
  /*List<AppartmentModel> allApartments = [];
  AppartmentModel? currentApartment;*/
  Address? address;
  String? notes;
  RentXLocation location = RentXLocation(
    city: 'cairo',
    state: 'EG',
    street: '',
    zip: '',
    longitude: 30.06263,
    latitude: 31.24967,
  );
  final RentXMapController mapController = RentXMapController();
  late MapService _mapService;

  notesChange(String? value) {
    notes = value;
    emit(OnChangeState());
  }

  /*getAllApartments() {
    emit(GetAllApartmentsLoadingState());
    _homeService.getAllApartments().then((value) {
      if (value.docs.isEmpty) {
        emit(GetAllApartmentsSuccessState());
      }
      for (var apartment in value.docs) {
        allApartments.add(AppartmentModel.fromJson(apartment.data()));
        emit(GetAllApartmentsErrorState());
      }
    });
  }*/

  /*chooseApartment(AppartmentModel model) {
    currentApartment = model;
    emit(OnChangeState());
  }*/

  Future<List<RentXLocation>> searchLocation(final String address) async {
    return (await _mapService.query(address))
        .where((element) => element.city!.isNotEmpty)
        .toList()
        .unique((element) => element.fullAddress());
  }

  void fetchData() async {
    _mapService = await MapServiceFactory().getMapService();
  }

  updateLocation(RentXLocation loc) {
    _setLocation(loc);
    location = loc;
    mapController.move!.call(loc);
  }

  getCurrentLocation() {
    emit(LocationLoadingState());
    determinePosition().then((loc) {
      setPosition(RentXLatLong(loc.latitude, loc.longitude));
      emit(FindLocationSuccessState());
    }).catchError((err) {
      emit(LocationErrorState(error: err.toString()));
    });
  }

  _setLocation(RentXLocation value) {
    address = Address(
      latitude: value.latitude,
      longitude: value.longitude,
      zip: ZipUtil.parseZip(value.zip),
      street: value.street,
      street2: "",
      city: City(country: value.state, countryCode: 'EG', name: value.city),
      notes: notes,
    );
    emit(OnChangeState());
  }

  setPosition(RentXLatLong pos) {
    _mapService.exactLocation(pos).then((value) {
      printLn(value);
      updateLocation(value);
    });
  }

  updateUserLocation() {
    emit(LocationLoadingState());
    _locationService.updateLocation(address: address!,).then((value) {
      emit(LocationSuccessState());
    }).catchError((err) {
      emit(LocationErrorState(error: err.toString()));
    });
  }

  bool isVisible = false;

  searchOnChange() {
    isVisible = !isVisible;
    emit(OnChangeState());
  }

  searchOnTap() {
    isVisible = true;
    emit(OnChangeState());
  }
}
