import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/screens/registration/widgets/custom_textFormField.dart';
import 'package:neu_byte_digital/utils/apputils.dart';

class VerifyAadhaarScreen extends StatefulWidget {
  const VerifyAadhaarScreen({super.key});

  @override
  State<VerifyAadhaarScreen> createState() => _VerifyAadhaarScreenState();
}

enum Gender { Male, Female }

class _VerifyAadhaarScreenState extends State<VerifyAadhaarScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController aadhaarController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  Gender? _character = Gender.Male;
  bool isCheckCondition = false;
  bool autoValidate = false ;
  int radioValue = -1 ;

  @override
  void initState() {
    dateinput.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppColor.defaultPadding),
          child: Form(
            key: _formKey,
             autovalidateMode: AutovalidateMode.disabled ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verify Your Aadhaar",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Enter your Aadhaar Number to get an OTP on\nyour registered mobile number',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppColor.defaultPadding2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aadhaar Number',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.greyColorText),
                    ),
                    const SizedBox(height: AppColor.defaultPadding1,),
                    CustomTextFormField(
                        validator: (value) => _validateAadhaar(value!),
                        textInputType: TextInputType.number,
                        controller: aadhaarController,
                        hintText: 'Aadhaar Number'),
                    const SizedBox(height: AppColor.defaultPadding1,),
                    Text(
                      'Gender',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.greyColorText),
                    ),
                    const SizedBox(height: AppColor.defaultPadding1,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Radio<Gender>(
                                activeColor: AppColor.primaryColor,
                                value: Gender.Male,
                                groupValue: _character,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                             const Text('Male'),
                            ],
                          )
                          ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Radio<Gender>(
                                activeColor: AppColor.primaryColor,
                                value: Gender.Female,
                                groupValue: _character,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              const Text("Female")
                            ],
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: AppColor.defaultPadding1,),
                    Text(
                      'DOB',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColor.greyColorText),
                    ),
                    const SizedBox(height: AppColor.defaultPadding1,),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Selected DOB';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                          prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: AppColor.primaryColor,
                      )),
                      controller: dateinput,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement
                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    const SizedBox(height: AppColor.defaultPadding2),
                    Row(
                      children: [
                        FormField<bool>(
                          builder: (field) => Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: isCheckCondition,
                            onChanged: (value) {
                              setState(() {
                                isCheckCondition = !isCheckCondition;
                                field.didChange(value);
                              });
                            },
                          ),
                        ),
                        Expanded(
                            child: Text(
                                "I hereby give my consent to provide UID/VID to continue with OTP based Aadhaar authentication for my KYC registration." ,
                             style: Theme.of(context).textTheme.bodySmall,
                            ),
                            ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    RectangularBtn(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            if(_character.toString().isEmpty){
                              AppUtils().showSnackBar(context, 'Please select your gender');
                            }
                            if(!isCheckCondition){
                              AppUtils().showSnackBar(context, "Please accept our terms & conditions");
                            }
                        }
                      },
                      textTitle: "Proceed to Verify",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  String? _validateAadhaar(String value) {
    if(value.isEmpty){
      return 'Enter Aadhaar Number';
    }
    if(value.length != 12){
      return 'Invalid Aadhaar Number';
    }
    return null;
  }

}
