import 'package:bloc204/bloc_pattern/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAddScreen extends StatefulWidget {
  const PostAddScreen({super.key});

  @override
  State<PostAddScreen> createState() => _PostAddScreenState();
}

class _PostAddScreenState extends State<PostAddScreen> {

  TextEditingController userIdCon = TextEditingController();
  TextEditingController idCon = TextEditingController();
  TextEditingController titleCon = TextEditingController();
  TextEditingController bodyCon = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Post Add Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: userIdCon,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter User ID",
                  border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.green, width: 4), borderRadius: BorderRadius.circular(20))
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller:idCon,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter ID",
                    border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.green, width: 4), borderRadius: BorderRadius.circular(20))
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: titleCon,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.green, width: 4), borderRadius: BorderRadius.circular(20))
                ),
              ),
             const SizedBox(height: 10,),
              TextField(
                controller: bodyCon,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Body",
                    border: OutlineInputBorder(borderSide:const BorderSide(color: Colors.green, width: 4), borderRadius: BorderRadius.circular(20))
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                 if(userIdCon.text.isEmpty || idCon.text.isEmpty || titleCon.text.isEmpty || bodyCon.text.isEmpty){

                   ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content:Text("Fills All Field Required",style: TextStyle(color: Colors.white),) )
                   );

                 }else{
                   context.read<PostBloc>().add(InputPostEvent(userId: int.parse(userIdCon.text.toString().trim()), id: int.parse(idCon.text.toString().trim()), title: titleCon.text.toString().trim(), body: bodyCon.text.toString().trim(), context: context));
                 }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: BlocBuilder<PostBloc, PostState>(
                       builder: (context, state) {
                         if(state is PostInitialState){
                           return const Center(
                             child: CircularProgressIndicator(color: Colors.yellow,),
                           );
                         }else if(state is PostLoadedState){
                           return const Center(
                             child:  Text("Post Add"),
                           );
                         }else if(state is PostErrorState){
                           return const Center(
                             child: CircularProgressIndicator(color: Colors.red,),
                           );
                         }
                         return const Center(
                           child:  Text("Post Not"),
                         );

                     },
                    ),
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
