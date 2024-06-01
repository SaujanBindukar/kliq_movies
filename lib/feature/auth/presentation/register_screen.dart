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
class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(authControllerProvider, (prev, next) {
      if (next is BaseError) {
        context.showFlushBar(message: next.failure.reason);
      }
      if (next is BaseSuccess) {
        context.router
            .pushAndPopUntil(
          const DashboardRoute(),
          predicate: (_) => true,
        )
            .then((value) {
          context.showFlushBar(message: 'Register Success');
          ref.read(bottomNavProvider.notifier).changeIndex(index: 0);
        });
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogoWidget(),
                Text(
                  'Sign up to your\nAccount',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text(
                  'Please enter your details',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  validator: Validators.requiredFieldValidators,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  validator: Validators.emailValidator,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: Validators.passwordValidators,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) {
                    final authState = ref.watch(authControllerProvider);
                    return CustomButton(
                      padding: EdgeInsets.zero,
                      isLoading: authState is BaseLoading,
                      name: 'Sign Up',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        ref.read(authControllerProvider.notifier).signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                const _SignInNavigationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInNavigationWidget extends ConsumerWidget {
  const _SignInNavigationWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
