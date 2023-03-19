import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Actor'),
        actions: [IconButton(icon: Icon(Icons.attach_file), onPressed: () {})],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // use the number of messages or stream's length
              itemBuilder: (context, index) {
                return buildMessageWidget(/* message data here */);
              },
            ),
          ),
          buildMessageInputArea(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to create a new conversation
        },
        child: Icon(Icons.chat),
      ),
      drawer: buildConversationsDrawer(),
    );
  }

  Widget buildMessageWidget(/* message data */) {
    // customize this widget based on the message data
    return ListTile(
      title: Text('Message Text'),
      subtitle: Text('Sender Name - Timestamp'),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget buildMessageInputArea() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Type your message...'),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildConversationsDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text('Conversations')),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // use the number of conversations or stream's length
              itemBuilder: (context, index) {
                return buildConversationListItem(/* conversation data here */);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConversationListItem(/* conversation data */) {
    // customize this widget based on the conversation data
    return ListTile(
      title: Text('Conversation Title'),
      subtitle: Text('Last Message'),
      onTap: () {
        // Implement logic to switch to the selected conversation
      },
    );
  }
}

