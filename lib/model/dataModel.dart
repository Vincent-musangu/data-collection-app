class DataModel {
  String newData;
  String data_id;
  String translation;
  DateTime createdTime;
  DataModel(this.newData, this.translation, this.data_id, this.createdTime);

  DataModel.Map(dynamic obj) {
    this.newData = obj["newData"];
    this.data_id = obj["data_id"];
    this.translation = obj["translation"];
    this.createdTime = obj["createdTime"];
  }
  DataModel.fromMap(Map<String, dynamic> map)
      : assert(map["newData"] != null),
        assert(map["data_id"] != null),
        assert(map["translation"]),
        assert(map["createdTime"] != null),
        this.newData = map["newData"],
        this.translation = map["translation"],
        this.data_id = map["data_id"],
        this.createdTime = map["createdTime"] is String
            ? DateTime.parse(map["createdTime"])
            : map["createdTime"];

  Map<String, dynamic> toMap() {
    return {
      "newData": this.newData,
      "data_id": this.data_id,
      "translation": this.translation,
      "createdTime": this.createdTime.toString(),
    };
  }
}
