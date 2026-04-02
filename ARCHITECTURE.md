# Shop Nexus - Layered Architecture with Riverpod

## 📁 Folder Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── navigation/
│   │   └── app_router.dart
│   ├── network/
│   │   └── api_client.dart
│   └── utils/
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── auth_remote_datasource.dart     # API calls
│   │   │   ├── models/
│   │   │   │   ├── login_request.dart
│   │   │   │   ├── login_response.dart
│   │   │   │   └── user_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart             # Business logic
│   │   │
│   │   └── presentation/
│   │       ├── notifiers/
│   │       │   └── auth_notifier.dart               # State management logic
│   │       ├── providers/
│   │       │   └── auth_provider.dart               # Provider configuration
│   │       ├── screens/
│   │       │   ├── login_screen.dart
│   │       │   └── register_screen.dart
│   │       └── widgets/
│   │
│   ├── products/
│   │   ├── data/
│   │   ├── presentation/
│   │   │   ├── screens/
│   │   │   ├── notifiers/
│   │   │   ├── providers/
│   │   │   └── widgets/
│   │
│   ├── cart/
│   │   └── presentation/
│   │       ├── screens/
│   │       ├── notifiers/
│   │       ├── providers/
│   │       └── widgets/
│   │
│   └── profile/
│       └── presentation/
│           ├── screens/
│           ├── notifiers/
│           ├── providers/
│           └── widgets/
│
├── shared/
│   ├── providers/              # Shared providers
│   └── widgets/                # Reusable UI widgets
│
└── main.dart
```

## 🏗️ Architecture Layers

### 1. **Data Layer** (`data/`)

- **datasources**: Contains API calls and external data sources
- **models**: JSON serializable classes (DTOs)
- **repositories**: Implements business logic and acts as a bridge between data and presentation

### 2. **Presentation Layer** (`presentation/`)

- **notifiers**: Contains Riverpod StateNotifier and AsyncNotifier classes
- **providers**: Defines all provider configurations (dependencies)
- **screens**: Full-screen widgets
- **widgets**: Reusable UI components

### 3. **Core Layer** (`core/`)

- **constants**: App-wide constants
- **network**: HTTP client setup
- **navigation**: GoRouter configuration
- **utils**: Helper functions

### 4. **Shared Layer** (`shared/`)

- **providers**: Global providers used across features
- **widgets**: Reusable UI widgets across features

## 🧠 Riverpod Pattern

### Provider Configuration (auth_provider.dart)

```dart
// 1. Core dependencies
final apiClientProvider = Provider<ApiClient>(...);

// 2. Data layer providers
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(...);
final authRepositoryProvider = Provider<AuthRepository>(...);

// 3. Presentation providers
final authProvider = AsyncNotifierProvider<AuthNotifier, LoginResponse?>(...);
```

### Notifier Logic (auth_notifier.dart)

```dart
class AuthNotifier extends AsyncNotifier<LoginResponse?> {
  @override
  Future<LoginResponse?> build() async { ... }

  Future<void> login(String email, String password) async { ... }
}
```

## ✅ Best Practices

1. **Dependency Injection**: Providers manage all dependencies
2. **Separation of Concerns**: Data, business logic, and UI are separate
3. **Testability**: Each layer can be tested independently
4. **Reusability**: Shared components are in the `shared` folder
5. **Scalability**: Easy to add new features following the same pattern

## 🚀 Adding a New Feature

To add a new feature (e.g., `orders`):

1. Create `features/orders/{data,presentation}` folders
2. In `data/`: Create datasources, models, repositories
3. In `presentation/`: Create notifiers, providers, screens, widgets
4. In `presentation/providers/`: Export all providers
5. Import providers in screens and use `ref.watch()`

Example:

```dart
// lib/features/orders/presentation/providers/orders_provider.dart
final ordersProvider = AsyncNotifierProvider<OrdersNotifier, List<Order>>(...);

// lib/features/orders/presentation/screens/orders_screen.dart
class OrdersScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(ordersProvider);
    return ordersAsync.when(
      data: (orders) => ListView(...),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
```

## 📦 Provider Dependencies

```
Screens/Widgets
    ↓ (watch/read)
Providers (auth_provider.dart)
    ↓ (depends on)
Notifiers (auth_notifier.dart)
    ↓ (depends on)
Repositories (auth_repository.dart)
    ↓ (depends on)
DataSources (auth_remote_datasource.dart)
    ↓ (uses)
API Client (core/network/api_client.dart)
```
