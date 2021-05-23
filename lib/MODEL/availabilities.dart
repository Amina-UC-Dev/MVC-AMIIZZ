class Availabilities {
  String status;
  List<Data> data = [];

  Availabilities({this.status, this.data});

  Availabilities.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    else{
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int staffId;
  String availDate;
  int availShift;
  String availStarttime;
  String availEndtime;
  String createdAt;
  String updatedAt;
  String shiftName;

  Data(
      {this.id,
        this.staffId,
        this.availDate,
        this.availShift,
        this.availStarttime,
        this.availEndtime,
        this.createdAt,
        this.updatedAt,
        this.shiftName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    availDate = json['avail_date'];
    availShift = json['avail_shift'];
    availStarttime = json['avail_starttime'];
    availEndtime = json['avail_endtime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shiftName = json['shift_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['staff_id'] = this.staffId;
    data['avail_date'] = this.availDate;
    data['avail_shift'] = this.availShift;
    data['avail_starttime'] = this.availStarttime;
    data['avail_endtime'] = this.availEndtime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shift_name'] = this.shiftName;
    return data;
  }
}