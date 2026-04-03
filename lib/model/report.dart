import 'package:catcher_2/model/platform_type.dart';
import 'package:flutter/foundation.dart';

class Report {
  /// Creates report instance
  Report(
    this.error,
    this.stackTrace,
    this.dateTime,
    this.customParameters,
    this.errorDetails,
    this.platformType,
  );

  /// Error that has been caught
  final dynamic error;

  /// Stack trace of error
  final dynamic stackTrace;

  /// Time when it was caught
  final DateTime dateTime;

  /// Custom parameters passed to report
  final Map<String, dynamic> customParameters;

  /// FlutterErrorDetails data if present
  final FlutterErrorDetails? errorDetails;

  /// Type of platform used
  final PlatformType platformType;

  /// Creates json from current instance
  Map<String, dynamic> toJson({
    bool enableStackTrace = true,
    bool enableCustomParameters = false,
  }) {
    final json = <String, dynamic>{
      'error': error.toString(),
      'customParameters': customParameters,
      'dateTime': dateTime.toIso8601String(),
      'platformType': platformType.name,
    };
    if (enableStackTrace) {
      json['stackTrace'] = stackTrace.toString();
    }
    if (enableCustomParameters) {
      json['customParameters'] = customParameters;
    }
    return json;
  }
}
