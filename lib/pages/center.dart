import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newhack/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

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

  String respStr = '';
  String returnData = '';
  String slogan = '';


  Widget displaySelectedFile(File file) {
    return new ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
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
                SizedBox( height: 50,),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(width: MediaQuery.of(context).size.width/ 3.5,),
                              SendButton(
                                icon: Icon(Icons.camera_alt, size: 50,),
                                callback: () async{
                                  var file = await ImagePicker.pickImage(source: ImageSource.camera);
                                  //   var res = await uploadImage(file.path, "http://4aa134b5af7c.ngrok.io/foodify");
                                  //       respStr = await res.stream.bytesToString();
                                  setState(() {
                                    _file = file;
                                    returnData = respStr;
                                  });
                                },
                              ),
                              SizedBox(width: 10,),
                              SendButton(
                                  icon: Icon(Icons.image, size: 50,),
                                  callback: () async {
                                    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
//                        var res = await uploadImage(file.path, "http://292bde44c00c.ngrok.io/file_analysis");
//                        respStr = await res.stream.bytesToString();
                                    setState(() {
                                      _file = file;
                                      returnData = respStr;
                                    });
                                  }
                              ),
                            ],
                          ),
                          Divider(thickness: 5,),
                          SizedBox(height: 10,),
                          displaySelectedFile(_file),
                          SizedBox(height: 10,),
                          Divider(thickness: 5,),
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
                            child: _file == null ? Text('Select an Image.', style: TextStyle(
                                fontSize: 22
                            ),) : RaisedButton(
                              child: Text('Submit'),
                              elevation: 10,
                              onPressed: (){

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