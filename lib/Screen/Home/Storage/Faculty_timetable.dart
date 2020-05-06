import 'package:flutter/material.dart';
import 'package:flutterapp/Screen/Home/Storage/loaduplaod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class FacultyTimeTable extends StatefulWidget {
  @override
  _FacultyTimeTableState createState() => _FacultyTimeTableState();
}

class _FacultyTimeTableState extends State<FacultyTimeTable> {
  List<String> fname = ['Niranjan_Bhattacharyya','risheek_kumar_mishra','sandeep_sharma','aakash_rathee','anuradha_bhasin','cm_sharma','deeksha','h_rajput','jayant_bhardwaj','komal_bhagat','mansi_gupta','megha_aggarwal','mugdha', 'muskaan_kapoor','rashmi_roges','reema_chadhary','tanisha','usha_sharma','sr_gupta'];
  List<String> pname = ['Dr. Niranjan Bhattacharyya','Mr. Risheek Kumar Mishra','Mr. Sandeep Sharma','Mr. Aakash Rathee','Ms. Anuradha Bhasin','Mr. CM Sharma','Ms Deeksha','Mr. H Rajput','Mr. Jayant Bhardwaj','Ms. Komal Bhagat','Ms.Mansi Gupta','Ms. Megha Aggarwal','Ms. Mugdha', 'Ms. Muskaan Kapoor','Ms. Rashmi Roges','Ms. Reema Chadhary','Ms. Tanisha','Ms. Usha Sharma','Mr SR Gupta'];
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
              'Faculty Time Table',
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
                            arguments: '/Time_table/Faculty_time_table/'+fname[index]+'.png'
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
                            arguments: '/Time_table/Faculty_time_table/'+fname[index]+'.png'
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

