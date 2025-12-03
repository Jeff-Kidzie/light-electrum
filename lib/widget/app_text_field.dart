// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lightweight_electrum/theme/app_color.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.title,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.errorText,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // If isPassword, override suffixIcon with visibility toggle
    final effectiveSuffixIcon = widget.isPassword
        ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
        : widget.suffixIcon;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTextStyles.semiBold),
        SizedBox(height: 8),
        TextFormField(
          obscureText: widget.isPassword && _obscureText,
          onChanged: widget.onChanged,
          controller: widget.controller,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(AppColors.border)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(AppColors.border)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFCCCCCC)),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: effectiveSuffixIcon,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ),
        SizedBox(height: 4),
        Text(
          widget.errorText ?? '',
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
      ],
    );
  }
}
