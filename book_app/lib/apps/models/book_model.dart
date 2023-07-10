class BookModel {
    String? id;
    String? title;
    String? description;
    double? price;
    List<String>? images;

    BookModel({
        this.id,
        this.title,
        this.description,
        this.price,
        this.images,
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "price": price,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}
