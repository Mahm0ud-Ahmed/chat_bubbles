class ApiInfo {
  String endpoint;
  Map<String, dynamic>? queries;
  int? page;
  int? pageSize;

  ApiInfo({
    required this.endpoint,
    this.queries,
    this.page = 1,
    this.pageSize = 20,
  });

  ApiInfo copyWith({
    String? endpoint,
    Map<String, dynamic>? queries,
    int? page,
    int? pageSize,
  }) {
    return ApiInfo(
      endpoint: endpoint ?? this.endpoint,
      queries: queries ?? this.queries,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  String toString() {
    return 'ApiInfo(endpoint: $endpoint, queries: $queries, page: $page, pageSize: $pageSize)';
  }
}
