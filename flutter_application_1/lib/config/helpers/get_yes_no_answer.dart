import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/infrastructure/models/yes_no_model.dart';

// Clase que maneja la obtención de respuestas de "sí" o "no" desde un servicio externo.
class GetYesNoAnswer {
// Instancia de la biblioteca Dio para realizar solicitudes HTTP.
  final _dio = Dio();

// Obtiene una respuesta de "sí" o "no" desde la API `https://yesno.wtf/api`.
// Esta función realiza una solicitud HTTP GET al servicio externo y convierte la respuesta en un objeto de tipo --Message-- a través de un modelo que mapea la respuesta.
// Retorna Un objeto de tipo [Message] que representa la respuesta obtenida de la API.

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}