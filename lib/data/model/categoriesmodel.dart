class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatatime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDatatime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datatime'] = this.categoriesDatatime;
    return data;
  }
}