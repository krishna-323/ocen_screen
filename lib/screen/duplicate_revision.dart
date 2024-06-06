import 'package:flutter/material.dart';

import '../static_files/custom_popup_dropdown.dart';
import '../static_files/static_colors.dart';

class DuplicateRevision extends StatefulWidget {
  final String title;
  const DuplicateRevision({super.key, required this.title});

  @override
  State<DuplicateRevision> createState() => _DuplicateRevisionState();
}

class _DuplicateRevisionState extends State<DuplicateRevision> {
  final awardStatus=TextEditingController();
  String scopeOfWork = "Select Revision";
  bool _isTypeFocused = false;
  bool _invalidStatusType = false;
  List<String> scopeType = ["Revision1", "Revision2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 40,
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black,width: 0.5))),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(children: [
                        InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_outlined,color: Colors.black,)),
                        const Text("Go Back",style: TextStyle(color: Colors.black),),
                      ],),
                      const Text("Duplicate Revision",style: TextStyle(color: Colors.black,fontFamily: "Arial"),),
                      MaterialButton(
                          color: Colors.blue,
                          child: const Text("Save",style: TextStyle(color: Colors.white),),
                          onPressed: (){

                          })

                    ]),
              ),
            ),
            Padding(padding: const EdgeInsets.all(100),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex:1,child: Container()),
                  Expanded(flex:2,child: Card(
                    color: const Color(0xFFF4F4F4),
                    child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        color: Colors.blue,
                      ),
                      height: 40,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all( 10.0),
                        child: Align(alignment: Alignment.topLeft,
                          child: Text("Select Revision", style: textFieldStyle2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20,bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Select Revision", style: textFieldStyle),
                              const SizedBox(width: 5,),
                              const Text('*', style: TextStyle(color: Colors.red)),
                            ],
                          ),

                          const SizedBox(height: 20),
                          Focus(
                            onFocusChange: (value) {
                              setState(() {
                                _isTypeFocused = value;
                              });
                            },
                            skipTraversal: true,
                            descendantsAreFocusable: true,
                            child: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                return CustomPopupMenuButton(
                                  elevation: 4,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        _invalidStatusType = true;
                                      });
                                      return null;
                                    }
                                    return null;
                                  },textController: awardStatus,
                                  decoration: customPopupDecoration(
                                    hintText: scopeOfWork,
                                    error: _invalidStatusType,
                                    isFocused: _isTypeFocused,
                                  ),
                                  hintText: scopeOfWork,
                                  childWidth: constraints.maxWidth,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: _invalidStatusType ? Colors.redAccent : mTextFieldBorder,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  ),
                                  offset: const Offset(1, 40),
                                  tooltip: '',
                                  itemBuilder: (BuildContext context) {
                                    return scopeType.map((value) {
                                      return CustomPopupMenuItem(
                                        value: value,
                                        text: value,
                                        child: Container(),
                                      );
                                    }).toList();
                                  },
                                  onSelected: (String value) {
                                    setState(() {
                                      scopeOfWork = value;
                                      awardStatus.text=value;
                                      _invalidStatusType = false;
                                    });
                                  },
                                  onCanceled: () {},
                                  child: Container(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                              color: Colors.blue,
                              child: const Text("Duplicate",style: TextStyle(color: Colors.white),),
                              onPressed: (){

                          }),
                          const SizedBox(height: 20),

                        ],
                      ),
                    ),
                ],
              ),
                  ),),
                  Expanded(flex:1,child: Container()),
                  Expanded(flex:2,child: Card(
                    color: const Color(0xFFF4F4F4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            color: Colors.blue,
                          ),
                          height: 40,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all( 10.0),
                            child: Align(alignment: Alignment.topLeft,
                              child: Text("Excel Upload", style: textFieldStyle2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20,bottom: 10),
                          child: Column(
                            children: [
                            const Icon(Icons.cloud_upload_rounded,size:25,color: Colors.black,),
                              const SizedBox(height: 20,),
                              const Text("Upload Excel"),
                              const SizedBox(height: 20,),
                              MaterialButton(
                                  color: Colors.blue,
                                  child: const Text("Upload",style: TextStyle(color: Colors.white),),
                                  onPressed: (){

                                  }),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),),
                  Expanded(flex:1,child: Container()),
            ]),
            ),
          ],
        ),
      ),
    );
  }
}
