import 'dart:async';
import 'package:chopper/chopper.dart';

part 'user_list.chopper.dart';

void main() async {
  final chopper = ChopperClient(
    baseUrl: 'https://api.github.com/',
    services: [UserService.create()],
  );

  final chopperReq = chopper.getService<UserService>();
  final response = await chopperReq.getUserList();

  if (response.isSuccessful) {
    final body = response.body;
  } else {
    final code = response.statusCode;
  }
}

@ChopperApi(baseUrl: 'users')
abstract class UserService extends ChopperService {
  @Get()
  Future<Response> getUserList();

  static UserService create([ChopperClient client]) =>
      _$UserService(client);
}
