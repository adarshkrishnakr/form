import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project1/model/formModel.dart';

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box('formDataBox').listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return Center(
              child: Text('No user details found.'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final formData = box.getAt(index) as FormModel;
                return ListTile(
                  title: Text(formData.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Apartment Name: ${formData.apartmentName}'),
                      Text('Apartment No: ${formData.apartmentNo}'),
                      Text('Vehicle Count: ${formData.vehicleCount}'),
                      Text('No Of Parking Slots: ${formData.noOfSlots}'),
                      
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
