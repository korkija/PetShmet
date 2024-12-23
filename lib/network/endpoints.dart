// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String url = 'https://api.themoviedb.org/3';
  static const String media_type = '/movie';
  static const String time_window_week = '/week';
  static const String time_window_day = '/day';
  static const String api_key = '2c407050ee1bd067f989b7e26c67ae72';
  static const String api_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzQwNzA1MGVlMWJkMDY3Zjk4OWI3ZTI2YzY3YWU3MiIsIm5iZiI6MTYzMjczNzA5MC4wMzQsInN1YiI6IjYxNTE5NzQyMDU4MjI0MDAyMmJjZmI5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EEh_rE8es8KAyxCOIhvFeD7A-zQCSKcYQIneBbXBo2Y';
  static const Duration connectTimeout = Duration(milliseconds: 5000);
  static const Duration receiveTimeout = Duration(milliseconds: 3000);
}
