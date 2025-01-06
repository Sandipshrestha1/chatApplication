import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message Page",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Recent", style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact("sandip", context),
                _buildRecentContact("Sandy", context),
                _buildRecentContact("Hello", context),
                _buildRecentContact("Flutter", context),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  child: ListView(
            children: [
              _buildMessageTile(
                  "Sandy S", "Sandipshrestha2050@gmail.com", "08:30 am"),
              _buildMessageTile(
                  "Ram S", "Ramshrestha2050@gmail.com", "08:30 am"),
              _buildMessageTile(
                  "Harry S", "Harryshrestha2050@gmail.com", "08:30 am"),
              _buildMessageTile("Needdy S", "Nepali2050@gmail.com", "08:30 am"),
            ],
          )))
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          SizedBox(
            height: 5,
          ),
          Text(name, style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
