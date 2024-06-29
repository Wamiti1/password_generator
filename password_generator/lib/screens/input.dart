import 'package:flutter/material.dart';
import 'package:password_generator/screens/results.dart';
import 'package:password_strength_checker/password_strength_checker.dart';


class Input extends StatefulWidget {
  const Input({super.key});
  

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final formKey = GlobalKey<FormState>();
  var passwordLength = TextEditingController();
  var minUpper = TextEditingController();
  var maxUpper = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Input your password details'),),
        ),

        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              
              children: [
                  

                  

              Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the password length',
                  prefixIcon: Icon(Icons.input_outlined),
                ),
                keyboardType: TextInputType.number,
                controller: passwordLength,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  else{ 
                    try {
                    int.tryParse(value);
                    return null; 
                  } catch (e) {
                    return 'Please enter a whole number';
                  }}
                  
                 
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the number of characters supposed to be lowercase',
                  prefixIcon: Icon(Icons.input_outlined),
                ),
                keyboardType: TextInputType.number,
                controller: minUpper,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  
                  else{
                    try {
                    int.tryParse(value);
                    return null; 
                  } catch (e) {
                    return 'Please enter a whole number';
                  }}
                  
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the number of characters supposed to be upper case',
                  prefixIcon: Icon(Icons.input_outlined),
                ),
                keyboardType: TextInputType.number,
                controller: maxUpper,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  
                  else{
                    try {
                    int.tryParse(value);
                    return null; 
                  } catch (e) {
                    return 'Please enter a whole number';
                  }}
                  
                },
              ),
            ),


              MaterialButton(onPressed: (){
                var isValid = formKey.currentState!.validate();
                if(isValid){
                  int? length = int.tryParse(passwordLength.text);
                  int? min = int.tryParse(minUpper.text);
                  int? upper = int.tryParse(maxUpper.text);
                  

                  try{
                    final config = PasswordGeneratorConfiguration(
                                        length: length!,
                                        minUppercase: min!,
                                        minLowercase: upper!,                        // ...
                                     );
              
                                    final passwordGenerator = PasswordGenerator.fromConfig(
                                      configuration: config,
                                    );
              
                        final password = passwordGenerator.generate();
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> Results(passwordGenerated: password,)));}
                    
                    catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Try again.')));
                  }
                  
                  
              
                  
                }
              
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill out all the fields correctly')));
                }
              
              },
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Generate your password', style: TextStyle(color: Colors.white, fontSize: 25),),
                ), ),

              ],
            ))





    ));
  }
}