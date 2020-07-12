import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newhack/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CenterPage extends StatefulWidget {
  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  Future<File> file;
  File _file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  Future<http.StreamedResponse> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res;
  }

  String respStr = '1';
  String returnData = '';
  String slogan = '';


  Widget displaySelectedFile(File file) {
    return new ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(8)
      ),
      child: file == null
          ? new Image(image: AssetImage(
          'assets/images/no-image-available.png.jpeg'
      ),)
          : new Image.file(file, width: 300, height: 300, fit: BoxFit.fill,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blueAccent,
                Colors.deepPurpleAccent
              ]
          )
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(3),
                child:Container(
                  width: 300,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(25)
                      ),
                      child:Image(image: AssetImage(
                          'assets/images/newhacklogo.png'
                      ),)
                  ),
                ),
            )
                ),
                SizedBox( height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text('Slogans', style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),),
                          //displaySelectedFile(_file),
                          SizedBox(height: 10,),
                          Divider(thickness: 5,),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber, width: 5)
                            ),
                            child: Row(
                              children: <Widget>[
                                Text('1. Bat Lives Matter!'),
                                SizedBox(
                                  width: 110,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  color: Colors.black,
                                  onPressed: (){
                                  },
                                ),
                                Text('64'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(
                              children: <Widget>[
                                Text('2. Black Lives Matter!'),
                                SizedBox(
                                  width: 95,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  color: Colors.black,
                                  onPressed: (){
                                  },
                                ),
                                Text('32'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(
                              children: <Widget>[
                                Text('3. No Jusitce no PEace!'),
                                SizedBox(
                                  width: 95,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  color: Colors.black,
                                  onPressed: (){
                                  },
                                ),
                                Text('1'),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(thickness: 5,),
                          SizedBox(height: 10,),
                          Text('Submit your own Slogan!', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 10,),
                          TextField(
                              onChanged: (value) => slogan = value,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.assignment),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(3))
                                  ),
                                  hintText: 'Slogan',
                                  fillColor: Colors.deepPurpleAccent
                              )
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            child:RaisedButton(
                              child: Text('Submit'),
                              elevation: 10,
                              onPressed: () async{
                                var response = await http.post('http://eee4eb875000.ngrok.io/showslogan',
                                    headers: {"Content-Type": "application/json"},
                                    body: json.encode({"slogan" : slogan})
                                );
                                print(response.body);
                              },
                            ),
                          ),
                        ],

                      ),
                    )

                  ],

                ),
              ],
            ),
          ),
        )
    );
  }
}