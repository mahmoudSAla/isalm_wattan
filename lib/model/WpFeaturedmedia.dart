
class WpFeaturedmedia {
  bool embeddable;
  String href;

  WpFeaturedmedia({this.embeddable, this.href});

  WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}
