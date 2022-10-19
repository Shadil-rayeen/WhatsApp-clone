import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constant/color_constant.dart';
import 'package:whatsapp_clone/constant/info.dart';
import 'package:whatsapp_clone/widget/my_message_card.dart';
import 'package:whatsapp_clone/widget/sender_message.dart';

class ChatList extends StatelessWidget {
  ChatList({
    Key? key,
    required this.name,
    required this.profilePic,
  }) : super(key: key);
  final String name;
  final String profilePic;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: _bottomInputField(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: appBarColor,
        title: Text(name),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(profilePic),
          ),
        ),
        actions: [
          _actionIconButton(icon: Icons.video_camera_front),
          _actionIconButton(icon: Icons.call),
          _actionIconButton(icon: Icons.more_vert_outlined),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (messages[index]['isMe'] == true) {
            return MyMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString(),
            );
          }
          return SenderMessageCard(
            message: messages[index]['text'].toString(),
            date: messages[index]['time'].toString(),
          );
        },
      ),
    );
  }

  Widget _bottomInputField() {
    return Container(
      width: double.infinity,
      height: 60,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _messageController,
              onChanged: (value) {},
              decoration: InputDecoration(
                  hintText: "Type a Message",
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.yellowAccent,
                    ),
                    onPressed: () {},
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          elevation: 8,
                          padding: const EdgeInsets.all(0),
                        ),
                        icon: const Icon(
                          Icons.attachment_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      if (_messageController.text.isEmpty)
                        Row(
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                elevation: 8,
                                padding: const EdgeInsets.all(0),
                              ),
                              icon: const Icon(
                                Icons.currency_rupee,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                elevation: 8,
                                padding: const EdgeInsets.all(0),
                              ),
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                    ],
                  ),
                  enabled: true,
                  contentPadding: const EdgeInsets.all(7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.grey)),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.grey)),
                  fillColor: Colors.transparent),
              minLines: 1,
              maxLines: 100,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 23,
            backgroundColor: messageColor.withOpacity(0.9),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _actionIconButton({required IconData icon, VoidCallback? onPressed}) {
    return IconButton(
      icon: Icon(icon, color: Colors.grey),
      onPressed: onPressed,
    );
  }
}
