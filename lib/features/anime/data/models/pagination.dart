import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  const Pagination({
    this.hasNextPage,
    this.currentPage,
  });

  final bool? hasNextPage;
  final int? currentPage;

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      hasNextPage: json['has_next_page'] as bool?,
      currentPage: json['current_page'] as int?,
    );
  }

  @override
  List<Object?> get props => [hasNextPage, currentPage];
}
