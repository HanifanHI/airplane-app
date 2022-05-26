import 'package:airplane_apps/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationServices {
  // * CREATE OBJECT COLLECTION REFERENCES
  CollectionReference _destinationReferences =
      FirebaseFirestore.instance.collection('destinations');

  // * CREATE METHODE FECTH DATA
  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      // * MENGAMBIL DATA DARI COLLECTION DESTINATIONS
      QuerySnapshot result = await _destinationReferences.get();

      // * MAPPING DATA
      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
