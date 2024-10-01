import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smoke_poc/login/services/auth_service_impl.dart';
import 'package:smoke_poc/main.dart';
import 'package:get_it/get_it.dart';
import 'package:smoke_poc/login/repositories/auth_repository.dart';
import 'package:smoke_poc/login/services/auth_service.dart';

// Mock para AuthRepository
class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> login(String email, String password) async {
    // Simula un inicio de sesión exitoso si las credenciales son correctas
    if (email == 'usuario_test' && password == 'contraseña_test') {
      return true;
    }
    return false;
  }
}

void main() {
  // Configurar GetIt para usar el mock de AuthRepository
  setUp(() {
    GetIt.I.reset(); // Resetear GetIt antes de cada prueba
    GetIt.I.registerSingleton<AuthRepository>(MockAuthRepository());
    GetIt.I.registerFactory<AuthService>(() => AuthServiceImpl(GetIt.I<AuthRepository>()));
  });

  testWidgets('Prueba de humo automatizada: inicio de sesión con widgets personalizados', (WidgetTester tester) async {
    // Cargar la app con LoginScreen que usa los widgets personalizados
    await tester.pumpWidget(const MyApp());

    // Verifica que la pantalla de inicio de sesión está presente
    expect(find.text('Iniciar sesión'), findsOneWidget);

    // Introduce un nombre de usuario y contraseña en los widgets personalizados
    await tester.enterText(find.byKey(const Key('username')), 'usuario_test');
    await tester.enterText(find.byKey(const Key('password')), 'contraseña_test');

    // Presiona el botón de iniciar sesión
    await tester.tap(find.text('Iniciar sesión'));
    
    // Espera a que los cambios se completen (simula la espera de la autenticación)
    await tester.pumpAndSettle();

    // Verifica que la pantalla principal aparece después de iniciar sesión
    expect(find.text('Smoking Test'), findsOneWidget);
  });

  testWidgets('Prueba de humo: credenciales incorrectas', (WidgetTester tester) async {
    // Cargar la app con LoginScreen que usa los widgets personalizados
    await tester.pumpWidget(const MyApp());

    // Introduce credenciales incorrectas
    await tester.enterText(find.byKey(const Key('username')), 'usuario_incorrecto');
    await tester.enterText(find.byKey(const Key('password')), 'contraseña_incorrecta');

    // Presiona el botón de iniciar sesión
    await tester.tap(find.text('Iniciar sesión'));

    // Espera a que los cambios se completen
    await tester.pumpAndSettle();

    // Verifica que el mensaje de error aparece
    expect(find.text('Credenciales incorrectas'), findsOneWidget);
  });

}
