import 'package:flutter/material.dart';

class LeaveApply extends StatefulWidget {
  const LeaveApply({Key key}) : super(key: key);

  @override
  _LeaveApplyState createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> {
  String dropdownValue1 = 'Choose Type';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Leave Apply')),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                child: Text(
                  'Types of Leaves',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 20, 0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 36,
                    elevation: 16,
                    underline: SizedBox(),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue1 = newValue;
                      });
                    },
                    items: <String>[
                      'Choose Type',
                      'Annual Leave',
                      'Sick Leave',
                      'Unpaid Leave'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,30,25,0),
                child: Container(
                  height: 227,
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
                            child: Text('Leave Type',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[800]
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(120,10,0,10),
                              child: Text("Annual Leave",style: TextStyle(
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
                            child: Text('Opening Leave',style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[800]
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90,10,0,10),
                            child: Text('20.50',style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[800]
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
                            child: Text('Leave Taken',style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[800]
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(105,10,0,10),
                            child:Text("0.00",style: TextStyle(
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
                            child: Text('Current Leave',style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800]
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(95,10,0,10),
                            child: Text("43.50",style: TextStyle(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25,10,0,10),
                            child: Text('Action',style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[800]
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(130,5,0,10),
                            child: IconButton(
                              icon: Icon(Icons.app_registration,
                                color: Colors.blue[700],
                              size: 30,),
                            )
                            //Text("",style: TextStyle(
                              //  fontSize: 17,
                                //color: Colors.grey[800]
                            //),
                           // ),

                          )

                        ],
                      ),

                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
