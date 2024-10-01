# smoke_poc

***Ejemplo prueba de humo por Gabriel Aillapán***

Este proyecto consisten en la implementación de pruebas de humo con la herramienta Flutter. Presenta las tres posibilidades para realizar pruebas de humo (manual, automáticas y también hibridas).
Estas pruebas de alto nivel tiene como propósito comprobar el funcionamiento de las partes del software, especialmente cuando se agrega una nueva porción de código al proyecto, se utiliza integración continua o para validar las entregas al cliente.

¿Cómo se realizan las pruebas de humo?  
1. Identificar las funciones críticas del sistema. En este la funcionalidad a probar sería el inicio de sesión.
2. Preparar los datos necesarios:
3. Ejecutar las pruebas  para las funcionalidades críticas, siguiendo una serie pasos predefinidos.
4. Reportar resultados.
5. Toma de decisiones   


¿Para realizar pruebas de humo en Flutter, es necesario instalar una dependencia o biblioteca externa? No, Flutter ya viene con herramientas para hacer las pruebas de humo.




**Importante: Para probar la nueva porcion de codigo, seguir las intrucciones del TXT en el proyecto.**  
**¿La nueva funcionalidad interactúa correctamente con otras partes del sistema sin causar fallos?**
# 1. Pruebas de humo manuales

**Objetivo**: Asegurarse de que las funcionalidades básicas de la aplicación (inicio de sesión, navegación) funcionan como se espera de manera manual.

### Pasos:

1. **Preparar el entorno**:
    - Asegúrate de tener la aplicación Flutter corriendo en un dispositivo físico o emulador.
    - La pantalla de inicio de sesión debe ser accesible.

2. **Realizar el flujo de prueba manual**:
    - **Paso 1**: Abre la aplicación y navega a la pantalla de inicio de sesión.
    - **Paso 2**: Introduce un nombre de usuario válido y una contraseña válida (por ejemplo, `psoftware@ufronteracl` y `hola123`).
    - **Paso 3**: Presiona el botón "Iniciar sesión".
    - **Paso 4**: Verifica si la aplicación te redirige correctamente a la pantalla principal (deberías ver el texto "Smoking Test").

3. **Probar con credenciales incorrectas**:
    - **Paso 1**: Repite los pasos anteriores, pero introduce credenciales incorrectas (por ejemplo, `usuario_incorrecto` y `contraseña_incorrecta`).
    - **Paso 2**: Verifica que la aplicación muestra un mensaje de error como "Credenciales incorrectas".

4. **Anotar los resultados**:
    - Si todo funciona como se espera, la prueba manual ha sido exitosa. Si no, anota los problemas encontrados.

---

# 2. Pruebas de humo automatizadas

**Objetivo**: Usar código automatizado para verificar que las funcionalidades básicas de la aplicación funcionan correctamente.

### Pasos:

1. **Configurar el entorno de pruebas**:
    - Instala Flutter y las dependencias necesarias.
    - Asegúrate de que el archivo de prueba (`test/widget_test.dart` o un archivo similar) esté configurado con el código adecuado (como el ejemplo que has proporcionado).

2. **Escribir el código de prueba**:
    - Usa el código del ejemplo para automatizar el inicio de sesión y la verificación de las pantallas principales y los mensajes de error.

3. **Ejecutar las pruebas automatizadas**:
    - En la terminal, ejecuta el comando para correr las pruebas:

      ```bash
      flutter test
      ```

    - Revisa los resultados. Si todas las pruebas pasan, las funcionalidades básicas están funcionando correctamente. Si alguna falla, revisa los errores.

4. **Interpretar los resultados**:
    - Si alguna prueba falla, revisa los mensajes de error y ajusta el código de la aplicación o los tests si es necesario.

---

# 3. Pruebas de humo híbridas

**Objetivo**: Combinar pruebas manuales con automatizadas para verificar el correcto funcionamiento de la aplicación, especialmente cuando no se puede automatizar todo el flujo.

### Pasos:

1. **Identificar qué partes se automatizan y cuáles son manuales**:
    - A veces, las pruebas automatizadas no pueden cubrir todos los escenarios, como ciertas interacciones de UI complejas o validaciones en tiempo real. Identifica esas áreas.

2. **Automatizar las partes repetitivas**:
    - Usa pruebas automatizadas para los flujos simples y repetitivos, como el inicio de sesión y la navegación básica. Puedes usar el código de ejemplo que proporcionaste para cubrir estas áreas.

3. **Realizar pruebas manuales en las áreas no automatizadas**:
    - Para las partes que no pueden ser fácilmente cubiertas por las pruebas automáticas (como interacciones con APIs externas o pruebas en dispositivos físicos específicos), realiza las pruebas de manera manual.
    - Por ejemplo, si la UI tiene animaciones complejas o comportamiento específico en ciertos dispositivos, revisa esos aspectos de forma manual.

4. **Documentar el flujo de la prueba híbrida**:
    - Asegúrate de que tanto las pruebas automatizadas como manuales estén bien documentadas. Escribe qué partes están automatizadas y qué partes necesitan una revisión manual.


