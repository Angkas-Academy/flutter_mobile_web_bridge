import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_communication/models/payment_param.dart';
import 'package:webview_communication/models/payment_result.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  static const String _baseUrl = 'https://flutter-jsbridge.web.app/#/';
  static const String _receiverName = 'channelPay';
  static const String _senderName = 'eventUser';

  static final WebViewController _controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter WebView Communication')),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'This is a sample implementation of mobile communicating to a webview'),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: WebViewWidget(
                  controller: _controller
                    ..loadRequest(Uri.parse(_baseUrl))
                    ..addJavaScriptChannel(_receiverName,
                        onMessageReceived: (message) {
                      final decoded = json.decode(message.message);
                      final paymentParam = PaymentParam.fromJson(decoded);

                      final snackBar = SnackBar(
                        content: Text(
                            'Amount submitted from mini app: ${paymentParam.amount}'),
                        backgroundColor: (Colors.black),
                        action: SnackBarAction(
                          label: 'dismiss',
                          onPressed: () {},
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    })
                    ..setJavaScriptMode(JavaScriptMode.unrestricted),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                PaymentResult paymentResult =
                    PaymentResult(transactionId: const Uuid().v4(), fee: 20);
                _controller.runJavaScript(
                    "window.dispatchEvent(new CustomEvent('$_senderName', {detail: '${json.encode(paymentResult)}'}))");
              },
              child: const Text('Trigger payment success'),
            )
          ],
        ),
      ),
    );
  }
}
