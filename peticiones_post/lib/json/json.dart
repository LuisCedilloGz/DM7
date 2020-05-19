class Json {
  String titulo;
  String texto;

  Json(this.texto, this.titulo);
  
  Json.fromJson(Map<String, dynamic> json){
    titulo = json["title"];
    texto = json["body"];
  }
}