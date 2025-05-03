import 'dart:core';

extension ReplaceTags on String {
  String replaceHtmlTags() => replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&amp;', '&')
      .replaceAll('&amp;nbsp;', ' ')
      .replaceAll('&amp;#39;', '’')
      .replaceAll('&amp;middot;', '•')
      .replaceAll('&amp;quot;', '"')
      .replaceAll(r"\'s", "'s")
      .replaceAll('&ndash;', '–');
}
