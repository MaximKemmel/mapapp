import 'package:get_it/get_it.dart';
import 'package:mapapp/domain/services/api_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
