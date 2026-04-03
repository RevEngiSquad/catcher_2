import 'package:flutter/cupertino.dart';

class Catcher2Utils {
  static bool isCupertinoAppAncestor(BuildContext context) =>
      context.findAncestorWidgetOfExactType<CupertinoApp>() != null;
}
