import 'package:catcher_2/model/platform_type.dart';
import 'package:catcher_2/model/report.dart';
import 'package:catcher_2/model/report_handler.dart';
import 'package:flutter/material.dart';

class ConsoleHandler extends ReportHandler {
  ConsoleHandler({
    this.enableStackTrace = true,
    this.enableCustomParameters = false,
    this.handleWhenRejected = false,
  });

  final bool enableStackTrace;
  final bool enableCustomParameters;
  final bool handleWhenRejected;

  @override
  Future<bool> handle(Report report, BuildContext? context) {
    logger
      ..info('Crash occurred on ${report.dateTime}')
      ..info('');
    logger
      ..info('---------- ERROR ----------')
      ..info('${report.error}')
      ..info('');
    if (enableStackTrace) {
      _printStackTraceFormatted(report.stackTrace);
    }
    if (enableCustomParameters) {
      _printCustomParametersFormatted(report.customParameters);
    }
    logger.info(
      '======================================================================',
    );
    return Future.value(true);
  }

  void _printStackTraceFormatted(dynamic stackTrace) {
    if (stackTrace == null) return;
    logger.info('------- STACK TRACE -------');
    stackTrace?.toString().split('\n').forEach((entry) => logger.info(entry));
  }

  void _printCustomParametersFormatted(Map<String, dynamic> customParameters) {
    if (customParameters.isEmpty) return;
    logger.info('------- CUSTOM INFO -------');
    for (final entry in customParameters.entries) {
      logger.info('${entry.key}: ${entry.value}');
    }
  }

  @override
  List<PlatformType> getSupportedPlatforms() => [
        PlatformType.android,
        PlatformType.iOS,
        PlatformType.web,
        PlatformType.linux,
        PlatformType.macOS,
        PlatformType.windows,
      ];

  @override
  bool shouldHandleWhenRejected() => handleWhenRejected;
}
