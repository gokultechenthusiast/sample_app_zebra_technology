import 'package:equatable/equatable.dart';

class Flowers extends Equatable {
  final String id;
  final List<String> tag;
  final int index;
  final String cost;
  final String picture;
  final String description;
  const Flowers({
    required this.id,
    required this.tag,
    required this.index,
    required this.cost,
    required this.picture,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        tag,
        index,
        cost,
        picture,
        description,
      ];
}
