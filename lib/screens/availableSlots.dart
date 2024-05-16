import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project1/provider/formData.dart';

class AvailableSlot extends StatelessWidget {
  const AvailableSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Slots'),
        centerTitle: true,
      ),
      body: Consumer<FormData>(
        builder: (context, formData, child) {
          return ListView.builder(
            itemCount: formData.availableSlots.length,
            itemBuilder: (context, index) {
              final slot = formData.availableSlots[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  
                  title: Text(slot["name"]),
                  subtitle: Text("Price: ${slot["price"]}"),
                  tileColor: const Color.fromARGB(255, 99, 235, 104), 
                ),
                
              );
            },
          );
        },
      ),
    );
  }
}
