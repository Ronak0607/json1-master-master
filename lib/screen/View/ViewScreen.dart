import 'package:flutter/material.dart';
import 'package:json/screen/userProvider/UserProvider.dart';
import 'package:provider/provider.dart';

class screenView extends StatefulWidget {
  const screenView({Key? key}) : super(key: key);

  @override
  State<screenView> createState() => _screenViewState();
}

class _screenViewState extends State<screenView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserData();
  }

  UserProvider? userProvidertrue;
  UserProvider? userProviderfalse;

  @override
  Widget build(BuildContext context) {
    userProvidertrue = Provider.of<UserProvider>(context, listen: false);
    userProviderfalse = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Product", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFBBBBBB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("SORT", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("|",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFBBBBBB))),
                  Text("FILTER", style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: userProvidertrue!.finalList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: (20 / 28)),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 200,
                                width: 200,
                                color: Colors.white,
                                child: Image.network(
                                    "${userProvidertrue!.finalList[index].image}"),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${userProvidertrue!.finalList[index].price}  \u{20B9}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 55,
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${userProvidertrue!.finalList[index].title}}",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFF6B6B6B)),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
