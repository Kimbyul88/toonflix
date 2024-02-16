import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today'); //링크 주소
    final response = await http.get(url); // url 링크의 서버로부터 응답을 받을때까지 await 한다.
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
