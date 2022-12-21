import 'dart:convert';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

class FlowerModel extends Flowers {
  const FlowerModel({
    required String id,
    required List<String> tag,
    required int index,
    required String cost,
    required String picture,
    required String description,
  }) : super(
          id: id,
          tag: tag,
          index: index,
          cost: cost,
          picture: picture,
          description: description,
        );

  FlowerModel copyWith({
    String? id,
    List<String>? tag,
    int? index,
    String? cost,
    String? picture,
    String? description,
  }) {
    return FlowerModel(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      index: index ?? this.index,
      cost: cost ?? this.cost,
      picture: picture ?? this.picture,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag,
      'index': index,
      'cost': cost,
      'picture': picture,
      'description': description,
    };
  }

  factory FlowerModel.fromMap(Map<String, dynamic> map) {
    return FlowerModel(
      id: map['id'] ?? '',
      tag: List<String>.from(map['tag']),
      index: map['index']?.toInt() ?? 0,
      cost: map['cost'] ?? '',
      picture: map['picture'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlowerModel.fromJson(String source) => FlowerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Flowers(id: $id, tag: $tag, index: $index, cost: $cost, picture: $picture, description: $description)';
  }
}
