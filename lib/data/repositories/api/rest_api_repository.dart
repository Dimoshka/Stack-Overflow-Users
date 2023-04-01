import 'package:injectable/injectable.dart';

import '../../../domain/repositories/repositories.dart';

@LazySingleton(as: ApiRepository)
class RestApiRepository implements ApiRepository {}
