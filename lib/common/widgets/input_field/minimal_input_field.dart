import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';

class MinimalInputField extends StatefulWidget {
  const MinimalInputField(
      {Key? key,
      required this.hintText,
      this.onTap,
      this.readOnly = false,
      this.textInputType,
      this.focusNode,
      this.isPassword = false,
      this.textEditingController,
      this.autofocus,
      this.maxLines,
      this.minLines,
      this.onChanged,
      this.errorText,
      this.backgroundColor,
      this.validator,
      this.initialValue,
      this.hintFontSize = kDefaultFontSize - 4,
      this.showBorder = false,
      this.suffixIcon,
      this.height = 50,
      this.label,
      this.errorBorder})
      : super(key: key);
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool? autofocus;
  final int? maxLines;
  final String? initialValue;
  final bool isPassword;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? errorText;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final double? hintFontSize;
  final int? minLines;
  final bool showBorder;
  final bool? readOnly;
  final Widget? suffixIcon;
  final String? label;
  final double height;
  final InputBorder? errorBorder;

  @override
  // ignore: library_private_types_in_public_api
  _MinimalInputFieldState createState() => _MinimalInputFieldState();
}

class _MinimalInputFieldState extends State<MinimalInputField> {
  final TextEditingController mobileTextController = TextEditingController();
  FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding - 5),
      height: widget.showBorder ? widget.height : null,
      decoration: widget.showBorder
          ? BoxDecoration(
              border: Border.all(color: kScheduleBorder),
              borderRadius: BorderRadius.circular(8.0),
            )
          : null,
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly!,
        focusNode: focusNode,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.textEditingController,
        validator: widget.validator,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          labelText: widget.label,
          errorText: widget.errorText,
          errorMaxLines: 1,
          errorBorder: widget.errorBorder,
          // contentPadding: const EdgeInsets.all(16.0),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: ksearchText,
              fontWeight: FontWeight.normal,
              fontSize: widget.hintFontSize),
          labelStyle: const TextStyle(
              color: ksearchText, fontWeight: FontWeight.normal),
          enabled: true,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          fillColor: widget.backgroundColor ?? kWhiteColor,
          filled: true,
        ),
        onChanged: widget.onChanged,
        cursorColor: Colors.black,
        cursorHeight: 20.0,
        textInputAction: TextInputAction.next,
        keyboardType: widget.textInputType ?? TextInputType.emailAddress,
        onFieldSubmitted: (_) {},
      ),
    );
  }
}

final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 0,
    style: BorderStyle.none,
  ),
);
