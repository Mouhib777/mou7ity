import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/NavBar/assistant/Googlemaps.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
   bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  ImagePicker? imagePicker;
  File? _pickedImage;
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tell community about this place"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight*0.03,), 
            Container(
              height: screenHeight*0.15,
              width: screenWidth*0.8,
              decoration: BoxDecoration(
                color: color1.withOpacity(0.4) , 
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: screenHeight*0.09, right: screenHeight*0.09),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Tell us how we can help",
                  enabledBorder: InputBorder.none
                    ),
                  ),
                ),
              ),
            ), 
            SizedBox(height: screenHeight*0.15,), 
             InkWell(
                  onTap: () async {
                    var alertStyle = AlertStyle(
                      overlayColor: Colors.green,
                      animationType: AnimationType.shrink,
                      isCloseButton: false,
                      isOverlayTapDismiss: false,
                      descStyle: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      animationDuration: Duration(milliseconds: 400),
                      alertBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                          color: color1,
                        ),
                      ),
                      titleStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: color1,
                          fontWeight: FontWeight.bold),
                    );

                    Alert(
                      context: context,
                      style: alertStyle,
                      type: AlertType.none,
                      title: "Add picture for your profile",
                      buttons: [
                        DialogButton(
                          child: Icon(
                            Icons.drive_folder_upload,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            handle_image_gallery();
                            Navigator.pop(context);
                          },
                          color: color1,
                          radius: BorderRadius.circular(10.0),
                        ),
                        DialogButton(
                          child: Icon(
                            CupertinoIcons.camera,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            handle_image_camera();
                            Navigator.pop(context);
                          },
                          color: color1,
                          radius: BorderRadius.circular(10.0),
                        ),
                      ],
                ).show();
              },
              child: SizedBox(
                  height: 200,
                  // width: 270,
                  child: Container(
                    child: _pickedImage == null
                        ? Text("Add a picture", 
                        style: GoogleFonts.montserrat(
                          fontSize: 20 , 
                          fontWeight: FontWeight.bold
                        ),
                        )
                        : Image.file(_pickedImage!),
                  )
                
                                    ),
                ),
                SizedBox(height: screenHeight*0.17,),
                SizedBox(
                  height: screenHeight*0.07,
                  width: screenWidth*0.7,
                  child: ElevatedButton(onPressed: (){
                             pushNewScreenWithRouteSettings(context,
                    screen: StartScreen(),
                    settings: RouteSettings(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
                
                  }, child:Text("Share it", 
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500 , 
                    fontSize: 25
                  ),
                  )),
                ) 
                
            
          ],
        ),
      ),
    );
  }
   handle_image_camera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {
      EasyLoading.showError('No image selected');
    }
  }

  handle_image_gallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {
      EasyLoading.showError('No image selected');
    }
  }
}