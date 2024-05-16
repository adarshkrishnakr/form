

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project1/screens/availableSlots.dart';
import 'package:project1/screens/buySlots.dart';
import 'package:project1/screens/userDetails.dart';
import 'package:provider/provider.dart';
import 'package:project1/provider/formProvider.dart';
import 'package:project1/provider/formData.dart';
import 'package:project1/model/formModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 228, 233),
      body: Center(
        child: SubmitButton(),
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  final nameController = TextEditingController();
  final apartmentController = TextEditingController();
  final apartmentNameController = TextEditingController();
  List<String> selectedSlots = [];
  bool isFormValid = false;

  void formValidation() {
    setState(() {
      isFormValid = nameController.text.isNotEmpty &&
          apartmentNameController.text.isNotEmpty &&
          apartmentController.text.isNotEmpty;
    });
  }

  void handleSubmit() async {
    if (!isFormValid) return;

    final formDataBox = await Hive.openBox('formDataBox');
    final formModel = FormModel(
      name: nameController.text,
      apartmentName: apartmentNameController.text,
      apartmentNo: apartmentController.text,
      vehicleCount: context.read<FormProvider>().count.value,
      noOfSlots: context.read<FormProvider>().slotsCount.value,
      selectedSlots: selectedSlots,
    );

    await formDataBox.add(formModel);

    
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey[500],
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onChanged: (_) => formValidation(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: TextField(
              controller: apartmentNameController,
              decoration: InputDecoration(
                hintText: "Apartment Name",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey[500],
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onChanged: (_) => formValidation(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: apartmentController,
              decoration: InputDecoration(
                hintText: "Apartment No",
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                fillColor: Colors.grey[500],
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onChanged: (_) => formValidation(),
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 380,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No of Vehicles:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Consumer<FormProvider>(
                  builder: (context, vehicleCount, child) => Row(
                    children: [
                      IconButton(
                        onPressed: () => vehicleCount.increment(),
                        icon: Icon(Icons.add,color: Colors.green,),
                        iconSize: 32,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${context.watch<FormProvider>().count.value}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () => vehicleCount.decrement(),
                        icon: Icon(Icons.remove,color: Colors.red,),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 380,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No of Parking Slots:",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Consumer<FormProvider>(
                  builder: (context, vehicleCount, child) => Row(
                    children: [
                      IconButton(
                        onPressed: () => vehicleCount.slotsCountInc(),
                        icon: Icon(Icons.add,color: Colors.green,),
                        iconSize: 32,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${context.watch<FormProvider>().slotsCount.value}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () => vehicleCount.slotsCountDec(),
                        icon: Icon(Icons.remove,color: Colors.red,),
                        iconSize: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        
          SizedBox(
            height: 40,
          ),

          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AvailableSlot()));
          }, child: Text("Buy Slot",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
         
          SizedBox(height: 40),
          Visibility(
            visible: isFormValid,
            child: GestureDetector(
              onTap: () {
                handleSubmit();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetailsPage()));
              },
              child: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
