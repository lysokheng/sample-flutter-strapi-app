import 'package:http/http.dart' as http;
import '../../core/constants/const.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?fields=name&populate=image'));

    return response;
  }
}
