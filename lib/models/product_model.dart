// import 'package:flutter_latihan_1/models/category_model.dart';
// import 'package:flutter_latihan_1/models/galery_model.dart';

class ProductModel {
  int? id;
  String namaProduct;
  double harga;
  String description;
  String? tags;
  String nama;
  DateTime? createdAt;
  // DateTime? updatedAt;
  String url;
  // List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    required this.namaProduct,
    required this.harga,
    required this.description,
    this.tags,
    required this.nama,
    this.createdAt,
    // this.updatedAt,
    required this.url,
  });

  // Factory constructor for creating a new ProductModel instance from a JSON map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      namaProduct: json['namaProduct'] as String? ?? '', // Handle null
      harga: (json['harga'] is int)
          ? (json['harga'] as int).toDouble() // Convert from int to double
          : (json['harga'] as double? ?? 0.0), // Handle null as well
      description: json['description'] as String? ?? '', // Handle null
      tags: json['tags'] as String? ?? '', // Handle null
      nama: json['nama'] as String? ?? '',
      url: json['url'] as String? ?? '',
      // category: json['categories_id'] != null
      //     ? CategoryModel.fromJson(json['categories_id'])
      //     : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at']) // Safely parse DateTime
          : null,
      // updatedAt: json['updated_at'] != null
      //     ? DateTime.tryParse(json['updated_at'])
      //     : null,
      // galleries: json['galleries'] != null
      //     ? (json['galleries'] as List)
      //         .map((gallery) => GalleryModel.fromJson(gallery))
      //         .toList()
      //     : [],
    );
  }

  // Method for converting ProductModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namaProduct': namaProduct,
      'harga': harga,
      'description': description,
      'tags': tags,
      'nama': nama,
      'created_at': createdAt?.toIso8601String(),
      // 'updated_at': updatedAt?.toIso8601String(),
      'url': url
      // 'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
    };
  }
}

// Example of the CategoryModel class
class CategoryModel {
  int? id;
  String nama;

  CategoryModel({
    this.id,
    required this.nama,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int?,
      nama: json['nama'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}

// Example of the GalleryModel class
class GalleryModel {
  int? id;
  String? imageUrl;

  GalleryModel({
    this.id,
    this.imageUrl,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'] as int?,
      imageUrl: json['image_url'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
    };
  }
}
