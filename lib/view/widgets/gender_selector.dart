import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioSelector extends StatefulWidget {
  const RadioSelector({
    super.key,
    required this.option1,
    required this.option2,
    this.label,
    this.radioStyle,
    required this.onChanged,
    this.initialValue,
  });

  final String option1;
  final String option2;
  final String? label;
  final TextStyle? radioStyle;
  final void Function(String? value)? onChanged;
  final String? initialValue;

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  String _selectedGender = '';

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialValue ?? _selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        radioLabel(),
        Row(
          children: [
            Radio<String>(
              value: widget.option1,
              activeColor: const Color(0xFFE1353C),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                  widget.onChanged?.call(_selectedGender);
                });
              },
            ),
            radioText(widget.option1),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: widget.option2,
              activeColor: const Color(0xFFE1353C),
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                  widget.onChanged?.call(_selectedGender);
                });
              },
            ),
            radioText(widget.option2),
          ],
        ),
      ],
    );
  }

  Text radioLabel() {
    return Text(
      widget.label ?? '',
      style: widget.radioStyle?.copyWith(
        color: const Color(0xFFA6A6A6),
        fontSize: 14.h, // Using ScreenUtil for responsive font size
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text radioText(String option) {
    TextStyle style = TextStyle(
      color: _selectedGender == option ? Colors.black : const Color(0xFF838383),
      fontSize: widget.radioStyle != null ? widget.radioStyle?.fontSize! : 14.h,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      inherit: false,
    );
    return Text(
      option,
      style: condition(
        widget.radioStyle != null,
        widget.radioStyle?.merge(style),
        const TextStyle().merge(style),
      ),
    );
  }
}
