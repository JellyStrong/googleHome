import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GuestBook {
  final String name;
  final String content;
  final String password;

  // final DateTime created_at;
  // final DateTime updated_at;

  GuestBook({
    required this.name,
    required this.content,
    required this.password,
    // required this.created_at,
    // required this.updated_at,
  });

  factory GuestBook.fromJson(Map<String, dynamic> json) {
    return GuestBook(
        name: json['name'],
        content: json['content'],
        password: json['password']);
    // created_at: json['created_at'],
    // updated_at: json['updated_at']);
  }



Map<String, dynamic> toJSon() {
  return {
    "name": name,
    "content": content,
    "password": password,
    // "created_at": created_at,
    // "updated_at": updated_at,
  };
}
}
