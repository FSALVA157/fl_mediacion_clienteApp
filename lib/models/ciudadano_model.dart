
// To parse this JSON data, do
//
//     final ciudadanoModel = ciudadanoModelFromMap(jsonString);

import 'dart:convert';

CiudadanoModel ciudadanoModelFromMap(String str) => CiudadanoModel.fromMap(json.decode(str));

String ciudadanoModelToMap(CiudadanoModel data) => json.encode(data.toMap());

class CiudadanoModel {
    CiudadanoModel({
        this.dni,
        this.apellido,
        this.nombre,
        required this.sexoId,
        required this.fechaNac,
        required this.provinciaId,
        required this.departamentoId,
        required this.municipioId,
        this.localidadBarrio,
        this.calleDireccion,
        this.numeroDom,
        this.telefono,
        this.email,
        this.clave,
        required this.sexo,
        required this.provincia,
        required this.departamento,
        required this.municipio,
    });

    int? dni;
    String? apellido;
    String? nombre;
    int sexoId;
    DateTime fechaNac;
    int provinciaId;
    int departamentoId;
    int municipioId;
    String? localidadBarrio;
    dynamic? calleDireccion;
    int? numeroDom;
    String? telefono;
    String? email;
    String? clave;
    Sexo sexo;
    Provincia provincia;
    Departamento departamento;
    Municipio municipio;

    factory CiudadanoModel.fromMap(Map<String, dynamic> json) => CiudadanoModel(
        dni: json["dni"],
        apellido: json["apellido"],
        nombre: json["nombre"],
        sexoId: json["sexo_id"],
        fechaNac: DateTime.parse(json["fecha_nac"]),
        provinciaId: json["provincia_id"],
        departamentoId: json["departamento_id"],
        municipioId: json["municipio_id"],
        localidadBarrio: json["localidad_barrio"],
        calleDireccion: json["calle_direccion"],
        numeroDom: json["numero_dom"],
        telefono: json["telefono"],
        email: json["email"],
        clave: json["clave"],
        sexo: Sexo.fromMap(json["sexo"]),
        provincia: Provincia.fromMap(json["provincia"]),
        departamento: Departamento.fromMap(json["departamento"]),
        municipio: Municipio.fromMap(json["municipio"]),
    );

    Map<String, dynamic> toMap() => {
        "dni": dni,
        "apellido": apellido,
        "nombre": nombre,
        "sexo_id": sexoId,
        "fecha_nac": "${fechaNac.year.toString().padLeft(4, '0')}-${fechaNac.month.toString().padLeft(2, '0')}-${fechaNac.day.toString().padLeft(2, '0')}",
        "provincia_id": provinciaId,
        "departamento_id": departamentoId,
        "municipio_id": municipioId,
        "localidad_barrio": localidadBarrio,
        "calle_direccion": calleDireccion,
        "numero_dom": numeroDom,
        "telefono": telefono,
        "email": email,
        "clave": clave,
        "sexo": sexo.toMap(),
        "provincia": provincia.toMap(),
        "departamento": departamento.toMap(),
        "municipio": municipio.toMap(),
    };
}

class Departamento {
    Departamento({
        required this.idDepartamento,
        required this.departamento,
        required this.provinciaId,
        required this.provincia,
    });

    int idDepartamento;
    String departamento;
    int provinciaId;
    Provincia provincia;

    factory Departamento.fromMap(Map<String, dynamic> json) => Departamento(
        idDepartamento: json["id_departamento"],
        departamento: json["departamento"],
        provinciaId: json["provincia_id"],
        provincia: Provincia.fromMap(json["provincia"]),
    );

    Map<String, dynamic> toMap() => {
        "id_departamento": idDepartamento,
        "departamento": departamento,
        "provincia_id": provinciaId,
        "provincia": provincia.toMap(),
    };
}

class Provincia {
    Provincia({
        required this.idProvincia,
        required this.provincia,
    });

    int idProvincia;
    String provincia;

    factory Provincia.fromMap(Map<String, dynamic> json) => Provincia(
        idProvincia: json["id_provincia"],
        provincia: json["provincia"],
    );

    Map<String, dynamic> toMap() => {
        "id_provincia": idProvincia,
        "provincia": provincia,
    };
}

class Municipio {
    Municipio({
        required this.idMunicipio,
        required this.municipio,
        required this.departamentoId,
        required this.departamento,
    });

    int idMunicipio;
    String municipio;
    int departamentoId;
    Departamento departamento;

    factory Municipio.fromMap(Map<String, dynamic> json) => Municipio(
        idMunicipio: json["id_municipio"],
        municipio: json["municipio"],
        departamentoId: json["departamento_id"],
        departamento: Departamento.fromMap(json["departamento"]),
    );

    Map<String, dynamic> toMap() => {
        "id_municipio": idMunicipio,
        "municipio": municipio,
        "departamento_id": departamentoId,
        "departamento": departamento.toMap(),
    };
}

class Sexo {
    Sexo({
        required this.idSexo,
        required this.sexo,
    });

    int idSexo;
    String sexo;

    factory Sexo.fromMap(Map<String, dynamic> json) => Sexo(
        idSexo: json["id_sexo"],
        sexo: json["sexo"],
    );

    Map<String, dynamic> toMap() => {
        "id_sexo": idSexo,
        "sexo": sexo,
    };
}
