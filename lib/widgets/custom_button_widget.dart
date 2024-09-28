import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String label; // Required label
  final IconData? icon; // Optional icon
  final Color buttonColor; // Button background color
  final Color textColor; // Label text color
  final double fontSize; // Label text size
  final VoidCallback onPressed; // Callback for button press
  final double buttonHeight; // Height of the button
  final double buttonWidth; // Width of the button
  final EdgeInsetsGeometry padding; // Padding inside the button

  const CustomButtonWidget({
    super.key,
    required this.label,
    this.icon,
    this.buttonColor = Colors.blue, // Default color is blue
    this.textColor = Colors.white, // Default text color is white
    this.fontSize = 16.0, // Default text size is 16.0
    required this.onPressed,
    this.buttonHeight = 50.0, // Default height
    this.buttonWidth = 200.0, // Default width
    this.padding =
        const EdgeInsets.symmetric(horizontal: 16.0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.sizeOf(context).height /
          (MediaQuery.sizeOf(context).height / buttonHeight)),
      width: (MediaQuery.sizeOf(context).width /
          (MediaQuery.sizeOf(context).width / buttonWidth)),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, // Background color
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        icon: icon != null
            ? Icon(icon, color: textColor)
            : const SizedBox.shrink(), // Optional icon
        label: Text(
          label,
          style: TextStyle(
            color: textColor, // Text color
            fontSize: (MediaQuery.sizeOf(context).width /
                (MediaQuery.sizeOf(context).width / fontSize)),
          ),
        ),
      ),
    );
  }
}
