# lumide_go

[![pub package](https://img.shields.io/pub/v/lumide_go.svg)](https://pub.dev/packages/lumide_go) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Powered by SoFluffy](https://img.shields.io/badge/Powered%20by-SoFluffy-orange)](https://sofluffy.io)

The official Go extension for [Lumide IDE](https://lumide.dev).

`lumide_go` brings robust Go language support to Lumide using the `gopls` language server.

## Features

### 🛠 Language Support
- **IntelliSense**: Accurate code completions, signature help, and documentation hovers.
- **Diagnostics**: Real-time error reporting and linting.
- **Navigation**: Instant go-to-definition, find references, and symbol search.
- **Refactoring**: High-quality code transformations via `gopls`.

### ⚡ Performance
- **Optimized**: Fast startup and low memory footprint.
- **Concurrent**: Runs analysis in the background without blocking the editor.

## Commands

Access these via the Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`):

| Command ID | Title | Description |
|---|---|---|
| `lumide_go.restartLsp` | **Go: Restart Language Server** | Restart the `gopls` process |

## Requirements

- **Go**: The Go programming language must be installed.
- **Gopls**: The official Go language server.
    - **Installation**: `go install golang.org/x/tools/gopls@latest`
    - Ensure your `GOBIN` (usually `~/go/bin`) is in your system `PATH`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ by [SoFluffy](https://sofluffy.io).

## Happy Coding 🦊
