class Verse {
  final String text;
  final String content;
  final String displayRef;
  final String reference;
  final String permalink;
  final String copyright;
  final String copyrightLink;
  final String audioLink;
  final String day;
  final String month;
  final String year;
  final String version;
  final String versionId;

  Verse.fromJson(Map<String, dynamic> map)
      : text = map['text'],
        content = map['content'],
        displayRef = map['display_ref'],
        reference = map['reference'],
        permalink = map['permalink'],
        copyright = map['copyright'],
        copyrightLink = map['copyrightlink'],
        audioLink = map['audiolink'],
        day = map['day'],
        month = map['month'],
        year = map['year'],
        version = map['version'],
        versionId = map['version_id'];
}

// class VerseResponse {
//   final Verse verse;

//   VerseResponse.fromJson(Map<String, dynamic> map) 
//       : verse = map['votd'];
// }
