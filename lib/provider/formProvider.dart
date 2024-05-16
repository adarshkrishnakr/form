import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
 

   ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<int> _slotsCount = ValueNotifier<int>(0);
  ValueNotifier<int> get count => _count;
  ValueNotifier<int> get slotsCount => _slotsCount;

  void increment() {
    _count.value++;
    notifyListeners();
  }

  void decrement() {
    if (_count.value > 0) {
      _count.value--;
      notifyListeners();
    }
  }

  void slotsCountInc(){
    _slotsCount.value++;
    notifyListeners();
  }

   void slotsCountDec(){
    if(slotsCount.value>0){
      _slotsCount.value--;
    }
    notifyListeners();
  }

   void resetCount() {
    _count.value = 0;
    _slotsCount.value = 0;
    notifyListeners();
  }
}

