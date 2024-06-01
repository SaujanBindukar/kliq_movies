import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/core/extensions/context_extension.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/utils/validators.dart';
import 'package:kliq_movies/core/widgets/custom_button.dart';
import 'package:kliq_movies/core/widgets/custom_textfield.dart';
import 'package:kliq_movies/feature/auth/application/auth_controller.dart';
import 'package:kliq_movies/feature/auth/presentation/app_logo_widget.dart';
import 'package:kliq_movies/feature/dashboard/bottom_nav_provider.dart';

@RoutePage()
class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen(authControllerProvider, (prev, next) {
      if (next is BaseError) {
        context.showFlushBar(message: next.failure.reason);
      }
      if (next is BaseSuccess) {
        Navigator.of(context).pop();
        ref.read(bottomNavProvider.notifier).changeIndex(index: 0);
        context.showFlushBar(message: 'Login Success');
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogoWidget(),
                Text(
                  "Sign in to your\nAccount",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your details',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: Validators.emailValidator,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  validator: Validators.passwordValidators,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) {
                    final authState = ref.watch(authControllerProvider);
                    return CustomButton(
                      padding: EdgeInsets.zero,
                      isLoading: authState is BaseLoading,
                      name: 'Login',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        ref
                            .read(authControllerProvider.notifier)
                            .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                const _SingupNavigationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SingupNavigationWidget extends ConsumerWidget {
  const _SingupNavigationWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        InkWell(
          onTap: () {
            context.router.push(const RegisterRoute());
          },
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
      ],
    );
  }
}
