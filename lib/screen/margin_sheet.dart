import 'package:flutter/material.dart';

import '../static_files/static_colors.dart';

class ProjectMarginSheet extends StatefulWidget {
  final String title;
  const ProjectMarginSheet({super.key, required this.title});

  @override
  State<ProjectMarginSheet> createState() => _ProjectMarginSheetState();
}


class _ProjectMarginSheetState extends State<ProjectMarginSheet> {
  final nameController=TextEditingController();


  ///Old declarations.
  // bool _isTypeFocused =false;
  // bool _invalidStatusType =false;
  // String selectedStatusType="Select Contact Type";
  // String scopeOfWork="Scope Of Work";
  // String ca="Scope Of Work";
  // List<String> selectStatusType=[
  //   "contact1",
  //   "contact2",
  //   "contact3"
  // ];
  // List<String> scopeType=[
  //   "scope1",
  //   "scope2",
  //   "scope3",
  // ];
  //
  // Color borderColor= Colors.grey;
  // Color textColor = const Color(0XFF707070);

  final _formKey = GlobalKey<FormState>();
  final controllers = List<TextEditingController>.generate(48, (index) => TextEditingController(),);

  void printValuesAndPost() {
    final values = {
      'SN': List.generate(16, (index) => index + 1),
      'NeedsToBeChecked': List.generate(16, (index) => controllers[index * 3].text),
      'Approvals': List.generate(16, (index) => controllers[index * 3 + 1].text),
      'ResponsibilityInputs': List.generate(16, (index) => controllers[index * 3 + 2].text),
    };

    print(values);

    //postValues(values);
  }

  ///Post Api Function for fields.
  // Future<void> postValues(Map<String, dynamic> values) async {
  //   final url = 'https://your-api-endpoint.com/post';
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(values),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('Post successful');
  //   } else {
  //     print('Post failed with status: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0XFFEFF3F7),
      appBar: AppBar(title: const Text("Project Margin Sheet"),
        shadowColor: Colors.grey
    ),
      body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(30),
        child: Form(key: _formKey,
          child: Column(
            children: [
              //First Card.
              Card(
                surfaceTintColor:const Color(0XFFFDFAFD),
                child:Column(children: [
                Container(height: 35,
                color: Colors.blue,
                  child: const Center(child: Text('Base Build Project Margin Sheet Checklist',style: TextStyle(color: Colors.white),)),

                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //First.
                           Text("Project",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Project Name',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          //Third.
                          Text("Location",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Location',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          //Five.
                          Text("Ocean Base Value",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          //Seven.
                          Text("Difference Value(Ocean-Contract)",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Region',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),
                          //Nine.
                          Text("Margin (Difference/Ocean Basic Value)",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          Text("Overhead Cost (Salary + Other Cost - From ANNEXURE Sheet)",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          Text("Ocean Total Value",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
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
                          Text("Region",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Region',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          //Four.
                          Text("Region",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Region',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          //Six.
                          Text("Contractor Basic Value",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),
                          //Eight.
                          Text("Mark up (Difference / Contract Value)",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          Text("Period Months",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          Text("Any Agency cost / Referral Fee', 'NIL')",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),

                          Text("Margin (Difference/Ocean Basic Value )",style: textFieldStyle,),
                          const SizedBox(height: 6,),
                          TextFormField(
                            autofocus: true,
                            //controller: nameController,
                            //validator:checkNameError,
                            decoration: textFieldDecoration(hintText: 'Enter Value',),
                            onChanged: (value){

                            },
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ],),
                )

              ]) ,),
             const SizedBox(height: 30,),
              //Second.
              Card(
                surfaceTintColor:const Color(0XFFFDFAFD),
                child:Column(
                  children: [
                    Container(height: 35,
                      color: Colors.blue,
                      child: const Center(child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0,top: 8),
                            child: Text('Approvals',style: TextStyle(color: Colors.white),),
                          ))),

                    ),
                    const SizedBox(height: 30,),

                    buildApprovalsTable(),
                  ],
                ),
              ),

              const SizedBox(height: 25,),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    printValuesAndPost();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),)),
    );
  }

  Widget buildApprovalsTable() {
    return Container(
      padding: const EdgeInsets.all(16),
     // color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [
              const SizedBox(width: 50,),
              Text('SN', style:textFieldStyle),
              const SizedBox(width: 100,),

              Expanded(flex: 2,child: Text('Needs to be checked', style: textFieldStyle)),
              const SizedBox(width: 100,),

              Expanded(flex: 1,child: Text('Approvals', style: textFieldStyle)),
              const SizedBox(width: 100,),

              Expanded(flex: 2,child: Text('Responsibility / Inputs', style: textFieldStyle)),
              const SizedBox(width: 50,),

              const Text("")
            ],
          ),

          //Divider(),
          buildRow(1, 'Ocean Taxes (GST)', 'Accounts Department', 0),
          buildRow(2, 'Contractor Taxes (GST)', 'Accounts Department', 3),
          buildRow(3, 'Aggrement (Consolidated / Individual)', 'Compliance', 6),
          buildRow(4, 'TPL - Insurance (30% Of Contract Value)', 'Admin (Car Policy Client Scope)', 9),
          buildRow(5, 'Detailed BOQ', 'Associate Director / Tendering Dept', 12),
          buildRow(6, 'DLP Period (Months)', 'Tendering', 15),
          buildRow(7, 'Penalty', 'Project Lead - Approvals from MD/DIRECTOR', 18),
          buildRow(8, 'Retention in %AGE', 'Project Lead', 21),
          buildRow(9, 'Below Margin (PROFIT) On Project Work', 'Project Lead', 24),
          buildRow(10, 'Statutory Insurance Policies', 'Management Head - (M) / Director', 27),
          buildRow(11, 'SEZ/STPI Benefits (Exemption Certificate)', 'Management Head/HR', 30),
          buildRow(12, 'Indemnity (Open Liability)', 'Project Lead', 33),
          buildRow(13, 'Foreign Laws (FCRA)', 'Project Lead - Approvals from MD/DIRECTOR', 36),
          buildRow(14, 'Confidentiality', 'Project Lead - Approvals from MD/DIRECTOR', 39),
          buildRow(15, 'Liquidated Damages', 'Project Lead - Approvals from MD/DIRECTOR', 42),
          buildRow(16, 'Ocean Margin Below 8%', 'Project Lead - Approvals from MD/DIRECTOR', 45),
        ],
      ),
    );
  }

  ///without validation.
  Widget buildRow(int sn, String needsToBeChecked, String responsibility, int controllerIndex) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 50,),
            Container(
                width: 30,
                height: 30,
                decoration:BoxDecoration(border: Border.all(color: Colors.grey,),
                    borderRadius: BorderRadius.circular(5)) ,
                child: Center(child: Text(sn.toString()))),
            const SizedBox(width: 100,),
            Expanded(flex: 2,
              child: TextField(
                controller: controllers[controllerIndex],
                decoration: textFieldDecoration(hintText:needsToBeChecked ),
              ),
            ),
            const SizedBox(width: 100,),
            Expanded(flex: 1,
              child: TextField(
                controller: controllers[controllerIndex + 1],
                decoration: textFieldDecoration(hintText:'' ),
              ),
            ),
            const SizedBox(width: 100,),
            Expanded(flex: 2,
              child: TextField(
                controller: controllers[controllerIndex + 2],
                decoration: textFieldDecoration(hintText:responsibility),
              ),
            ),

             SizedBox(width: 50,child:(controllerIndex==6 || controllerIndex==45)?InkWell(
                 onTap: (){
                   if(controllerIndex ==6){

                   }
                   else if(controllerIndex==45){

                   }
                 },
                 child: controllerIndex==6? const Icon(Icons.file_upload_outlined,color: Colors.blue,)
                     :const Icon(Icons.file_upload_outlined,color: Colors.grey,)): const Text("") ,),

          ],
        ),
      );
  }

  ///Validation.
 //  Widget buildRow(int sn, String needsToBeChecked, String responsibility, int controllerIndex) {
 //    return Padding(
 //      padding: const EdgeInsets.symmetric(vertical: 8.0),
 //      child: Row(
 //        children: [
 //          const SizedBox(width: 50,),
 //          Container(
 //            width: 30,
 //            height: 30,
 //            decoration: BoxDecoration(
 //              border: Border.all(color: Colors.grey),
 //              borderRadius: BorderRadius.circular(5),
 //            ),
 //            child: Center(child: Text(sn.toString())),
 //          ),
 //          const SizedBox(width: 100,),
 //          SizedBox(
 //            width: 400,
 //            height: 30,
 //            child: TextFormField(
 //              controller: controllers[controllerIndex],
 //              decoration: textFieldDecoration(hintText:needsToBeChecked ),
 //              // decoration: InputDecoration(
 //              //   hintText: needsToBeChecked,
 //              //   border: OutlineInputBorder(),
 //              // ),
 //              validator: (value) {
 //                if (value == null || value.isEmpty) {
 //                  return 'Please enter a value';
 //                }
 //                return null;
 //              },
 //            ),
 //          ),
 //          const SizedBox(width: 100,),
 //          SizedBox(
 //            width: 150,
 //            height: 35,
 //            child: TextFormField(
 //              controller: controllers[controllerIndex + 1],
 //              decoration:textFieldDecoration(hintText: '') ,
 //
 //              // decoration: InputDecoration(
 //              //   hintText: '',
 //              //   border: OutlineInputBorder(),
 //              // ),
 //              validator: (value) {
 //                if (value == null || value.isEmpty) {
 //                  return 'Please enter a value';
 //                }
 //                return null;
 //              },
 //            ),
 //          ),
 //          const SizedBox(width: 100,),
 //          SizedBox(
 //            width: 350,
 //            child: TextFormField(
 //              controller: controllers[controllerIndex + 2],
 //              decoration: textFieldDecoration(hintText: responsibility),
 //
 //              // decoration: InputDecoration(
 //              //   hintText: responsibility,
 //              //   border: OutlineInputBorder(),
 //              // ),
 //              validator: (value) {
 //                if (value == null || value.isEmpty) {
 //                  return 'Please enter a value';
 //                }
 //                return null;
 //              },
 //            ),
 //          ),
 //          const SizedBox(width: 50,),
 //          if (controllerIndex == 6 || controllerIndex == 45) ...[
 //            InkWell(
 //              onTap: () {
 //                // handle file upload
 //              },
 //              child: Icon(
 //                Icons.file_upload_outlined,
 //                color: controllerIndex == 6 ? Colors.blue : Colors.black,
 //              ),
 //            ),
 //          ],
 //        ],
 //      ),
 //    );
 //  }

  //Decoration.

  searchCustomerNameDecoration ({required String hintText, bool? error}){
    return InputDecoration(hoverColor: mHoverColor,
      suffixIcon: nameController.text.isEmpty?const Icon(Icons.search,size: 18,color: Colors.blue,):InkWell(
          onTap: (){

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
}





