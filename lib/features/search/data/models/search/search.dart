class SearchResultModel {
  final List<BaseTrack> tracks;
  final int totalResults;
  final SourceType source;
  final String query;

  const SearchResultModel({
    required this.tracks,
    required this.totalResults,
    required this.source,
    required this.query,
  });
}