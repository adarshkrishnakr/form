import 'package:hive/hive.dart';
part 'formModel.g.dart';

@HiveType(typeId: 1)
class FormModel  {
  @HiveField(0)
  String name;
  @HiveField(1)
  String apartmentName;
  @HiveField(2)
  String apartmentNo;
  @HiveField(3)
  int vehicleCount;
  @HiveField(4)
  int noOfSlots;
  @HiveField(5)
  List<String> selectedSlots;

  FormModel(
      {required this.name,
      required this.apartmentName,
      required this.apartmentNo,
      required this.vehicleCount,
      required this.noOfSlots,
      required this.selectedSlots});
}
