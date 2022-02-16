
class Source{
  dynamic id,name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> data) => Source(
    id: data['id'],
    name: data['name']
  );

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "name": this.name
  };

}