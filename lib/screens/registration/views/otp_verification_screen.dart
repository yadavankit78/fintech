import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neu_byte_digital/components/buttons/rectangular_btn.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/constant/field_constants.dart';
import 'package:neu_byte_digital/screens/registration/views/adhaarScreen/verify_adhaar_screen.dart';
import 'package:neu_byte_digital/screens/registration/views/personal_detail_screen.dart';
import 'package:neu_byte_digital/screens/registration/views/signup_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String emailNumber;
  const OtpVerificationScreen(
      {super.key, this.phoneNumber = '', this.emailNumber = ''});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> _formKey;
  int secondRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (secondRemaining != 0) {
          setState(() {
            secondRemaining--;
          });
        } else {
          setState(() {
            enableResend = true;
          });
        }
      },
    );
  }

  void resendCode() {
    setState(() {
      secondRemaining = 60;
      enableResend = false;
    });
    startTimer();
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(
      SmartAuth(),
    );
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColor.primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = AppColor.greyColor;

    final defaultPinTheme = PinTheme(
      width: 30,
      height: 40,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppColor.defaultPadding,
              right: AppColor.defaultPadding,
              top: 8,
              bottom: AppColor.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.phoneNumber.isNotEmpty
                        ? Text(
                            FieldConstants.verifyMobileCode,
                            style: Theme.of(context).textTheme.headlineLarge,
                          )
                        : Text(
                            FieldConstants.verifyEmailCode,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.phoneNumber.isNotEmpty
                        ? Text(
                            FieldConstants.otpHelperText,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : Text(
                            FieldConstants.otpEmailHelperText,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'OTP sent to mobile ${widget.phoneNumber}, vaild for 10\nminutes',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColor.errorColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // pin field
                    Center(
                      child: Pinput(
                        errorTextStyle:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColor.errorColor,
                                ),
                        length: 6,
                        smsRetriever: smsRetriever,
                        controller: pinController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter OTP';
                          }
                          return value == '222222' ? null : 'Pin is incorrect';
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: AppColor.errorColor),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: AppColor.defaultPadding,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: FieldConstants.notReceiveCode,
                          style: Theme.of(context).textTheme.bodySmall,
                          children: <TextSpan>[
                            enableResend
                                ? TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        resendCode();
                                        print('print');
                                      },
                                    text: 'Resend Code',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold))
                                : TextSpan(
                                    text: "00:${secondRemaining.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
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
            if (_formKey.currentState!.validate()) {
              if (widget.phoneNumber.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
              }
              if (widget.emailNumber.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalDetailScreen(),
                    ));
              }
            }
          },
          textTitle: "Verify",
        ),
      ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
