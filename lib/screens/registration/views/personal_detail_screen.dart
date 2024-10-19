import 'package:flutter/material.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/screens/registration/views/upload_pan_screen.dart';
import 'package:neu_byte_digital/screens/registration/widgets/custom_textFormField.dart';
import 'package:neu_byte_digital/screens/registration/widgets/date_picker_widget.dart';
import 'package:neu_byte_digital/screens/registration/widgets/select_gender_widget.dart';
import 'package:neu_byte_digital/screens/registration/widgets/verify_pan_widget.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({super.key});

  @override
  State<PersonalDetailScreen> createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  bool ischecked = false ;

  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppColor.defaultPadding,
              right: AppColor.defaultPadding,
              top: 8,
              bottom: AppColor.defaultPadding),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FieldConstants.personalDetails,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: AppColor.defaultPadding,
                  ),
                  Text(
                    FieldConstants.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.greyColorText),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    controller: fullNameController,
                    hintText: "Full Name",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    FieldConstants.gender,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.greyColorText),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // select gender widget
                  const SelectGenderWidget(),

                  const SizedBox(
                    height: 8,
                  ),

                  // dob
                  Text(
                    FieldConstants.dob,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.greyColorText),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  const DatePickerWidget(),

                  const SizedBox(
                    height: 8,
                  ),

                  // verify pan of user

                  Text(
                    FieldConstants.panNumber,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.greyColorText),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const VerifyPanWidget(),
                  const SizedBox(
                    height: 8,
                  ),

                  CheckboxListTile(
                     isError: ischecked == false,
                     contentPadding: EdgeInsets.all(0),
                      activeColor: AppColor.primaryColor,
                      value:ischecked ,
                      onChanged: (value) {
                          setState(() {
                            ischecked = !ischecked ;
                            print(ischecked);
                          });
                          
                      },

                    title:  Text("Agree to terms & conditions" ,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:ischecked ? null : AppColor.errorColor ,
                      )),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),




                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppColor.defaultPadding,
              vertical: AppColor.defaultPadding1),
          child: RectangularBtn(
            onPressed: () {
              final form = _formKey.currentState;
              if (form!.validate() && ischecked) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadPanScreen(),
                    ));
              }
            },
            textTitle: FieldConstants.personalDetailsBtnText,
          ),
        ));
  }
}
