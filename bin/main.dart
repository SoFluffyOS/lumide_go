/// Go language support plugin for Lumide IDE.
///
/// Registers gopls as the language server for Go files.
library;

import 'package:lumide_api/lumide_api.dart';

void main() => GoPlugin().run();

class GoPlugin extends LumidePlugin {
  static const _logPrefix = '🐹';
  static const _defaultLspCommand = 'gopls';
  static const _pluginId = 'go-lsp';
  static const _languageId = 'go';
  static const _fileExtensions = ['.go'];
  static const _restartCommandId = 'lumide_go.restartLsp';
  static const _pluginName = 'Go';

  String _lspCommand = _defaultLspCommand;

  @override
  Future<void> onActivate(LumideContext context) async {
    log('$_logPrefix $_pluginName plugin activated');

    final customPath = await context.workspace.getConfiguration('$_pluginId.path') as String?;
    if (customPath != null && customPath.trim().isNotEmpty) {
      _lspCommand = customPath.trim();
    }

    try {
      final res = await context.shell.run(_lspCommand, ['version']);
      if (res.exitCode != 0) throw Exception('Non-zero exit code');
    } catch (e) {
      await context.window.showMessage(
        '$_lspCommand is not installed. Please install it to enable $_pluginName language support.\n\n'
        'Run: go install golang.org/x/tools/gopls@latest',
        title: _pluginName,
        type: MessageType.warning,
      );
      log('$_logPrefix $_lspCommand not found, aborting');
      return;
    }

    await context.languages.registerLanguageServer(
      id: _pluginId,
      languageId: _languageId,
      fileExtensions: _fileExtensions,
      command: _lspCommand,
    );

    await context.commands.registerCommand(
      id: _restartCommandId,
      title: '$_pluginName: Restart Language Server',
      category: _pluginName,
      callback: ([args]) async {
        await context.languages.registerLanguageServer(
          id: _pluginId,
          languageId: _languageId,
          fileExtensions: _fileExtensions,
          command: _lspCommand,
        );
        await context.window.showMessage(
          '$_pluginName language server restarted',
          title: _pluginName,
        );
      },
    );

    log('$_logPrefix $_lspCommand registered for $_languageId files');
  }

  @override
  Future<void> onDeactivate() async {
    log('$_logPrefix $_pluginName plugin deactivated');
  }
}
