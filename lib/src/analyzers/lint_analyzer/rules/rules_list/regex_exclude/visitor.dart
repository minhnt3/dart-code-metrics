part of 'regex_exclude_rule.dart';

class _Visitor extends RecursiveAstVisitor<void> {
  _Visitor(this.regExps);

  final _expressions = <Expression>[];
  Iterable<Expression> get expressions => _expressions;
  final Iterable<RegExp> regExps;

  @override
  void visitArgumentList(ArgumentList node) {
    super.visitArgumentList(node);

    _expressions.addAll(node.arguments.where((element) =>
        regExps.any((regExp) => regExp.hasMatch(element.toString()))));
  }
}
