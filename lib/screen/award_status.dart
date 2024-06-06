import 'package:flutter/material.dart';
import '../static_files/custom_popup_dropdown.dart';
import '../static_files/static_colors.dart';

class AwardStatus extends StatefulWidget {
  final String title;
  const AwardStatus({super.key, required this.title});

  @override
  _AwardStatusState createState() => _AwardStatusState();
}

class _AwardStatusState extends State<AwardStatus> {
  var awardStatus=TextEditingController();
  String scopeOfWork = "Awarded";
  bool _isTypeFocused = false;
  bool _invalidStatusType = false;
  List<String> scopeType = ["Awarded1", "Awarded2"];
  TextEditingController comments = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(children: [
          MaterialButton(
              color: Colors.blue,
              child: const Text("Award Status"),
              onPressed: (){
                showMessageDialog();
          })
        ]),
      ),
    );
  }

  ///Show Dialog Box.
  showMessageDialog() {
    showDialog(
      context: context,
      builder: (context) {


        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Award Status *", style: TextStyle(color: Colors.white)),
                        MaterialButton(
                          height: 25,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25,top: 20,bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Award Status", style: textFieldStyle),
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
                        child: SizedBox(
                          width: 300,
                          height: 35,
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
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: TextFormField(
                          controller: comments,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            constraints: BoxConstraints(maxHeight: 100),
                            hintText: "Comments",
                            hintStyle: TextStyle(fontSize: 14),
                            counterText: '',
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mTextFieldBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: (){
                          Map awardStatus = {
                            "awardStatus":scopeOfWork,
                            "comments":comments.text
                          };
                          print('------awardStatus-----');
                          print(awardStatus);
                        },
                        child: const Text("Save",style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },);
  }
}
