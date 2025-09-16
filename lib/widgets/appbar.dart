import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/styles/colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconButton leading;
  final List<Widget>? actions;

  const Header({
    Key? key, 
    required this.leading,
    required this.title,
    required this.actions
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: getColor(),
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white70,
      leading: leading,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}