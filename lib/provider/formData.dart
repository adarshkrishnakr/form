import 'package:flutter/material.dart';



class FormData extends ChangeNotifier{
  String name = '';
  String apartmentName = '';
  String apartmentNo = '';
  int vehicleCount = 0;
  int noOfSlots = 0;
  List <String> selectedSlots = [];
  List<Map<String, dynamic>> availableSlots = [
    {"name": "A2", "price": "1200"},
    {"name": "C6", "price": "750"},
    {"name": "B1", "price": "1000"},
    {"name": "A4", "price": "1200"},
    {"name": "C5", "price": "750"},
    {"name": "D3", "price": "500"},
    {"name": "C2", "price": "750"}
  ];

  void setData({
    required String name,
    required String apartmentName,
    required String apartmentNo,
    required int vehicleCount,
    required int noOfSlots,
    required List<String> selectedSlots,
    required List<String> availableSlots,
  }){
    this.name = name;
    this.apartmentNo = apartmentNo;
    this.apartmentName = apartmentName;
    this.vehicleCount = vehicleCount;
    this.noOfSlots = noOfSlots;
    this.selectedSlots=selectedSlots;
    this.availableSlots;
    
    notifyListeners();
  }

}