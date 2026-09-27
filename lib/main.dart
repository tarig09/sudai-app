import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const SudAIApp());
}

class SudAIApp extends StatelessWidget {
  const SudAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SUDAI',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFFF8A00),
        useMaterial3: true,
      ),
      home: const SudAIWebView(),
    );
  }
}

class SudAIWebView extends StatefulWidget {
  const SudAIWebView({super.key});

  @override
  State<SudAIWebView> createState() => _SudAIWebViewState();
}

class _SudAIWebViewState extends State<SudAIWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            debugPrint(error.description);
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://tarig09.github.io/sudai-app/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
