/*
{
    "status": "success",
    "message": "Logined Successfully",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY0YTU1OGFiN2U2NmUxNGI5N2RmNTY4M2IwYTJiYzA5NjM0MmVmNDkxODY4Y2YxM2FhZjY4YzA4Yzg2NTQyMjIwNzJiYWMyMGQ4NDYyZTc1In0.eyJhdWQiOiIzIiwianRpIjoiNjRhNTU4YWI3ZTY2ZTE0Yjk3ZGY1NjgzYjBhMmJjMDk2MzQyZWY0OTE4NjhjZjEzYWFmNjhjMDhjODY1NDIyMjA3MmJhYzIwZDg0NjJlNzUiLCJpYXQiOjE2NjMyNDc5NTAsIm5iZiI6MTY2MzI0Nzk1MCwiZXhwIjoxNjk0NzgzOTUwLCJzdWIiOiI1MDciLCJzY29wZXMiOltdfQ.vYTduJcfDK_NOrI3CdDcciTDDIApsp4x-qr1g5u_MXZKpDlvtG2skMeOIuTMyOJ1W_LfEUx1gZx9lnx4dyr4z5y-ZJvKsRgY36Wr_VyeuExsd1XLSe3qAAsyyWaoo9h8Wc_nrop-XrfOzKDy6-Pvv3RfGJYNg4ubFHp91IDU_k678GMQQpXZkcuNtjUEsmXrP-Dy990jEdHIh7yiiml_LpfSJpshWPlFFDMxnfzfVfNW5t0RC_67jXiX1BikXF1yXmsjr3UpQpl86yc_1yG11gccAnmwd8MJZTKL_jO1IyGO1RUVowf1fJmUbqBeyEMdtkDSVnr2i1L7ToCE4PHCINydpMN4BvlzFP_wMgXmswcaDCih4ErsZJjny1bMCW06x3DtnDDe9owRa7Z8tfRMHep7bfeMjMh0tOA6RiFsZD8RnUz0ESeA7b6BhyczncrBWSvIngOXjnooFgYqw7WLBPBLZ_Gt0IsMngnUjUw5qRD7kMZnrkx6S063-LjPOF80Brp06t6KSzrf9IWDe92WdtyuMZHiNJ8Pa-ybtt8no_uXXjIGUu2qZPlnOQq8HV3L4mOKgaRvVrjyOxQPl_GuUh1EkMhetRfi9oU4ll41l4NUy68YJMIDB05oBGQ7zbVB2HrRWfKuEkGzHPKFZKoWEZD8cUFJETjD6nAIEe86j1U",
    "data": {
        "id": 507,
        "name": "Bao Flutter",
        "email": "fhelloflutter@gmail.com",
        "nationality": "",
        "image": "https://itesteverything.com/images/default_icon.png",
        "following": "",
        "followers": "",
        "email_verified_at": null,
        "created_at": "2022-09-12 13:31:34",
        "updated_at": "2022-09-12 13:31:34"
    }
}
 */
class User {
  int? id;
  String? name;
  String? email;
  String? nationality;
  String? image;
  String? following;
  String? followers;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.nationality,
    required this.image,
    required this.following,
    required this.followers
  });

  // from Json
  User.fromJson(Map json ):
        this.id = json['id'],
        this.name = json['name'],
        this.email = json['email'],
        this.nationality = json['nationality'],
        this.image = json['image'],
        this.following = json['following'],
        this.followers = json['followers'];

  // toJson
  toJson(){
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'nationality': this.nationality,
      'image': this.image,
      'following': this.following,
      'followers': this.followers,
    };
  }

}