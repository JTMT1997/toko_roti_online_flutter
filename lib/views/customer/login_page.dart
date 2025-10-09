import 'package:flutter/material.dart';
import 'package:toko_roti_online/models/user_model.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _paswordNameController = TextEditingController();
  String? _ErrorText;

  void _login(){
    String username = _userNameController.text.trim();
    String password = _paswordNameController.text.trim();
    if (username.isEmpty || password.isEmpty) {
      setState(() =>_ErrorText="Isi Username dan Password");
      return;
    }
UserModel?user;
if (username == 'admin' && password =='1234') {
  user = UserModel(username: username, role: 'admin');
}else if (username =='kurir' &&  password =='courier'){
user = UserModel(username: username, role: 'courier');
}else{
  user = UserModel(username: username, role: 'customer');
}

switch(user.role){
  case 'admin':
  Navigator.pushReplacementNamed(context, AppRoutes.adminDashboard);
  break;
  case 'courier':
  Navigator.pushReplacementNamed(context, AppRoutes.coureirDashboard);
  break;
  default:
  Navigator.pushReplacementNamed(context, AppRoutes.products);
}


  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text("Form Login"),),
        body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "email"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Password"),
              // obscureText: true,
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context,AppRoutes.productList);
            }, child: Icon(Icons.login, color: Colors.blue, ),),
            TextButton(onPressed: (){}, child: const Text("Belum memiliki akun ?"))
          ],
        ), ),

    );
  }
}