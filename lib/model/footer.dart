class Footer {
  String title;
  List<String> parameteres;

  Footer({required this.title, required this.parameteres});
}

List<Footer> footer = [
  Footer(title: 'Company', parameteres: [
    'About',
    'Press',
    'Blog',
    'Careers',
    'Security',
    'Drive Center'
  ]),

  Footer(title: 'Information', parameteres: [
    'Our Story',
    'Recipes',
    'Nutrition',
    'Resources',
    'Newsletter',
    'Contact'
  ]),
  Footer(title: 'Services', parameteres: [
    'Customer Service',
    'Recommend a resturant',
    'Signup a resturant',
    'jobs',
    'Security',
    'Drive Center'
  ]),

];
