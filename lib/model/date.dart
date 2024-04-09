class GuestBook {
  final int no;
  final String name;
  final String content;
  final String pasword;
  final DateTime created_at;
  final DateTime updated_at;

  GuestBook({
    required this.no,
    required this.name,
    required this.content,
    required this.pasword,
    required this.created_at,
    required this.updated_at,
  });

  factory GuestBook.fromJson(Map<String, dynamic> json) {
    return GuestBook(
        no: json['no'],
        name: json['name'],
        content: json['content'],
        pasword: json['pasword'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }

  Map<String, dynamic> toJSon() {
    return {
      "no": no,
      "name": name,
      "content": content,
      "pasword": pasword,
      "created_at": created_at,
      "updated_at": updated_at,
    };
  }
}
