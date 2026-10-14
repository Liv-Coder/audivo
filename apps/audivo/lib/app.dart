import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:storage/storage.dart';

import 'router/app_routes.dart';

/// Root application widget. Wires services and the GoRouter config.
class Audivo extends StatefulWidget {
  const Audivo({
    required this.logger,
    required this.dioClient,
    required this.storage,
    this.theme,
    this.darkTheme,
    super.key,
  });

  final AppLogger logger;
  final DioClient dioClient;
  final HiveStorageService storage;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  @override
  State<Audivo> createState() => _AudivoState();
}

class _AudivoState extends State<Audivo> {
  late final _router = buildRouter(
    logger: widget.logger,
    dioClient: widget.dioClient,
    storage: widget.storage,
  );

  @override
  Widget build(BuildContext context) {
    final lightTheme = widget.theme ?? AppTheme.light();
    final darkTheme =
        widget.darkTheme ?? (widget.theme != null ? null : AppTheme.dark());
    return MaterialApp.router(
      title: 'Audivo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: _router,
    );
  }
}
