class secondModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  secondModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
});

  static List<secondModel> getSecond(){
    List <secondModel> second = [];

    second.add(
     secondModel(
         name: 'Pikachu',
         iconPath: 'assets/imaages/Pokeball.png',
         level: '10',
         duration: 'Eletric',
         calorie: 'Kind',
         viewIsSelected: true
     )
    );

    second.add(
      secondModel(
          name: 'Charizard',
          iconPath: 'assets/imaages/Pokeball.png',
          level: '42',
          duration: 'Fire/Flying',
          calorie: 'Aggressive',
          viewIsSelected: false
      )
    );
    return second;
  }

}