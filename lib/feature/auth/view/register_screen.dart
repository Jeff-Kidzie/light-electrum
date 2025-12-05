import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_bloc.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/register_state.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(RegisterInitial()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Electrum')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create your account', style: AppTextStyles.heading1),
              SizedBox(height: 16),
              Text(
                'Set up your account to get started with Lightweight Electrum.',
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: 32),
              _buildCardAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardAccount(BuildContext context) => Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Navigate to home screen using go_router
            context.go('/home');
          } else if (state is RegisterFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Registration Failed'),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          // Extract error messages and form validity from state
          String? usernameError;
          String? emailError;
          String? passwordError;
          bool isFormValid = false;

          if (state is RegisterValidState) {
            usernameError = state.usernameError;
            emailError = state.emailError;
            passwordError = state.passwordError;
            isFormValid = state.isFormValid;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                errorText: usernameError,
                hintText: 'Enter your full name',
                title: 'Full name',
                prefixIcon: Icon(Icons.person),
                onChanged: (value) {
                  context.read<RegisterBloc>().add(
                    RegisterInputUsername(username: value),
                  );
                },
              ),
              SizedBox(height: 16),
              AppTextField(
                errorText: emailError,
                title: 'Email Address',
                hintText: 'Email Address',
                prefixIcon: Icon(Icons.email),
                onChanged: (value) {
                  context.read<RegisterBloc>().add(
                    RegisterInputEmail(email: value),
                  );
                },
              ),
              SizedBox(height: 16),
              AppTextField(
                errorText: passwordError,
                title: 'Password',
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                isPassword: true,
                onChanged: (value) {
                  context.read<RegisterBloc>().add(
                    RegisterInputPassword(password: value),
                  );
                },
              ),
              SizedBox(height: 24),
              AppButton(
                isLoading: state is RegisterLoading,
                onPressed: isFormValid
                    ? () {
                        final bloc = context.read<RegisterBloc>();
                        context.read<RegisterBloc>().add(
                          RegisterButtonPressed(
                            username: 'user',
                            email: bloc.emailValue,
                            password: bloc.passwordValue,
                          ),
                        );
                      }
                    : null,
                label: 'Create account',
              ),
              SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
