
class Sign{

  String _signName;
  String _signDate;
  String _signDetail;
  String _signSmallImage;
  String _signBigImage;

  Sign(this._signName, this._signDate, this._signDetail, this._signSmallImage,
      this._signBigImage);

  String get signBigImage => _signBigImage;

  set signBigImage(String value) {
    _signBigImage = value;
  }

  String get signSmallImage => _signSmallImage;

  set signSmallImage(String value) {
    _signSmallImage = value;
  }

  String get signDetail => _signDetail;

  set signDetail(String value) {
    _signDetail = value;
  }

  String get signDate => _signDate;

  set signDate(String value) {
    _signDate = value;
  }

  String get signName => _signName;

  set signName(String value) {
    _signName = value;
  }



}