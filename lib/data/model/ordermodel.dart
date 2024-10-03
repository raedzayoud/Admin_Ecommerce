class orderModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPaymentmethod;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? orderTotalprice;
  int? ordersStatus;
  int? orderRating;
  String? orderNoterating;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;

  orderModel({
    this.ordersId,
    this.ordersUserid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPaymentmethod,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersCoupon,
    this.ordersDatetime,
    this.orderTotalprice,
    this.ordersStatus,
    this.orderRating,
    this.orderNoterating,
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
  });

  orderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    orderTotalprice = json['order_totalprice'];
    ordersStatus = json['orders_status'];
    orderRating = json['order_rating'];
    orderNoterating = json['order_noterating'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['order_totalprice'] = this.orderTotalprice;
    data['orders_status'] = this.ordersStatus;
    data['order_rating'] = this.orderRating;
    data['order_noterating'] = this.orderNoterating;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    return data;
  }
}