import 'dart:io';
import 'package:azimio/constants.dart';
import 'package:azimio/models/secretariat_model.dart';
import 'package:azimio/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseService _db = DatabaseService();
  // text field state
  String title = '';
  String imageUrl='';
  String first_name='';
  String last_name='';
  String county='';
  String feedback ='';
  String gender ='';

  String password = '';
  String error = '';
  bool loading = false;
  bool vote=false;
   uploadFile()async{
    //File file = File(filePath);
       final _firebaseStorage = FirebaseStorage.instance;
       final _firestore = FirebaseFirestore.instance;
       final _imagePicker = ImagePicker();
       final XFile?  image;
     image = await _imagePicker.pickImage(source: ImageSource.gallery);
     File file = File(image!.path);
         var fileName = image.name;
         if (image != null){
           //Upload to Firebase
           var snapshot = await _firebaseStorage.ref()
               .child('gallery/$fileName')
               .putFile(file);
           final  downloadUrl = await snapshot.ref.getDownloadURL();
           setState(() {
             imageUrl = downloadUrl;
             _firestore.collection("gallery").add({
               "image":imageUrl,
               'title':title
             });
             Navigator.pop(context);
             print(imageUrl);
           });
         } else {
           print('No Image Path Received');
         }
  }
  // uploadImage() async {
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   final _imagePicker = ImagePicker();
  //   final XFile?  image;
  //   //Check Permissions
  //   await Permission.photos.request();
  //
  //   var permissionStatus = await Permission.photos.status;
  //
  //   if (permissionStatus.isGranted){
  //     //Select Image
  //     image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //     var file = File(image!.path);
  //     var fileName = image.name;
  //
  //     if (image != null){
  //       //Upload to Firebase
  //       var snapshot = await _firebaseStorage.ref()
  //           .child('gallery/$fileName')
  //           .putFile(file);
  //       var downloadUrl = await snapshot.ref.getDownloadURL();
  //       setState(() {
  //         imageUrl = downloadUrl;
  //       });
  //     } else {
  //       print('No Image Path Received');
  //     }
  //   } else {
  //     print('Permission not granted. Try Again with permission access');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3, // Space between grid
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
        ),
        // It will wrap its content and be as big as it children allows it to be
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(), // This line avoiding some errors
        padding: EdgeInsets.zero,
        itemCount: azimioSecretariat.length,
        itemBuilder: (ctx, index) {
        return Center(
        child: Container(
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Container(
                width: 220,
                height: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image:  DecorationImage(
                      image: NetworkImage(
                          azimioSecretariat[index].image),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    azimioSecretariat[index].name
                ),
              )
            ],
          ),
        ),
        ),
        );
        },
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      validator: (val) => val!.isEmpty ? 'Enter your title' : null,
                      onChanged: (val) {
                        setState(() => title = val);
                      },
                      decoration: const InputDecoration(
                        hintText: "Title",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0,),
                            TextButton.icon(
                              icon: Icon(Icons.camera),
                              label: Text('Upload Image'),
                              onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                  //setState(() => loading = true);
                                  uploadFile();
                                }

                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: defaultPadding / 2),
                  ],
                ),
              ),
            ),
          );
          },
      );
        },
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

    );

        }
  }

