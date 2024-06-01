import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<void> showFlushBar({
    required String message,
    double? verticalMargin,
    bool error = false,
    int? duration,
  }) async {
    Flushbar<void>(
      backgroundColor: error
          ? Theme.of(this).colorScheme.error
          : Theme.of(this).primaryColor,
      messageText: Text(
        message,
        style: Theme.of(this).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
      ),
      icon: Icon(
        error ? Icons.error : Icons.check_circle,
        color: Colors.white,
      ),
      duration: Duration(milliseconds: duration ?? 4000),
      borderRadius: BorderRadius.circular(10),
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: verticalMargin ?? 20,
      ),
    ).show(this);
  }
}
