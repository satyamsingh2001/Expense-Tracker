import 'package:flutter/material.dart';

import '../../colors/colors_const.dart';
import '../../styles/text_style_const.dart';



class ConstantDropdown extends StatefulWidget {
  final List options;
  final ValueChanged onChanged;
  final Color iconColor;
  final Color dropdownColor;
  final Color textColor;
  final String hint;

  const ConstantDropdown({
    super.key,
    required this.options,
    required this.onChanged,
    required this.iconColor,
    required this.dropdownColor,
    required this.textColor,
    required this.hint,
  });

  @override
  State<ConstantDropdown> createState() => _ConstantDropdownState();
}

class _ConstantDropdownState extends State<ConstantDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height*0.043,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 3),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            hint: Text(widget.hint,
                style: AppTextStyles.kSmall10RegularTextStyle
                    .copyWith(color: AppColors.white50)),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: AppColors.white100, width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: AppColors.white100, width: 1),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.white100),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color(0xFFF65054)),
              ),
              errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Color(0xFFF65054)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select value';
              }
              return null;
            },
            dropdownColor: widget.dropdownColor,
            value: null,
            onChanged: widget.onChanged,
            // icon: const Icon(CupertinoIcons.chevron_down),
            // iconSize: 15,
            iconEnabledColor: widget.iconColor,
            items: widget.options.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: AppTextStyles.kSmall10RegularTextStyle
                      .copyWith(color: widget.textColor),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
