import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../utils/utils.dart';

class KoraOTP extends StatelessWidget {
  const KoraOTP({
    super.key,
    this.controller,
    this.focusNode,
    this.onCompleted,
    this.length = 4,
  });

  final Color borderColor = AppColours.primary;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onCompleted;
  final int length;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColours.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColours.grey),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(width: 2, height: 20, color: borderColor),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColours.primary),
      borderRadius: BorderRadius.circular(15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColours.primary),
      ),
    );

    return Pinput(
      focusedPinTheme: focusedPinTheme,
      onCompleted: onCompleted,
      submittedPinTheme: submittedPinTheme,
      length: length,
      pinAnimationType: PinAnimationType.slide,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      keyboardType: TextInputType.number,
      cursor: cursor,
      // preFilledWidget: preFilledWidget,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
