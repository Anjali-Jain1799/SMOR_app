import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/Storage/loaduplaod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class Other_info extends StatefulWidget {
  @override
  _Other_infoState createState() => _Other_infoState();
}

class _Other_infoState extends State<Other_info> {
  List<String> fname = ['Publications','ece','nt_staff','staff'];
  List<String> pname = ['Research and Publication', 'Department Photo', 'Non Technical Staff', 'Technical Staff'];
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            'Other Information',
            style: TextStyle(
              fontSize: 30.0,)
        ),

      ),
      body: ListView.builder(
        itemCount: fname.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pname[index]),
            trailing: Wrap(
              spacing: 0, // space between two icons
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => Firebase_Upload(),
                        settings: RouteSettings(
                            arguments: '/'+fname[index]+'.jpg'
                        ))
                    );
                  },
                ),

                IconButton(
                  icon: Icon(Icons.file_download),
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => Firebase_Download(),
                        settings: RouteSettings(
                            arguments: '/'+fname[index]+'.jpg'
                        ))
                    );
                  },
                ),
              ],
            ),

          );
        },
      ),
    );
  }

}

