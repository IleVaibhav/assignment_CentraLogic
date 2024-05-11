class BookModel {
    String id;
    String title;
    String price;
    String review;
    bool isInBag;
    String description;
    String coverImg;
    String vendor;
    String author;
    int availability;

    BookModel({
      required this.id,
      required this.title,
      required this.price,
      required this.review,
      required this.isInBag,
      required this.description,
      required this.coverImg,
      required this.vendor,
      required this.author,
      required this.availability
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      review: json["review"],
      isInBag: json["is_in_bag"],
      description: json["description"],
      coverImg: json["cover_img"],
      vendor: json["vendor"],
      author: json["author"],
        availability: json["availability"]
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "title": title,
      "price": price,
      "review": review,
      "is_in_bag": isInBag,
      "description": description,
      "cover_img": coverImg,
      "vendor": vendor,
      "author": author,
      "availability": availability
    };
}


class VendorModel {
  final String vendorImg;
  VendorModel(this.vendorImg);
}

class AuthorModel {
    String id;
    String name;
    String image;
    String profession;

    AuthorModel({
      required this.id,
      required this.name,
      required this.image,
      required this.profession
    });

    factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      profession: json["profession"]
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "image": image,
      "profession": profession
    };
}