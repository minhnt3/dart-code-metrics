import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

import '../../../../../utils/node_utils.dart';
import '../../../lint_utils.dart';
import '../../../models/internal_resolved_unit_result.dart';
import '../../../models/issue.dart';
import '../../../models/replacement.dart';
import '../../../models/severity.dart';
import '../../models/common_rule.dart';
import '../../rule_utils.dart';

part 'config_parser.dart';
part 'visitor.dart';

class RegexExcludeRule extends CommonRule {
  static const ruleId = 'regex-exclude';
  static const _warningMessage = 'forbidden arguments';
  static const _replaceComment = "Replace with 'AppColor.of(context).'.";

  final Iterable<RegExp> _regexs;

  RegexExcludeRule([Map<String, Object> config = const {}])
      : _regexs = _ConfigParser.parseRegexs(config).map((e) => RegExp(e)),
        super(
          id: ruleId,
          severity: readSeverity(config, Severity.error),
          excludes: readExcludes(config),
        );

  @override
  Iterable<Issue> check(InternalResolvedUnitResult source) {
    final visitor = _Visitor(_regexs);

    source.unit.visitChildren(visitor);

    final issues = visitor.expressions
        .map((expression) => createIssue(
              rule: this,
              location: nodeLocation(
                node: expression,
                source: source,
                withCommentOrMetadata: true,
              ),
              message: _warningMessage,
              replacement: Replacement(
                comment: _replaceComment,
                replacement: 'AppColor.of(context).',
              ),
            ))
        .toList(growable: false);

    return issues;
  }
}
