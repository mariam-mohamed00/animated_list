import 'package:flutter/material.dart';

Widget MyTextFormField({
  required String labelText,
  required IconData prefixIcon,
  required double padding,
  bool obscureText = false,
  IconData? suffixIcon,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  required TextEditingController controller,
})
{
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(suffixIcon),
                )
            : null,
      ),
    ),
  );
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.25) ;
    path.cubicTo(
        size.width / 2 * 0.6,
        size.height * 0.5,
        size.width * 2 / 2 ,
        size.height * 1.3,
        size.width * 1.2,
        size.height / 1.8
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  }

