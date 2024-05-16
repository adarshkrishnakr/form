import 'package:flutter/material.dart';

class BuySlot extends StatelessWidget {
  final List<Map<String,dynamic>> selectedSlots;

  const BuySlot({super.key,required this.selectedSlots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BUY SLOT"),
      ),
     body: Center(
       child: ListView.builder(
        itemCount: selectedSlots.length,
        itemBuilder: (context,index){
          final slot = selectedSlots[index];
          final slotName = slot["name"];
          final slotPrice = slot["price"];
          return ListTile(
            title: Text(slotName),
            subtitle: Text(slotPrice),
          );
        },
       ),
     ),
    );
  }
}