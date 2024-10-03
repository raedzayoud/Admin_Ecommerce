class Catmodel {
  int? price;
  int? nbreoccurence;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsDesc;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategories;

  Catmodel(
      {this.price,
      this.nbreoccurence,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDesc,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories});

  Catmodel.fromJson(Map<String, dynamic> json) {
    price = json['itemsprice'];
    nbreoccurence = json['countitmes'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDesc = json['items_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['nbreoccurence'] = this.nbreoccurence;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_desc'] = this.itemsDesc;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    return data;
  }
}