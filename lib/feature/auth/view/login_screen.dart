import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_bloc.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_event.dart';
import 'package:lightweight_electrum/feature/auth/bloc/login_state.dart';
import 'package:lightweight_electrum/theme/app_text_styles.dart';
import 'package:lightweight_electrum/widget/app_button.dart';
import 'package:lightweight_electrum/widget/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginInitial()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Electrum')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: AppTextStyles.heading1),
              SizedBox(height: 16),
              Text(
                'Log in to your account to continue with Lightweight Electrum.',
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

  Widget _buildCardAccount(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Navigate to home screen using go_router
              context.go('/home');
            }
          },
          builder: (context, state) {
            // Extract error messages and form validity from state
            String? emailError;
            String? passwordError;
            bool isFormValid = false;

            if (state is LoginValidState) {
              emailError = state.emailError;
              passwordError = state.passwordError;
              isFormValid = state.isFormValid;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  errorText: emailError,
                  title: 'Email Address',
                  hintText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(
                      LoginInputEmail(email: value),
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
                    context.read<LoginBloc>().add(
                      LoginInputPassword(password: value),
                    );
                  },
                ),
                SizedBox(height: 24),
                AppButton(
                  isLoading: state is LoginLoading,
                  onPressed: isFormValid
                      ? () {
                          final bloc = context.read<LoginBloc>();
                          bloc.add(
                            LoginButtonPressed(
                              email: bloc.emailValue,
                              password: bloc.passwordValue,
                            ),
                          );
                        }
                      : null,
                  label: 'Log in',
                ),
                SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () => context.push('/register'),
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
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
}
