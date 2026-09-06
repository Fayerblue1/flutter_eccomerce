import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/components/chat_item.dart';
import 'package:flutter_eccomerce/models/chat_model.dart';
import 'package:flutter_eccomerce/pages/chat_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<ChatConversation> _conversations;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _conversations = List.from(initialConversations);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ChatConversation> _getFilteredConversations() {
    if (_searchQuery.isEmpty) return _conversations;
    return _conversations.where((conv) {
      final nameMatches =
          conv.sellerName.toLowerCase().contains(_searchQuery.toLowerCase());
      final messageMatches =
          conv.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase());
      return nameMatches || messageMatches;
    }).toList();
  }

  void _openChatDetail(ChatConversation conversation) {
    // Mark as read
    setState(() {
      final index = _conversations.indexWhere((c) => c.id == conversation.id);
      if (index != -1) {
        _conversations[index] =
            _conversations[index].copyWith(unreadCount: 0);
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailPage(conversation: conversation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredConversations = _getFilteredConversations();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Chat',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF212121),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Color(0xFF424242),
            ),
            tooltip: 'Pengaturan Chat',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Pengaturan Chat',
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Field
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 14.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3F5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                textAlignVertical: TextAlignVertical.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF212121),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Cari pesan',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade400,
                    fontSize: 13.0,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 19,
                    color: Colors.grey,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 16),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),

          const Divider(height: 1, thickness: 0.8, color: Color(0xFFEEEEEE)),

          // Section Title: "Chat dengan Penjual"
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chat dengan Penjual',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '${filteredConversations.length} Toko',
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),

          // Conversations List
          Expanded(
            child: filteredConversations.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    itemCount: filteredConversations.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      indent: 76,
                      color: Color(0xFFF1F1F1),
                    ),
                    itemBuilder: (context, index) {
                      final conv = filteredConversations[index];
                      return ChatItem(
                        conversation: conv,
                        onTap: () => _openChatDetail(conv),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 48,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tidak Ada Pesan',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _searchQuery.isEmpty
                  ? 'Belum ada obrolan dengan penjual.'
                  : 'Tidak ditemukan pesan dengan kata kunci "$_searchQuery".',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12.5,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
