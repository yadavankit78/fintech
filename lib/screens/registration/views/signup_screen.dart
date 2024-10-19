import 'package:flutter/material.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/constant/form_validators.dart';
import 'package:neu_byte_digital/screens/registration/views/otp_verification_screen.dart';
import 'package:neu_byte_digital/screens/registration/widgets/custom_textFormField.dart';
import 'package:neu_byte_digital/utils/apputils.dart';

class SignupScreen extends StatefulWidget {
  final String phoneNumber;
  const SignupScreen({super.key, this.phoneNumber = ''});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    numberController.text = widget.phoneNumber;
    super.setState(fn);
  }

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
                  FieldConstants.signUpOnNeoByt,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  FieldConstants.signupHelperText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: AppColor.defaultPadding,
                ),
                Text(
                  FieldConstants.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.greyColorText),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: emailController,
                  validator: (p0) => FormValidators.validateEmail(context, p0!) ,
                  hintText: "Email",
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
            if (form!.validate()) {
              form.save();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpVerificationScreen(
                      emailNumber: emailController.text,
                    ),
                  ));
            }
          },
          textTitle: FieldConstants.signUpBtnText,
        ),
      ),
    );
  }
}
