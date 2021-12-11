part of 'regex_exclude_rule.dart';

class _ConfigParser {
  static const _allowedConfigName = 'regexs';

  static const _defaultRegexs = <String>[];

  static Iterable<String> parseRegexs(Map<String, Object> config) =>
      (config[_allowedConfigName] as Iterable?)?.cast<String>() ??
      _defaultRegexs;
}
