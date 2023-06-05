
class Contact
{

  int id;
  String nom;
  String num;

  Contact({required this.id, required this.nom, required this.num});

  factory Contact.fromJson(Map<String, dynamic> parsedJson){
    return Contact(
      id : parsedJson['id'],
      nom: parsedJson['nom'],
      num: parsedJson['num']
    );
  }

  @override
  String toString() {
    return "name : $nom \nnuméro : $num";
  }
}