import 'package:flutter/material.dart';
import 'package:whatsapp/chats.dart';
import 'package:whatsapp/userProfile.dart';

import 'chattingScreen.dart';
import 'feature/welcome/widgets/info.dart';

void main() {
  runApp(mainCallsScreen());
}

class mainCallsScreen extends StatefulWidget {
  @override
  State<mainCallsScreen> createState() => _mainCallsScreenState();
}

class _mainCallsScreenState extends State<mainCallsScreen> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

  late List<Map<String, String>> filteredContacts;

  bool showSearchBox = false;

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(info);
  }

  void searchContacts(String query) {
    setState(() {
      filteredContacts = info
          .where((contact) =>
          contact['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Whatsapp'),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      showSearchBox = !showSearchBox;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
                InkWell(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                  },
                  child: Icon(Icons.more_vert),
                ),
                Icon(Icons.camera_alt_outlined),
                SizedBox(
                  width: 20,
                ),
                // Icon(Icons.search),
                // SizedBox(
                //   width: 20,
                // ),
                // Icon(Icons.more_vert_outlined),
              ],
              toolbarHeight: 80,
              bottom: TabBar(
                tabs: myTabs,
              ),
            ),
            body: TabBarView(children: [
            Padding(
            padding: const EdgeInsets.only(top: 10),
              child: Column(
                children:[
                  Visibility(
                    visible: showSearchBox,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: searchContacts,
                        decoration: InputDecoration(
                          hintText: 'Search contacts',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                  child: ListView.builder(
                    itemCount: info.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(info[index]['name'].toString(),),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            info[index]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 230, 227, 227)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              info[index]['message'].toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              info[index]['profilePic'].toString(),
                            ),
                          ),
                          trailing: Text(
                            info[index]['time'].toString(),
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ),
                      );
                    },
                  ),
                ),]
              )),
              Center(
                child: Text('chats content'),
              ),
              Center(
                  child: ListView(children: <Widget>[
                    ListTile(
                      title: Text('Recent'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/kunal.png'),
                      ),
                      title: Text(
                        'Sanket Dhuri',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '5 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.phone_missed_outlined,
                            size: 10,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/vinit.png'),
                      ),
                      title: Text(
                        'Vinit Solanki',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            ' 20 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_received_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/bohra.png'),
                      ),
                      title: Text(
                        'Ayush Bohra',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(children: [
                        Text(
                          '12 September,12:15 pm',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Icon(
                          Icons.call_received_outlined,
                          size: 10,
                          color: Colors.white,
                        )
                      ]),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/me.png'),
                      ),
                      title: Text(
                        'Aditya Mhatre',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '1 August,10:43 am',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_made_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/kunal.png'),
                      ),
                      title: Text(
                        'Kunal Patil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '5 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.phone_missed_outlined,
                            size: 10,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/vinit.png'),
                      ),
                      title: Text(
                        'Vinit Solanki',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            ' 20 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_received_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/bohra.png'),
                      ),
                      title: Text(
                        'Ayush Bohra',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(children: [
                        Text(
                          '12 September,12:15 pm',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Icon(
                          Icons.call_received_outlined,
                          size: 10,
                          color: Colors.white,
                        )
                      ]),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/me.png'),
                      ),
                      title: Text(
                        'Aditya Mhatre',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '1 August,10:43 am',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_made_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/kunal.png'),
                      ),
                      title: Text(
                        'Kunal Patil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '5 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.phone_missed_outlined,
                            size: 10,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/vinit.png'),
                      ),
                      title: Text(
                        'Vinit Solanki',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            ' 20 minutes ago',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_received_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/bohra.png'),
                      ),
                      title: Text(
                        'Ayush Bohra',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(children: [
                        Text(
                          '12 September,12:15 pm',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Icon(
                          Icons.call_received_outlined,
                          size: 10,
                          color: Colors.white,
                        )
                      ]),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/me.png'),
                      ),
                      title: Text(
                        'Aditya Mhatre',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '1 August,10:43 am',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Icon(
                            Icons.call_made_outlined,
                            size: 10,
                            color: Colors.white,
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    )
                  ])),
            ]),
          ),
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results here
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions here
    return Center(
      child: Text('Search suggestions for: $query'),
    );
  }
}
