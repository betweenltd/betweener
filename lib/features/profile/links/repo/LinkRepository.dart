import '../../../../core/util/api_base_helper.dart';
import '../../../../models/link_model.dart';

class LinkRepository {
  final String _apiKey = "Paste your api key here";

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Link>?> fetchLinkList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return LinkResponse.fromJson(response).results;
  }
}
