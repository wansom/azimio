class Secretariat {
  final String name;
  final String image;
  final String role;

  Secretariat({required this.name,required this.image,required this.role});
}

List <Secretariat> azimioSecretariat =[
  Secretariat(name: "Raila Odinga",role: "President", image: "https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/Raila-Odinga.jpg?alt=media&token=d74aa95d-70b5-4f6f-8cf1-a94de5c4bd16"),
  Secretariat(name: "Martha karua", role:"Deputy President",image: "https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/karua.jpg?alt=media&token=f7fc9410-e0ab-4c5a-8cae-1918dd4efc22"),
  Secretariat(name: "Kalonzo Musyoka", image: "https://firebasestorage.googleapis.com/v0/b/cashpro-c343e.appspot.com/o/Kalonzo.jpg?alt=media&token=f6e9b5e3-f33d-44c8-88f2-81302643ecd8", role: "Chief Minister"),
  Secretariat(name: "Wycliffe Oparanya", role: "CS Finance", image: "https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/oparanya.jpg?alt=media&token=00f995f0-89dd-4ceb-88a6-68a1765a734a"),
  Secretariat(name: "Hassan Joho", role: "CS Lands", image: "https://firebasestorage.googleapis.com/v0/b/billarito-fbb9d.appspot.com/o/joho.jpg?alt=media&token=a5335014-8743-4834-a2f3-10455e373d0b"),
  Secretariat(name: "Charity Ngilu", image: "https://firebasestorage.googleapis.com/v0/b/cashpro-c343e.appspot.com/o/ngilu.webp?alt=media&token=d9949e9a-e4d5-4751-9bb0-92dde86d0519", role: "CS Health")
]
;