// @TestOn('vm')
// import 'package:dart_code_metrics/src/analyzers/lint_analyzer/models/severity.dart';
// import 'package:dart_code_metrics/src/analyzers/lint_analyzer/rules/rules_list/regex_exclude/regex_exclude_rule.dart';
// import 'package:test/test.dart';

// import '../../../../../helpers/rule_test_helper.dart';

// // ignore_for_file: avoid_escaping_inner_quotes

// const _correctExamplePath = 'regex_exclude/examples/correct_example.dart';
// const _incorrectExamplePath = 'regex_exclude/examples/incorrect_example.dart';

// void main() {
//   group('PreferTrailingCommaRule', () {
//     test('initialization', () async {
//       final unit = await RuleTestHelper.resolveFromFile(_correctExamplePath);
//       final issues = RegexExcludeRule().check(unit);

//       RuleTestHelper.verifyInitialization(
//         issues: issues,
//         ruleId: 'regex-exclude',
//         severity: Severity.warning,
//       );
//     });

//     test('with default config reports about found issues', () async {
//       final unit = await RuleTestHelper.resolveFromFile(_incorrectExamplePath);
//       final issues = RegexExcludeRule().check(unit);

//       RuleTestHelper.verifyIssues(
//         issues: issues,
//         startOffsets: [230, 189, 171, 259, 638, 669],
//         startLines: [10, 10, 9, 11, 26, 26],
//         startColumns: [55, 14, 15, 17, 17, 48],
//         endOffsets: [238, 239, 240, 267, 646, 677],
//         locationTexts: ['\'Colors\'','(element) => element.toString().contains(\'Colors\')','list\n'
//             '      .where((element) => element.toString().contains(\'Colors\'))','\'Colors\'', '\'Colors\'', '\'Colors\''],
//         messages: [
//           'arguments include restricted words',
//           'arguments include restricted words',
//           'arguments include restricted words',
//           'arguments include restricted words',
//           'arguments include restricted words',
//           'arguments include restricted words',
//         ],
//       );
//     });

//     test('with default config reports no issues', () async {
//       final unit = await RuleTestHelper.resolveFromFile(_correctExamplePath);
//       final issues = RegexExcludeRule().check(unit);

//       RuleTestHelper.verifyNoIssues(issues);
//     });

//     // test('with custom config reports about found issues', () async {
//     //   final unit = await RuleTestHelper.resolveFromFile(_correctExamplePath);
//     //   final config = {'break-on': 1};

//     //   final issues = RegexExcludeRule(config).check(unit);

//     //   RuleTestHelper.verifyIssues(
//     //     issues: issues,
//     //     startOffsets: [130, 226, 275, 610, 656, 1002, 1287, 1370, 1553, 1732],
//     //     startLines: [9, 17, 19, 37, 41, 75, 91, 99, 109, 119],
//     //     startColumns: [21, 33, 20, 23, 19, 18, 43, 21, 19, 19],
//     //     endOffsets: [141, 250, 299, 634, 680, 1011, 1288, 1383, 1566, 1760],
//     //     locationTexts: [
//     //       'String arg1',
//     //       'void Function() callback',
//     //       'void Function() callback',
//     //       '() {\n'
//     //           '      return;\n'
//     //           '    }',
//     //       '() {\n'
//     //           '      return;\n'
//     //           '    }',
//     //       'firstItem',
//     //       '0',
//     //       '\'some string\'',
//     //       '\'some string\'',
//     //       '\'some string\': \'some string\'',
//     //     ],
//     //     messages: [
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //       'Prefer trailing comma.',
//     //     ],
//     //   );
//     // });
//   });
// }
