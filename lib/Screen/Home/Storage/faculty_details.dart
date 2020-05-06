import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/Storage/loaduplaod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class Faculty_Details extends StatefulWidget {
  @override
  _Faculty_DetailsState createState() => _Faculty_DetailsState();
}

class _Faculty_DetailsState extends State<Faculty_Details> {
  List<String> fname = ['Niranjan_Bhattacharyya','Prof_Anuradha_bhasin','SD_chauhan','aakash_rathee','bhawna_dhull','jatin_gaur','jayant_bhardwaj','komal_bhagat','mansi_gupta','megha_aggarwal','monika_kaushik','pawan_sharma','prachi_kaushik','preeti_singh','rashmi_roges','risheek_kumar_mishra','sandeep_sharma','tanima_ghosh','usha_sharma'];
  List<String> pname = ['Dr. Niranjan Bhattacharyya','Ms. Anuradha Bhasin','Mr. SD Chauhan','Mr. Aakash Rathee','Ms. Bhawna Dhull','Mr. Jatin Gaur','jayant_bhardwaj','Ms. Komal Bhagat','Ms Mansi Gupta','Ms. Megha Aggarwal','Ms. Monika Kaushik','Mr. Pawan Sharma','Ms Prachi Kaushik','Ms. Preeti Singh','Ms. Rashmi Roges','Mr. Risheek Kumar Mishra','Mr. Sandeep Sharma','Ms Tanima Ghosh','Ms. Usha Sharma'];
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
              'Faculty Details',
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
                            arguments: '/faculty/'+fname[index]+'.jpg'
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
                            arguments: '/faculty/'+fname[index]+'.jpg'
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

