import 'package:http/http.dart';

void main() async {
  final result = await get(
    Uri.parse("https://viacep.com.br/ws/01001000/json/"),
  );
  print(result.body);
}
