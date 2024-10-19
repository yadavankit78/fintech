
import 'package:flutter/material.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({super.key});

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  List<String> gender = ["male" , "female"];
  int _index = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: RadioListTile(
              selected: false,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.greyColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              activeColor: AppColor.whiteColor,
              title: Text(
                'Male',
                style: _index == 0
                    ? Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.whiteColor)
                    : Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.blackColor),
              ),
              value: 0,
              groupValue: _index,
              onChanged: (int? value) {
                setState(() {
                  _index = value!;
                  print(gender[_index]);
                });
              },
              tileColor: _index == 0
                  ? AppColor.primaryColor
                  : null,
            ),
          ),
          const SizedBox(
            width: AppColor.defaultPadding,
          ),
          Expanded(
            flex: 1,
            child: RadioListTile(
              selected: false,
              activeColor: AppColor.whiteColor,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColor.greyColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              title: Text(
                'Female',
                style: _index == 1
                    ? Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.whiteColor)
                    : Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.greyColorText),
              ),
              value: 1,
              groupValue: _index,
              onChanged: (int? value) {
                setState(() {
                  _index = value!;
                  print(gender[_index]);
                });
              },
              tileColor: _index == 1
                  ? AppColor.primaryColor
                  : null,
            ),
          ),
        ],
      )
    );
  }
}
