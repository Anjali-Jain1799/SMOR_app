import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';


class Firebase_Upload extends StatefulWidget {
  @override

  _Firebase_UploadState createState() => _Firebase_UploadState();
}

class _Firebase_UploadState extends State<Firebase_Upload> {


  File _imageFile;
  bool uploaded = false;
  String _downloadUrl;
  Future getImage(bool isCamera) async{
    File image;
    if(isCamera) {
      image= await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      image= await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile= image;
    });
  }
  Future uploadingImage(String path) async{
    StorageReference _reference = FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      uploaded = true;
    });

  }
  @override
  Widget build(BuildContext context) {
    String path = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Upload an Image'),

      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('Camera'),
                  onPressed: () {
                    getImage(true);

                  },
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Gallery'),
                  onPressed: () {
                    getImage(false);

                  },
                ),
                SizedBox(height: 10.0),
                _imageFile == null ? Container(): Image.file(_imageFile, height: 300.0, width: 300.0,),
                _imageFile==null? Container():
                RaisedButton.icon(
                  onPressed: (){
                     uploadingImage(path);
                     Navigator.pop(context);

                  },
                  icon:Icon( Icons.file_upload,
                  ),
                  label: Text('UPLOAD'),
                ),
              ],
            )
        ),
      ),
    );
  }
}
class Firebase_Download extends StatefulWidget {
  @override

  _Firebase_DownloadState createState() => _Firebase_DownloadState();
}

class _Firebase_DownloadState extends State<Firebase_Download> {


  File _imageFile;
  bool uploaded = false;
  String _downloadUrl;
  Future dowloadingImage(String path) async{
    StorageReference _reference = FirebaseStorage.instance.ref().child(path);
    String _downloadAddress = await _reference.getDownloadURL();
    setState(() {
      return _downloadUrl = _downloadAddress;
    });
  }
  @override
  Widget build(BuildContext context) {
    String path = ModalRoute.of(context).settings.arguments;
    dowloadingImage(path);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Image'),

      ),
      body: Center(
        child: Image.network(_downloadUrl),
      )
    );
  }
}
