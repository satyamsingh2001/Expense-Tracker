import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../colors/colors_const.dart';

import '../../styles/text_style_const.dart';

class ConstTextField extends StatelessWidget {
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? enableBorderColor;
  final TextEditingController? controller;
  final Widget? suffix;
  final TextInputType? inputType;
  final int? maxLength;
  final int? maxLine;
  final String? hintText;
  final String? labelText;
  final bool? obscure;
  final bool? readyOnly;
  final TextCapitalization? textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final bool? filled;
  final Color? fillColor;
  final bool? borderNone;
  final bool? autoFocus;
  final double? cursorHeight;
  final double? cursorWidth;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final String? initialValue;

  const ConstTextField({
    super.key,
    this.controller,
    this.inputType,
    this.maxLength,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.obscure,
    this.contentPadding,
    this.maxLine,
    this.readyOnly,
    this.suffix,
    this.onTap,
    this.style,
    this.enableBorderColor,
    this.hintStyle,
    this.onChanged,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.labelText,
    this.textCapitalization,
    this.borderNone = true,
    this.cursorHeight,
    this.onEditingComplete,
    this.focusNode,
    this.cursorWidth,
    this.inputFormatters,
    this.autoFocus,
    this.textAlign,
    this.initialValue,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: textAlign ?? TextAlign.start,
      autofocus: autoFocus ?? false,
      inputFormatters: inputFormatters,
      cursorWidth: cursorWidth ?? 2.w,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: readyOnly ?? false,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: inputType,
      obscureText: obscure ?? false,
      cursorColor: AppColors.primary,
      maxLength: maxLength,
      maxLines: maxLine ?? 1,
      // cursorHeight: cursorHeight??3.5.w,
      style: style ??
          AppTextStyles.kBody15RegularTextStyle
              .copyWith(color: AppColors.white100),
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        // hoverColor: AppColors.success100,
        suffix: suffix,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ??
            AppTextStyles.kBody15RegularTextStyle
                .copyWith(color: AppColors.white50),
        counter: const Offstage(),
        enabledBorder: borderNone == true
            ? UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          borderSide: BorderSide(
              color: enableBorderColor ?? AppColors.white80,
              width: 1),
        )
            : InputBorder.none,
        focusedBorder: borderNone == true
            ? UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          borderSide:
          const BorderSide(color: AppColors.primary, width: 1),
        )
            : InputBorder.none,
        border: borderNone == true
            ? const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white80),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        )
            : InputBorder.none,
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          borderSide: const BorderSide(color: Color(0xFFF65054), width: 1),
        ),
        errorBorder: borderNone == true
            ? UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          borderSide:
          const BorderSide(color: Color(0xFFF65054), width: 1),
        )
            : InputBorder.none,
        contentPadding:
        contentPadding ?? EdgeInsets.fromLTRB(8.w, 6.w, 8.w, 6.w),
      ),
    );
  }
}
