import 'package:flutter/material.dart';
import 'package:mpes/view/shared/components/constants.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    image: "assets/images/Furniture.png",
    title: "Furniture",
    price: 234,
    description: "This is Furniture 1",
    size: 12,
    color: kPrimaryColor,
  ),
  Product(
    id: 2,
    image: "assets/images/Furniture.png",
    title: "test",
    price: 234,
    description: "This is Furniture 2",
    size: 12,
    color: kPrimaryColor,
  ),
  Product(
    id: 3,
    image: "assets/images/Furniture.png",
    title: "test",
    price: 234,
    description: "This is Furniture 1",
    size: 12,
    color: kPrimaryColor,
  ),
  Product(
    id: 4,
    image: "assets/images/Furniture.png",
    title: "test",
    price: 234,
    description: "This is Furniture 3",
    size: 12,
    color: kPrimaryColor,
  ),
  Product(
    id: 5,
    image: "assets/images/Furniture.png",
    title: "test",
    price: 234,
    description: "This is Furniture 4",
    size: 12,
    color: kPrimaryColor,
  ),
  Product(
    id: 6,
    image: "assets/images/Furniture.png",
    title: "test",
    price: 234,
    description: "This is Furniture 5",
    size: 12,
    color: kPrimaryColor,
  ),
];
