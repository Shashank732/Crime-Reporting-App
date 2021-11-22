import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class ReportCrime extends StatefulWidget {
  ReportCrime({Key? key}) : super(key: key);

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

class _ReportCrimeState extends State<ReportCrime> {
  var nameController = TextEditingController();

  var addressController = TextEditingController();

  var descriptionController = TextEditingController();

  var phoneNumberController = TextEditingController();

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Crime"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(width: 10,height: 10,),

              ElevatedButton(onPressed: () async{

                FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);

                if (result != null) {
                  file = File(result.files.single.path!);
                  setState(() {
                    file=file;
                  });

                } else {
                  setState(() {
                    file = null;
                  });
                  Get.snackbar("No file chosen","You proceeded without choosing a file");
                }

              }, child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Pick an image', style: TextStyle(fontSize: 20),),
              )),

              if(file!=null)
              Image(
                image: FileImage(file!),
              ),
              SizedBox(width: 10,height: 10,),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Crime eg. Theft/Harassment/Cyber Crime",
                    labelText: "Crime Title",
                    labelStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              SizedBox(width: 10,height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                      hintText: "Crime Description eg. There was a hit and run case at 11:30pm in front of XYZ school.",
                      labelText: "Crime Description",
                      labelStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              SizedBox(width: 10,height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Phone Number",
                      labelText: "Phone Nmber",
                      labelStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              SizedBox(width: 10,height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Crime Location eg. Sector-29 market parking ",
                      labelText: "Crime Location",
                      labelStyle: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              SizedBox(width: 10,height: 10,),

              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Submit",style: TextStyle(fontSize: 20),),
                ),
                onPressed: () async{

                  var name = nameController.text.toString();
                  var phoneNum = phoneNumberController.text.toString();
                  var description = descriptionController.text.toString();
                  var location = addressController.text.toString();

                  final Email email = Email(
                    body: 'Crime Title : $name\n Crime Desciption: $description\n Crime Location: $location\n Reporters Contact : $phoneNum',
                    subject: 'Crime Report',
                    attachmentPaths: file!=null?<String>[file!.path.toString()]: <String>[],
                    recipients: ['shashankgoel9971@gmail.com'],
                  );

                  await FlutterEmailSender.send(email);

                  Get.snackbar("Successful", "Crime Reported Successfully");


                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
