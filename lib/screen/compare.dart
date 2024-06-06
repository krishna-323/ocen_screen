import 'dart:developer';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../static_files/custom_popup_dropdown.dart';
import '../static_files/static_colors.dart';

class Compare extends StatefulWidget {
  final String title;
  const Compare({super.key, required this.title,});

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  final _horizontalScrollController = ScrollController();
  //final _verticalScrollController = ScrollController();
  final customerNameController=TextEditingController();
  final creationDateController=TextEditingController();
  final businessPartner=TextEditingController();

  bool loading = false;
  List responseData=[];

  List filteredList=[];


  List displayList=[];
  int startVal=0;

  //Static Data.
  List tempStoreData = [
    {
      'customerName':"DP World1",
      "projectName":"Project1",
      "location":"Gujarat",
      "zeroCost":"9500000.00",
      "margin1":"0",
      "revision":"100000000.0",
      "margin2":'5.2',
      'award':'9300000.00',
      "percentage":"-2.1"
    },
    {
      'customerName':"DP World2",
      "projectName":"Project2",
      "location":"Gujarat",
      "zeroCost":"9500000.00",
      "margin1":"0",
      "revision":"100000000.0",
      "margin2":'5.2',
      'award':'9300000.00',
      "percentage":"2.1"
    }
  ];

  // ///BTP get Api call.
  // Future<void> getCustomers() async {
  //   String url = "https://firstapp-boisterous-crocodile-uu.cfapps.in30.hana.ondemand.com/api/sap_odata_get/API_BUSINESS_PARTNER/A_BusinessPartner";
  //   try {
  //     List<dynamic> tempStoreData = await fetchGetApiData(url);
  //     setState(() {
  //       responseData = tempStoreData;
  //       filteredList = tempStoreData;
  //
  //
  //       if (displayList.isEmpty) {
  //         if (filteredList.length > 15) {
  //           for (int i = 0; i < startVal + 15; i++) {
  //             displayList.add(filteredList[i]);
  //           }
  //         } else {
  //           for (int i = 0; i < filteredList.length; i++) {
  //             displayList.add(filteredList[i]);
  //           }
  //         }
  //       }
  //     });
  //     loading=false;
  //   } catch (e) {
  //     // Handle errors here
  //     log("Error fetching customers: $e");
  //   }
  // }
  // ///aws Api call.
  // Future<void> getCustomerFromAws() async {
  //   String url = "https://snvvlfyg7f.execute-api.ap-south-1.amazonaws.com/stage1/api/customerdetails/get_all_customerdetails";
  //   final resData = await http.get(Uri.parse(url));
  //   final responseBody= jsonDecode(resData.body);
  //   try {
  //     //  List<dynamic> tempStoreData = await fetchGetApiData(url);
  //     setState(() {
  //       responseData = responseBody;
  //       filteredList = responseBody;
  //
  //
  //       if (displayList.isEmpty) {
  //         if (filteredList.length > 15) {
  //           for (int i = 0; i < startVal + 15; i++) {
  //             displayList.add(filteredList[i]);
  //           }
  //         } else {
  //           for (int i = 0; i < filteredList.length; i++) {
  //             displayList.add(filteredList[i]);
  //           }
  //         }
  //       }
  //     });
  //     loading=false;
  //   } catch (e) {
  //     // Handle errors here
  //     log("Error fetching customers: $e");
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState.
    //getCustomers();
    //getCustomerFromAws();
    if(tempStoreData.isNotEmpty){
            responseData = tempStoreData;
            filteredList = tempStoreData;
            if (displayList.isEmpty) {
              if (filteredList.length > 15) {
                for (int i = 0; i < startVal + 15; i++) {
                  displayList.add(filteredList[i]);
                }
              } else {
                for (int i = 0; i < filteredList.length; i++) {
                  displayList.add(filteredList[i]);
                }
              }
            }
    }

    loading=true;
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
    responseData=[];
    filteredList=[];

  }


  ifEmpty(){
    setState(() {
      if(filteredList.length>15){
        for(int i=0;i<startVal+15;i++){
          displayList.add(filteredList[i]);
        }
      }
      else{
        for(int i=0;i<filteredList.length;i++){
          displayList.add(filteredList[i]);
        }
      }
    });
  }

  //Filtered Business PartnerName.
  List _filterBusinessPartnerName(String searchTerm, String key) {
    // FilteredList .
    List filteredList=[];
    // Bool For Declaration.

    bool hasMatch = false;
    // For Lop For Iterating.
    for(var bp in responseData){

      // Matching Item With startsWith Method.
      if(bp[key].toLowerCase().startsWith(searchTerm.toLowerCase())){
        // If Matching Data Adding To Filtered List.
        filteredList.add(bp);
        // Making True For Checking Unmatched Data.
        hasMatch =true;
      }
    }
    // If Unmatched Data  Assigning Filtered List Empty.
    if(hasMatch==false){
      setState(() {
        filteredList=[];
      });
    }
    return filteredList;
  }

  // Fetch Customer Name.
  fetchByCustomerName(String controllerText, String key){
    if(displayList.isEmpty) {
      filteredList=  _filterBusinessPartnerName(controllerText,key);

      if (filteredList.length > 15) {
        for(int i=startVal;i<startVal + 15;i++){
          setState(() {
            displayList.add(filteredList[i]);
          });
        }
      }
      else {
        for(int i=startVal;i<filteredList.length;i++){
          setState(() {
            displayList.add(filteredList[i]);
          });
        }
      }
    }
  }

  //Filtered By Creation Date.
  List _filterDate(String searchTerm, String key) {
    // Filter the business partners based on the search term
    List filteredList = [];
    bool hasMatch = false; // Flag to track if any matches are found

    for (var bp in responseData) {
      if (convertDate(bp[key]).startsWith(searchTerm)) {
        filteredList.add(bp);
        hasMatch = true; // Set the flag to true if a match is found
      }
    }

    // If no matches found, assign filteredList to an empty list
    if (hasMatch==false) {
      filteredList = [];
    }

    return filteredList;
  }

  // Fetch Customer Date.
  fetchByDate(String controllerText, String key){
    if(displayList.isEmpty) {
      filteredList=  _filterDate(controllerText,key);
      if (filteredList.length > 15) {
        for(int i=startVal;i<startVal + 15;i++){
          setState(() {
            displayList.add(filteredList[i]);
          });
        }
      }
      else {
        for(int i=startVal;i<filteredList.length;i++){
          setState(() {
            displayList.add(filteredList[i]);
          });
        }
      }
    }
  }
  ///Drop down declaration.
  //First.
  String status = "Status";
  bool _isTypeFocused = false;
  bool _invalidStatusType = false;
  List<String> scopeType = ["Approve", "Reject"];
  final awardStatusController =TextEditingController();
 //Second.
  String financialYear = "Financial Year";
  bool financialBoolFocus = false;
  bool _invalidFinancialYear = false;
  List<String> financialDropdown = ["2022 - 2023", "2023 - 2024"];
  final financialController =TextEditingController();
  //Third.
  String financialYear1 = "Region";
  bool financialBoolFocus1 = false;
  bool _invalidFinancialYear1 = false;
  List<String> financialDropdown1 = ["Mumbai", "Kolkata"];
  final financialController1 =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1140) {
            return tableStructure(context, constraints.maxWidth);
          } else {
            return AdaptiveScrollbar(
              position: ScrollbarPosition.bottom,
              underColor: Colors.blueGrey.withOpacity(0.3),
              sliderDefaultColor: Colors.grey.withOpacity(0.7),
              sliderActiveColor: Colors.grey,
              controller: _horizontalScrollController,
              child: SingleChildScrollView(
                controller: _horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: tableStructure(context,1140),
              ),
            );
          }
        },
      ),
    );
  }
  ///table.
  Widget tableStructure(BuildContext context,double screenWidth,){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[50],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0,right: 40,top: 30,bottom: 30),
          child: Container(
            // Screen Width For Smaller Screen.
            width:screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE0E0E0),)
            ),
            child: Column(children: [

              // Table Header With Names.
              Container(
                //height: 198,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                  ),

                  child: Column(
                    children: [
                      const SizedBox(height: 18,),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0,right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("Project List", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),
                      const SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18),
                        child: SizedBox(height: 60,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                   //First.
                                    SizedBox(width: 190,height: 30, child: TextFormField(
                                      controller:businessPartner,
                                      onChanged: (value){
                                        if(value.isEmpty || value==""){
                                          startVal=0;
                                          displayList=[];
                                          filteredList = responseData;
                                          ifEmpty();
                                        }
                                        else if(creationDateController.text.isNotEmpty || customerNameController.text.isNotEmpty){
                                          creationDateController.clear();
                                          customerNameController.clear();
                                        }
                                        else{
                                          print('------projectName------');
                                          print(businessPartner.text);
                                          startVal=0;
                                          displayList=[];
                                          fetchByCustomerName(businessPartner.text,"projectName");
                                        }
                                      },
                                      style: const TextStyle(fontSize: 14),
                                      keyboardType: TextInputType.text,
                                      decoration: searchCityNameDecoration(hintText: 'Project Name'),
                                    ),),
                                    const SizedBox(width: 10,),
                                    //Second.
                                    SizedBox(width: 190,height: 30, child: TextFormField(
                                      controller:creationDateController,
                                      onChanged: (value){
                                        if(value.isEmpty || value==""){
                                          startVal=0;
                                          displayList=[];
                                          filteredList = responseData;
                                          ifEmpty();
                                        }
                                        else if(businessPartner.text.isNotEmpty || customerNameController.text.isNotEmpty){
                                          businessPartner.clear();
                                          customerNameController.clear();
                                        }
                                        else{
                                          startVal=0;
                                          displayList=[];
                                          fetchByCustomerName(creationDateController.text,"customerName");
                                        }
                                      },
                                      style: const TextStyle(fontSize: 14),
                                      keyboardType: TextInputType.text,
                                      decoration: searchCreationDate(hintText: 'Customer Name'),
                                    ),),
                                    const SizedBox(width: 10,),
                                    //Third.
                                    SizedBox(
                                      width: 150,height: 30,
                                      child: Focus(
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
                                            hintText: status,
                                            error: _invalidStatusType,
                                            isFocused: _isTypeFocused,
                                          ),
                                          hintText: status,
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
                                              status = value;
                                              awardStatusController.text=value;
                                              _invalidStatusType = false;
                                            });
                                          },
                                          onCanceled: () {},
                                          child: Container(),
                                        );
                                      },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    //Four.
                                    SizedBox(
                                      width: 150,height: 30,
                                      child: Focus(
                                        onFocusChange: (value) {
                                          setState(() {
                                            financialBoolFocus = value;
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
                                                    _invalidFinancialYear = true;
                                                  });
                                                  return null;
                                                }
                                                return null;
                                              },textController: financialController,
                                              decoration: customPopupDecoration(
                                                hintText: financialYear,
                                                error: _invalidFinancialYear,
                                                isFocused: financialBoolFocus,
                                              ),
                                              hintText: financialYear,
                                              childWidth: constraints.maxWidth,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: _invalidFinancialYear ? Colors.redAccent : mTextFieldBorder,
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                              ),
                                              offset: const Offset(1, 40),
                                              tooltip: '',
                                              itemBuilder: (BuildContext context) {
                                                return financialDropdown.map((value) {
                                                  return CustomPopupMenuItem(
                                                    value: value,
                                                    text: value,
                                                    child: Container(),
                                                  );
                                                }).toList();
                                              },
                                              onSelected: (String value) {
                                                setState(() {
                                                  financialYear = value;
                                                  financialController.text=value;
                                                  _invalidFinancialYear = false;
                                                });
                                              },
                                              onCanceled: () {},
                                              child: Container(),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    //Five.
                                    SizedBox(
                                      width: 150,height: 30,
                                      child: Focus(
                                        onFocusChange: (value) {
                                          setState(() {
                                            financialBoolFocus1 = value;
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
                                                    _invalidFinancialYear1 = true;
                                                  });
                                                  return null;
                                                }
                                                return null;
                                              },textController: financialController1,
                                              decoration: customPopupDecoration(
                                                hintText: financialYear1,
                                                error: _invalidFinancialYear1,
                                                isFocused: financialBoolFocus1,
                                              ),
                                              hintText: financialYear1,
                                              childWidth: constraints.maxWidth,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: _invalidFinancialYear1 ? Colors.redAccent : mTextFieldBorder,
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                              ),
                                              offset: const Offset(1, 40),
                                              tooltip: '',
                                              itemBuilder: (BuildContext context) {
                                                return financialDropdown1.map((value) {
                                                  return CustomPopupMenuItem(
                                                    value: value,
                                                    text: value,
                                                    child: Container(),
                                                  );
                                                }).toList();
                                              },
                                              onSelected: (String value) {
                                                setState(() {
                                                  financialYear1 = value;
                                                  financialController1.text=value;
                                                  _invalidFinancialYear1 = false;
                                                });
                                              },
                                              onCanceled: () {},
                                              child: Container(),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],),
                                  MaterialButton(
                                      color: Colors.blue,
                                      child: const Text("Generate Report",style: TextStyle(color: Colors.white),),
                                      onPressed: (){

                                  })
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      Divider(height: 0.5,color: Colors.grey[500],thickness: 0.5,),
                      Container(color: Colors.grey[100],height: 32,
                        child:  IgnorePointer(
                          ignoring: true,
                          child: MaterialButton(
                            onPressed: (){},
                            hoverColor: Colors.transparent,
                            hoverElevation: 0,
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  /// aws headers fields.
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child:
                                            //Text("Customer Name")
                                            Text('Customer Name',style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(
                                            height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child:
                                            //Text('Email')
                                            Text("Project Name",style: textFieldStyle,)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Location",style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Zero Cost",style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Margin %",style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Revision 0",style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Margin",style: textFieldStyle,)
                                        ),
                                      )),
                                   Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Award",style: textFieldStyle,)
                                        ),
                                      )),
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: SizedBox(height: 25,
                                            //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                            child: Text("Percentage",style: textFieldStyle,)
                                        ),
                                      )),
                                  const Center(child: Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(size: 18,
                                      Icons.more_vert,
                                      color: Colors.transparent,
                                    ),
                                  ),)

                                  ///BTP header fields.
                                  // Expanded(
                                  //     child: Padding(
                                  //       padding: EdgeInsets.only(top: 4.0),
                                  //       child: SizedBox(height: 25,
                                  //           //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                  //           child:
                                  //           //Text("Customer Name")
                                  //         Text('Business Partner Full Name')
                                  //       ),
                                  //     )),
                                  // Expanded(
                                  //     child: Padding(
                                  //       padding: EdgeInsets.only(top: 4),
                                  //       child: SizedBox(
                                  //           height: 25,
                                  //           //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                  //           child:
                                  //           //Text('Email')
                                  //         Text("BusinessPartner")
                                  //       ),
                                  //     )
                                  // ),
                                  // Expanded(
                                  //     child: Padding(
                                  //       padding: EdgeInsets.only(top: 4),
                                  //       child: SizedBox(height: 25,
                                  //           //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                  //           child: Text("Supplier")
                                  //       ),
                                  //     )),
                                  // Expanded(
                                  //     child: Padding(
                                  //       padding: EdgeInsets.only(top: 4),
                                  //       child: SizedBox(height: 25,
                                  //           //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                  //           child: Text("CreationDate")
                                  //       ),
                                  //     )),
                                  // Expanded(
                                  //     child: Padding(
                                  //       padding: EdgeInsets.only(top: 4),
                                  //       child: SizedBox(height: 25,
                                  //           //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                  //           child: Text("Status")
                                  //       ),
                                  //     )),
                                  // Center(child: Padding(
                                  //   padding: EdgeInsets.only(right: 8),
                                  //   child: Icon(size: 18,
                                  //     Icons.more_vert,
                                  //     color: Colors.transparent,
                                  //   ),
                                  // ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 0.5,color: Colors.grey[500],thickness: 0.5,),
                    ],
                  )
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount:displayList.length + 1,
                itemBuilder: (context, i) {
                  int endVal = startVal + 14 > filteredList.length ? filteredList.length : startVal + 14;
                  if(i<displayList.length){
                    return Column(children: [
                      MaterialButton(
                        hoverColor: Colors.blue[50],
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 4,bottom: 3),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: SizedBox(height: 25,
                                        //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                        child: SelectableText(displayList[i]['customerName']??"")
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(
                                      height: 25,
                                      //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                      child:
                                      Tooltip(message:displayList[i]['projectName']?? '',waitDuration:const Duration(seconds: 1),
                                          child: Text(displayList[i]['projectName']?? '',softWrap: true,)),
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                        //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                        child: Text(displayList[i]['location']??"")
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                        //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                        child: Text(displayList[i]['zeroCost']??"")
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                      //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                      child: Text(displayList[i]['margin1']??"",
                                        style: const TextStyle(color: Color(0XFFEFBF65)),),
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                      //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                      child: Text(displayList[i]['revision']??""),
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                        //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                        child: Text(displayList[i]['margin2']??"",style: const TextStyle(color: Colors.green),)
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                        //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                        child: Text(displayList[i]['award']??"")
                                    ),
                                  )),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: SizedBox(height: 25,
                                      //   decoration: state.text.isNotEmpty ?BoxDecoration():BoxDecoration(boxShadow: [BoxShadow(color:Color(0xFFEEEEEE),blurRadius: 2)]),
                                      child: Text(displayList[i]['percentage']??"",
                                      style: TextStyle(color: double.parse(displayList[i]['percentage'])< 0 ? Colors.red:Colors.green),
                                      ),
                                    ),
                                  )),
                              const Center(child: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(size: 18,
                                  Icons.arrow_circle_right,
                                  color: Colors.blue,
                                ),
                              ),)
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 0.5,color: Colors.grey,thickness: 0.5,),
                    ],

                    );
                  }
                  else{
                    return Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${startVal + 1}-$endVal of ${filteredList.length}",
                            style: const TextStyle(color: Colors.grey),
                          ),

                          //Text("${startVal+15>filteredList.length?filteredList.length:startVal+1}-${startVal+15>filteredList.length?filteredList.length:startVal+15} of ${filteredList.length}",style: const TextStyle(color: Colors.grey)),
                          const SizedBox(width: 10,),
                          Material(color: Colors.transparent,
                            child: InkWell(
                              hoverColor: mHoverColor,
                              child: const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Icon(Icons.arrow_back_ios_sharp,size: 12),
                              ),
                              onTap: (){
                                if(startVal>14){
                                  displayList=[];
                                  startVal = startVal-15;
                                  for(int i=startVal;i<startVal+15;i++){
                                    try{
                                      setState(() {
                                        displayList.add(filteredList[i]);
                                      });
                                    }
                                    catch(e){
                                      log(e.toString());
                                    }
                                  }
                                }
                                else{
                                  log('else');
                                }

                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Material(color: Colors.transparent,
                            child: InkWell(
                              hoverColor: mHoverColor,
                              child: const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Icon(Icons.arrow_forward_ios,size: 12),
                              ),
                              onTap: (){
                                if(filteredList.length>startVal+15){
                                  displayList=[];
                                  startVal=startVal+15;
                                  for(int i=startVal;i<startVal+15;i++){
                                    try{
                                      setState(() {
                                        displayList.add(filteredList[i]);
                                      });
                                    }
                                    catch(e){
                                      log(e.toString());
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 20,),
                        ],
                      ),
                      const Divider(height: 0.5,color: Colors.grey,thickness: 0.5,),
                    ],);
                  }
                },)

            ]),
          ),
        ),
      ),
    );
  }

  // Search textField Decoration.
  searchCustomerNameDecoration ({required String hintText, bool? error}){
    return InputDecoration(hoverColor: mHoverColor,
      suffixIcon: customerNameController.text.isEmpty?const Icon(Icons.search,size: 18):InkWell(
          onTap: (){
            setState(() {
              startVal=0;
              displayList=[];
              customerNameController.clear();
              filteredList = responseData;
              ifEmpty();
            });
          },
          child: const Icon(Icons.close,size: 14,)),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.blue)),
      constraints:  const BoxConstraints(maxHeight:35),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      counterText: '',
      contentPadding: const EdgeInsets.fromLTRB(12, 00, 0, 0),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :mTextFieldBorder)),
      focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :Colors.blue)),
    );
  }

  searchCityNameDecoration ({required String hintText, bool? error}){
    return InputDecoration(hoverColor: mHoverColor,
      suffixIcon: businessPartner.text.isEmpty?const Icon(Icons.search,size: 18):InkWell(
          onTap: (){
            setState(() {
              startVal=0;
              displayList=[];
              businessPartner.clear();
              filteredList = responseData;
              ifEmpty();
            });
          },
          child: const Icon(Icons.close,size: 14,)),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.blue)),
      constraints:  const BoxConstraints(maxHeight:35),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      counterText: '',
      contentPadding: const EdgeInsets.fromLTRB(12, 00, 0, 0),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :mTextFieldBorder)),
      focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :Colors.blue)),
    );
  }

  searchCreationDate ({required String hintText, bool? error}){
    return InputDecoration(hoverColor: mHoverColor,
      suffixIcon: creationDateController.text.isEmpty? const Icon(Icons.search,size: 18,):InkWell(
          onTap: (){
            setState(() {
              startVal=0;
              displayList=[];
              creationDateController.clear();
              filteredList = responseData;
              ifEmpty();
            });
          },
          child: const Icon(Icons.close,size: 14,)),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.blue)),
      constraints:  const BoxConstraints(maxHeight:35),
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14),
      counterText: '',
      contentPadding: const EdgeInsets.fromLTRB(12, 00, 0, 0),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :mTextFieldBorder)),
      focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color:error==true? mErrorColor :Colors.blue)),
    );
  }

  // Date Conversion.
  String convertDate(String dateString) {
    // Extract the timestamp from the string
    String timestampString = dateString.substring(6, dateString.length - 2);

    // Convert the timestamp string to an integer
    int timestamp = int.parse(timestampString);

    // Create a DateTime object from the timestamp
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Format the date as desired.
    String formattedDate = "${_twoDigits(date.day)}-${_twoDigits(date.month)}-${date.year}";

    return formattedDate;
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

}

