
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {

  final dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
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
                  1700),
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
    );
  }
}
