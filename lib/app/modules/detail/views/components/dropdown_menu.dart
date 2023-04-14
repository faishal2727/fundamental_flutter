import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/theme/color.dart';

class DropdownMenuz extends StatelessWidget {
  List<String> listData;
  String hint;

  DropdownMenuz({Key? key, required this.listData, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(hint,textAlign: TextAlign.start)),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(bottom: defaultPadding,left: defaultPadding / 2),
            constraints: const BoxConstraints(
              maxWidth: 150
            ),
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              isExpanded: true,
              hint: Text(
                "Select $hint",
                style: TextStyle(fontSize: 10),
              ),
              items: listData
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select $hint';
                }
                return null;
              },
              onChanged: (value) {
                hint = value.toString();
              },
              onSaved: (value) {
                hint = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 5),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
