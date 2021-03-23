import 'package:flutter/material.dart';

import 'home_page.dart';

class OlleyyPoint extends StatefulWidget {
  @override
  _OlleyyPointState createState() => _OlleyyPointState();
}

class _OlleyyPointState extends State<OlleyyPoint> with TickerProviderStateMixin {
  TabController tabController;
  int tabindex=0;
  bool checkBoxState=false;
  @override
  void initState() {
    tabController=new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olleyy Puan"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,

          child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height/7,
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(
                        "        Üye olup arkadaşlarını davet et,\n her arkadaşın için 10 lira Olley Puan kazan.",
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                ),
                Container(
                  width: MediaQuery.of(context).size.width,

                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        height: MediaQuery.of(context).size.height/10,
                        child: TabBar(
                          //labelPadding: EdgeInsets.symmetric(horizontal: size.width/700),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Color(0xFFD87C2E),
                          controller: tabController,
                          onTap: (index){
                            setState(() {
                              tabindex=index;
                            });
                          },
                          tabs: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: tabindex==3?Color(0XFFD87C2E):Colors.transparent,
                                child: Center(child: Text("Giriş Yap",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),))),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: tabindex==4?Color(0XFFD87C2E):Colors.transparent,
                              child: Center(child: Text("Kayıt Ol",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),)
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: tabController,
                            children: [
                              _girisYap(),
                              _KayitOl(),
                            ]
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
        )
      )
    );
  }

  Widget _girisYap(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/4,
      child: Column(
        children: [
          SizedBox(height: 15,),
          TextFormField(
            //Şifre alanlarını * olarak gösterir.
            obscureText: false,
            decoration:InputDecoration(
                hintText: "Telefon Numaranız",
                labelText: "Telefon Numaranız",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                prefixIcon: Icon(Icons.add_call)
            ),
            //Kaydedildiğinde text deki değeri değişkene aktar
            onSaved: (deger){},
          ),
          SizedBox(height: 15,),
          TextFormField(
            //Şifre alanlarını * olarak gösterir.
            obscureText: true,
            decoration:InputDecoration(
                hintText: "Şifreniz",
                labelText: "Parolanız",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                prefixIcon: Icon(Icons.lock)
            ),
            //Kaydedildiğinde text deki değeri değişkene aktar
            onSaved: (deger){},
          ),
          SizedBox(height: 15,),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/10,
            child: Row(
              children: [
                Container(
               
                   width: MediaQuery.of(context).size.width/5.5,
                    child: Center(
                      child: CheckboxListTile(
                        value: checkBoxState,
                        onChanged: (secildi){
                          setState(() {
                            checkBoxState=secildi;
                          });
                        },
                        activeColor: Colors.red,
                        //Ilk başta seçimi gelsin ?
                        selected: false,
                      ),
                    ),
                ),
                Text("Beni Hatırla"),
                SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text("Parolamı Unuttum",style: TextStyle(color: Colors.blueAccent),),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/4,
            height: MediaQuery.of(context).size.height/14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.indigo,
            ),

            child: Center(
              child: Text(
                "Giriş Yap",
                style: TextStyle(color: Colors.white),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _KayitOl(){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 15,),
            TextFormField(
              //Şifre alanlarını * olarak gösterir.
              obscureText: false,
              decoration:InputDecoration(
                hintText: "Adınız ve Soyadınız",
                labelText: "Adınız ve Soyadınız",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
              //Kaydedildiğinde text deki değeri değişkene aktar
              onSaved: (deger){},
            ),
            SizedBox(height: 15,),
            TextFormField(
              //Şifre alanlarını * olarak gösterir.
              obscureText: false,
              decoration:InputDecoration(
                hintText: "Cep telefonunuz",
                labelText: "Cep telefonunuz",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
              //Kaydedildiğinde text deki değeri değişkene aktar
              onSaved: (deger){},
            ),
            SizedBox(height: 15,),
            TextFormField(
              //Şifre alanlarını * olarak gösterir.
              obscureText: true,
              decoration:InputDecoration(
                hintText: "Bir parola belirleyin",
                labelText: "Bir parola belirleyin",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
              //Kaydedildiğinde text deki değeri değişkene aktar
              onSaved: (deger){},
            ),
            SizedBox(height: 15,),
            TextFormField(
              //Şifre alanlarını * olarak gösterir.
              obscureText: true,
              decoration:InputDecoration(
                hintText: "Parola tekrar",
                labelText: "Parola tekrar",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
              //Kaydedildiğinde text deki değeri değişkene aktar
              onSaved: (deger){},
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text("Referans Ekle",style: TextStyle(color: Colors.blueAccent),),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      value: checkBoxState,
                      onChanged: (secildi){
                        setState(() {
                          checkBoxState=secildi;
                        });
                      },
                      activeColor: Colors.red,
                      //Ilk başta seçimi gelsin ?
                      selected: false,
                    ),
                  ),
                  Text("Sözleşmeyi okudum ve kabul ediyorum"),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
            ),
                Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: MediaQuery.of(context).size.height/14,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigo,
                ),
                child: Center(
                child: Text(
                "Telefonuma Doğrulama SMS'i Gönder",
                style: TextStyle(color: Colors.white),),
                )
            )
          ],
        ),
      )
    );
  }
}
