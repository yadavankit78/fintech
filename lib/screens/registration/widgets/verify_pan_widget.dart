import 'package:flutter/material.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/form_validators.dart';
import 'package:neu_byte_digital/screens/registration/widgets/custom_textFormField.dart';

class VerifyPanWidget extends StatefulWidget {
  const VerifyPanWidget({super.key});

  @override
  State<VerifyPanWidget> createState() => _VerifyPanWidgetState();
}

class _VerifyPanWidgetState extends State<VerifyPanWidget> {
  final panController = TextEditingController();
  bool isPanValid = false ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        suffix: isPanValid
            ? const Icon(Icons.check, color: Colors.green)
            : null,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isPanValid ? Colors.green : AppColor.primaryColor,
            ),),
        textInputType: TextInputType.text,
        controller: panController,
        hintText: 'Pan Number',
        onChanged: (value) {
          setState(() {
           isPanValid = value!.isNotEmpty && value.contains('ADDPZ4122E');
           print(isPanValid);
          });
        },
        validator: (value) => FormValidators.validatePan(value!),
      ),
    );
  }


}
