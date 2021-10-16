import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DocumentDetails extends StatefulWidget {
  const DocumentDetails({Key key}) : super(key: key);

  @override
  _DocumentDetailsState createState() => _DocumentDetailsState();
}

class _DocumentDetailsState extends State<DocumentDetails> {
  List listOfResponse;

  Future fetchData() async {
    http.Response response;
    response = await http.post(Uri.parse(''));

    if(response.statusCode==200) {
      setState(() {
        listOfResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Document Detail')),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      body: listOfResponse == null
          ? Container():
      SingleChildScrollView(
        child: Container(
          height: 810,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,30,25,0),
                      child: Container(
                        height: 170,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7
                            ),],

                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25,10,0,10),
                                  child: Text('Id',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey[800]
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(197,10,0,10),
                                    child: Text(listOfResponse[index]['id'].toString(),style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold
                                    ),)
                                )

                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Colors.grey[500],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25,10,0,10),
                                  child: Text('Document Name',style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[800]
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(83,10,0,10),
                                  child: Text(listOfResponse[index]['document_name'].toString(),style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.green
                                  ),),
                                )

                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Colors.grey[500],
                            ),
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25,10,0,10),
                                  child: Text('Document No.',style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[800]
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(100,10,0,10),
                                  child:Text(listOfResponse[index]['document_no'].toString(),style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[800]
                                  ),
                                  ),
                                )

                              ],
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Colors.grey[500],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(25,10,0,10),
                                  child: Text('Date Of Validity',style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[800]
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(95,10,0,10),
                                  child: Text(listOfResponse[index]['date_of_validity'].toString(),style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[800]
                                  ),
                                  ),
                                )

                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                },
                itemCount: listOfResponse == null ? 0 : listOfResponse.length,
              )

            ],
          ),
        ),
      ),
    );
  }
}
