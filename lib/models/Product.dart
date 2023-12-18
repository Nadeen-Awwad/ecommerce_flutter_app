class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final Rating rating;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
    this.quantity = 1,
  });

  String get formattedPrice => '\$$price';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: Rating.fromJson(json['rating']),
      quantity: json['quantity'] ?? 1, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating.toJson(),
      'quantity': quantity,
    };
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ price.hashCode ^ description.hashCode ^
      category.hashCode ^ imageUrl.hashCode ^ rating.hashCode;
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Rating &&
            runtimeType == other.runtimeType &&
            rate == other.rate &&
            count == other.count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
