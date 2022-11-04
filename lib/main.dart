import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => const DetailScreen(),
            ),
            GoRoute(
              path: 'modal',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: ModalScreen(),
              ),
            )
          ],
        ),
      ],
    );
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/detail'),
                child: const CenteredText('go /detail'),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () => context.push('/detail'),
                child: const CenteredText('push /detail'),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () => context.go('/modal'),
                child: const CenteredText('go /modal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/modal'),
                child: const CenteredText('go /modal'),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () => context.push('/modal'),
                child: const CenteredText('push /modal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalScreen extends StatelessWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Page'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class CenteredText extends StatelessWidget {
  const CenteredText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30),
      textAlign: TextAlign.center,
    );
  }
}
