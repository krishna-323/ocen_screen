import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../static_files/custom_popup_dropdown.dart';
import '../static_files/static_colors.dart';

class Approve extends StatefulWidget {
  final String title;
  const Approve({super.key, required this.title});

  @override
  State<Approve> createState() => _ApproveState();
}


class _ApproveState extends State<Approve> {
  //Drop Down Declaration.
  String scopeOfWork = "Select Action";
  bool _isTypeFocused = false;
  bool _invalidStatusType = false;
  List<String> scopeType = ["Approve", "Reject"];
  final awardStatusController =TextEditingController();

  final customerController=TextEditingController();
  final phoneNoController=TextEditingController();
  final countryController=TextEditingController();
  final pmcController1 =TextEditingController();
  final emailController = TextEditingController();
  final cityController= TextEditingController();
  final projectManager1 = TextEditingController();
  final pmcController2 = TextEditingController();
  final proposalController =TextEditingController();
  final stateController = TextEditingController();
  final projectManger2= TextEditingController();

  ///Validation Purpose Global Key.
  final _formKey = GlobalKey<FormState>();

  List awardStatus=[
    {
      'revision':'4',
      'submitted':'POC Name',
      'zerocost':'9500000.00',
      "amount":'9700000.00',
      'percentage':'2.1',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0XFFEFF3F7),
      appBar: AppBar(title:  Text(widget.title),
          shadowColor: Colors.grey
      ),
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
                        const Text("Approve",style: TextStyle(color: Colors.black,fontFamily: "Roboto"),),
                        MaterialButton(
                            color: Colors.blue,
                            child: const Text("Save",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              Map approveDetails = {
                                "customerName":customerController.text,
                                "phone":phoneNoController.text,
                                "country":countryController.text,
                                "pmc1":pmcController1.text,
                                "email":emailController.text,
                                "city":cityController.text,
                                "projectManager1":projectManager1.text,
                                "pmc2":pmcController2.text,
                                "proposal":proposalController.text,
                                "state":stateController.text,
                                "projectManager2":projectManger2.text,
                              };
                              print('--------approveDetails-----');
                              print(approveDetails);
                            })

                      ]),
                ),
              ),

              Padding(padding: const EdgeInsets.all(30),
                child: Form(
                  child: Column(
                    children: [
                      //First Card.
                      Card(
                        surfaceTintColor:const Color(0XFFFDFAFD),
                        child:Column(children: [
                          Container(
                            decoration: BoxDecoration(border: Border.all(color:Colors.black,width: 0.5 ),borderRadius: const BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //First.
                                      Text("Customer Name",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: customerController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Customer Business Name',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Third.
                                      Text("Phone No",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: phoneNoController,
                                        //validator:checkNameError,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        maxLength: 10,
                                        decoration: textFieldDecoration(hintText: 'Enter Phone',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Five.
                                      Text("Country",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: countryController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Country',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Seven.
                                      Text("PMC",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: pmcController1,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter PMC Name',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                    ],
                                  ),
                                ),
                                const SizedBox(width: 150,),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Second.
                                      Text("Email",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: emailController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Email',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Four.
                                      Text("City",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: cityController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter City',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Six.
                                      Text("Project Manager",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: projectManager1,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Project Manger',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),
                                      //Eight.
                                      Text("PMC #",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: pmcController2,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter PMC Contact Number',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                    ],
                                  ),
                                ),
                                const SizedBox(width: 150,),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //Second.
                                      Text("Proposal #",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: proposalController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Proposal',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Four.
                                      Text("State",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: stateController,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter State',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                      //Six.
                                      Text("Project Manager #",style: textFieldStyle,),
                                      const SizedBox(height: 6,),
                                      TextFormField(
                                        autofocus: true,
                                        controller: projectManger2,
                                        //validator:checkNameError,
                                        decoration: textFieldDecoration(hintText: 'Enter Project Manager',),
                                        onChanged: (value){

                                        },
                                      ),
                                      const SizedBox(height: 20,),

                                    ],
                                  ),
                                ),
                              ],),
                            ),
                          )
                        ]) ,),
                      const SizedBox(height: 30,),
                      //Second.
                      Card(
                        surfaceTintColor:const Color(0XFFFDFAFD),
                        child:Container(
                          decoration: BoxDecoration(border: Border.all(color:Colors.black,width: 0.5 ),borderRadius: const BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            children: [
                              Container(height: 35,
                                color: Colors.blue,
                                child: const Center(child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.0,top: 8),
                                      child: Text('Award Status',style: TextStyle(color: Colors.white),),
                                    ))),

                              ),
                              const SizedBox(height: 10,),
                              Padding(padding: const EdgeInsets.all(15),
                              child: Column(children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(children: [
                                    Expanded(child: Text("Revision",style: textFieldStyle,)),
                                    Expanded(child: Text("Submitted By",style: textFieldStyle,)),
                                    Expanded(child: Text("Zero Cost",style: textFieldStyle,)),
                                    Expanded(child: Text("Amount",style: textFieldStyle,)),
                                    Expanded(child: Text("Percentage",style: textFieldStyle,)),
                                    Expanded(child: Row(
                                      children: [
                                        Text("Action",style: textFieldStyle,),
                                        const Text("*",style: TextStyle(color: Colors.red),)
                                      ],
                                    )),
                                    SizedBox(
                                       width: 150,
                                        child: Text("",style: textFieldStyle,)),
                                  ]),
                                ),

                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:awardStatus.length,
                                      itemBuilder: (context, i) {
                                      return Row(children: [
                                        Expanded(child: Text("${awardStatus[i]['revision']??""}",style: textFieldStyle,)),
                                        Expanded(child: Text("${awardStatus[i]['submitted']??""}",style: textFieldStyle,)),
                                        Expanded(child: Text("${awardStatus[i]['zerocost']??""}",style: const TextStyle(color: Colors.blue),)),
                                        Expanded(child: Text("${awardStatus[i]['amount']??""}",style: const TextStyle(color: Colors.blue),)),
                                        Expanded(child: Row(
                                          children: [
                                            const Text("+",style: TextStyle(color: Colors.green),),
                                            const SizedBox(width: 5,),
                                            Text("${awardStatus[i]['percentage']??""}",style: const TextStyle(color: Colors.green)),
                                            const SizedBox(width: 5,),
                                            const Text("%",style: TextStyle(color: Colors.green),),
                                          ],
                                        )),
                                        Expanded(child: Focus(
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
                                                },textController: awardStatusController,
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
                                                    awardStatusController.text=value;
                                                    _invalidStatusType = false;
                                                  });
                                                },
                                                onCanceled: () {},
                                                child: Container(),
                                              );
                                            },
                                          ),
                                        )),
                                        const SizedBox(width: 10,),
                                        SizedBox(
                                          width: 150,
                                          child: MaterialButton(
                                            color: Colors.blue,
                                            child: const Text("Submit",style: TextStyle(color: Colors.white),),
                                            onPressed: (){

                                          },),
                                        ),
                                        const SizedBox(width: 10,),
                                      ]);
                                    },),
                                  ),
                                )
                              ]),
                              )

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25,),
                    ],
                  ),
                ),),
            ],
          )),
    );
  }

}





