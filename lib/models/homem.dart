class Homem {
  final List<String>? banners;
  final List<Coupons>? coupons;

  Homem({
    this.banners,
    this.coupons,
  });

  Homem.fromJson(Map<String, dynamic> json)
      : banners = (json['Banners'] as List?)?.map((dynamic e) => e as String).toList(),
        coupons = (json['Coupons'] as List?)
            ?.map((dynamic e) => Coupons.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'Banners': banners, 'Coupons': coupons?.map((e) => e.toJson()).toList()};
}

class Coupons {
  final String? code;
  final String? description;

  Coupons({
    this.code,
    this.description,
  });

  Coupons.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'description': description};
}
