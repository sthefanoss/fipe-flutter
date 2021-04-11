import 'package:flutter/material.dart';

class ResourceTextThemes {
  const ResourceTextThemes();

  final title1 = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  final title2 = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  final carTileTitle = const TextStyle(
    fontSize: 14,
    color: Color(0xFF000000),
    fontWeight: FontWeight.w700,
  );
  final carTileSubtitle = const TextStyle(
    fontSize: 14,
    color: Color(0xFF595959),
    fontWeight: FontWeight.w400,
  );
  final carTileButton = const TextStyle(
    fontSize: 10,
    color: Color(0xFF00ADEE),
    fontWeight: FontWeight.w300,
  );
  final currentRoute = const TextStyle(
    color: Color(0xFF00ADEE),
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
  final otherRoute = const TextStyle(
    color: Color(0xFFFAFAFA),
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );
  final copyright = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF00ADEE),
  );

  final input = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  final inputHint = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF595959),
  );

  final button = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
