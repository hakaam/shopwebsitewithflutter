class Chef {

  String image;
  String name;
  String designation;
  int index;

  Chef({

    required this.image,
    required this.name,
    required this.designation,
    required this.index


});


}

List<Chef> chefs=[

  Chef(
      image: 'https://images.unsplash.com/photo-1542211183455-2afe6f173cdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=773&q=80',
      name: 'Chao xi zao',
      designation: 'Head Chef',
      index: 1),
  Chef(
      image: 'https://images.unsplash.com/photo-1542211183455-2afe6f173cdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=773&q=80',
      name: 'Monica Geller',
      designation: 'Food Stylist',
      index: 2),
  Chef(
      image: 'https://images.unsplash.com/photo-1542211183455-2afe6f173cdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=773&q=80',
      name: 'Steve Bonus',
      designation: 'Spicy Food Maker',
      index:3),
  Chef(
      image: 'https://images.unsplash.com/photo-1542211183455-2afe6f173cdd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=773&q=80',
      name: 'Gary',
      designation: 'Food Taster',
      index:3),







] ;