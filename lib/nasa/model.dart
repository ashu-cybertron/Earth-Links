// converted json to dart class online to let us know its diff methods

class Nasa {
  String apodSite;
  String copyright;
  String date;
  String description;
  String hdurl;
  String imageThumbnail;
  String mediaType;
  String title;
  String url;

  Nasa(
      {this.apodSite,
      this.copyright,
      this.date,
      this.description,
      this.hdurl,
      this.imageThumbnail,
      this.mediaType,
      this.title,
      this.url});

  Nasa.fromJson(Map<String, dynamic> json) {
    apodSite = json['apod_site'];
    copyright = json['copyright'];
    date = json['date'];
    description = json['description'];
    hdurl = json['hdurl'];
    imageThumbnail = json['image_thumbnail'];
    mediaType = json['media_type'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apod_site'] = this.apodSite;
    data['copyright'] = this.copyright;
    data['date'] = this.date;
    data['description'] = this.description;
    data['hdurl'] = this.hdurl;
    data['image_thumbnail'] = this.imageThumbnail;
    data['media_type'] = this.mediaType;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
