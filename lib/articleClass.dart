
class articleClass {
/* Variables declaration*/
  String title, abstrct, imgURL;
  Object Multimedia;

  /*parametric constructor*/
  articleClass({this.title, this.abstrct, this.imgURL, this.Multimedia});

  /*Mapping data from json*/
  factory articleClass.fromJson(Map<String,dynamic> article) => articleClass(
    title: article['title'] ?? "N/A",
    abstrct: article['abstract'] ?? "N/A",
    imgURL: article['url'] ?? "N/A",
    Multimedia: article['multimedia'] ?? "N/A"
  );

  Map<String,dynamic> toJson() =>
      {'title': title, 'abstract':abstrct, 'url':imgURL, 'multimedia':Multimedia};
}
