import 'package:path_provider/path_provider.dart';

Future<String> videosTempDir() =>
    getTemporaryDirectory().then((dir) => dir.path);
