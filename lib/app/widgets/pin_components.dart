import 'package:flutter/material.dart';
import 'package:swiss_army_component/swiss_army_component.dart';
import '../utils/utils.dart';
 

class PinErrorBanner extends StatelessWidget {
  const PinErrorBanner({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      return Container(
        margin: simPad(20, 0),
        padding: simPad(16, 12),
        decoration: BoxDecoration(
          color: AppColours.red.withValues(alpha: 0.05),
          border: Border.all(color: AppColours.red),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MedAppText(
              "PINs don't match",
              color: AppColours.red,
              fontWeight: FontWeight.bold,
            ),
            vSpace(4),
            SmallAppText(
              "The second code you entered was different. Let's try that confirmation one more time.",
              color: AppColours.black, // Or grey
              maxLines: 3,
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink(); // No placeholder
  }
}

class PinIndicators extends StatelessWidget {
  const PinIndicators({super.key, required this.pinLength});
  final int pinLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool filled = index < pinLength;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? const Color(0xffD4F427) : null, // Lime green
            border: Border.all(
              color:
                  filled
                      ? Colors.transparent
                      : AppColours.grey.withValues(alpha: 0.3),
            ),
          ),
        );
      }),
    );
  }
}

class PinKeypad extends StatelessWidget {
  const PinKeypad({
    super.key,
    required this.onNumberTap,
    required this.onBackspace,
  });
  final Function(String) onNumberTap;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          ...List.generate(
            9,
            (index) => _PinKey((index + 1).toString(), onNumberTap),
          ),
          const SizedBox(), // Empty
          _PinKey('0', onNumberTap),
          _BackspaceKey(onBackspace),
        ],
      ),
    );
  }
}

class _PinKey extends StatelessWidget {
  const _PinKey(this.number, this.onTap);
  final String number;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Container(
        decoration: BoxDecoration(
          color: AppColours.primary.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: BigAppText(number, fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _BackspaceKey extends StatelessWidget {
  const _BackspaceKey(this.onTap);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColours.grey300,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20,
          color: AppColours.red,
        ),
      ),
    );
  }
}
