import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

import '../../../../../reporters/models/console_reporter.dart';
import '../../../models/unused_files_file_report.dart';

/// Unused files console reporter.
///
/// Use it to create reports in console format.
class UnusedFilesConsoleReporter
    extends ConsoleReporter<UnusedFilesFileReport, void> {
  UnusedFilesConsoleReporter(IOSink output) : super(output);

  @override
  Future<void> report(
    Iterable<UnusedFilesFileReport> records, {
    Iterable<void> summary = const [],
  }) async {
    if (records.isEmpty) {
      output.writeln('No unused files found!');

      return;
    }

    final sortedRecords = records.toList()
      ..sort((a, b) => a.relativePath.compareTo(b.relativePath));

    for (final analysisRecord in sortedRecords) {
      output.writeln('Unused file: ${analysisRecord.relativePath}');
    }

    final color = AnsiPen()..yellow();

    output
      ..writeln('')
      ..writeln('Total unused files - ${color(sortedRecords.length)}');
  }
}
