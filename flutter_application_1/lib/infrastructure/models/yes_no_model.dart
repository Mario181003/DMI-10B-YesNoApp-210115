import 'package:flutter_application_1/domain/entities/message.dart';

// Modelo que representa la respuesta de una API que retorna "sí" o "no".
// Esta clase mapea los datos JSON obtenidos del API y los convierte en una entidad de dominio llamada --Message--

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No', 
    fromWho: FromWho.other,
    imageUrl: image
  );
}