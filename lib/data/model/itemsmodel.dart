class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscounts;
  String? itemsDate;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatatime;
  int? favourite;
  int? itemsdiscount;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscounts,
      this.itemsDate,
      this.itemsCategories,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDatatime,
      this.itemsdiscount,
      this.favourite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscounts = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatatime = json['categories_datatime'];
    favourite = json['favourite'];
    itemsdiscount = json['itemsdiscount1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscounts;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datatime'] = this.categoriesDatatime;
    data['favourite'] = this.favourite;
    return data;
  }
}