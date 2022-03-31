class FirePath {
  /// closet path
  static String get closetFirePath => '/closet';

  /// /$uid/engr_img/profile
  static String getClosetImgPath(String uid, String typ) => '/$uid/$typ';

  // /// /$uid/engr_img/img
  // static String getEngrRepImgPath(String uid) =>
  //     firePath + '/engr_img/$uid/img';

  // /// /$uid/engr_img/biz
  // static String getEngrBizLImgPath(String uid) =>
  //     firePath + '/engr_img/$uid/biz';
}
