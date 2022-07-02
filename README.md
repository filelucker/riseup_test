==================== Basic Tasks ====================
API Documentation: https://docs.mail.tm/
Demo API: https://api.mail.tm/
* Query The Domain List [ /domains ]
  sampledomain.com
* Create an Account [ /accounts ]
  someone@sampledomain.com
* Login [ /token ]
  Get JWT Token [ Bearer ]
* Send an E-Mail to the created account [ from your e-mail ]
  you@gmail.com; someone@sampledomain.com
* Check inbox [ /messages ]
  New mail from: you@gmail.com

Libraries in use:
get: ^4.6.5    // State manager, Navigation manager, Dependency manager 
dio: ^4.0.0    // A powerful Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.
flutter_dotenv: ^5.0.2   // Easily configure any flutter application with global variables using a `.env` file.
get_it: ^7.2.0  // Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App
injectable: ^1.5.3     // Injectable is a convenient code generator for get_it. Inspired by Angular DI, Guice DI and inject.dart.
connectivity: ^3.0.6    // This plugin allows Flutter apps to discover network connectivity and configure themselves accordingly. It can distinguish between cellular vs WiFi connection.
shared_preferences: ^2.0.6   //Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.


