import 'package:flutter/material.dart';
import 'bookModels.dart';

class DetailsPage extends StatelessWidget {
  final BookModel book;

  const DetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8E7),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5B4742)),
        ),
        title: Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF5B4742),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 165,
                height: 235,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5B4742).withValues(alpha: 0.15),
                      blurRadius: 14,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    book.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF95BBEA).withValues(alpha: 0.25),
                        child: const Icon(
                          Icons.menu_book_outlined,
                          size: 55,
                          color: Color(0xFF8BAEDB),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              book.title,
              style: const TextStyle(
                color: Color(0xFF5B4742),
                fontSize: 25,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              book.author,
              style: const TextStyle(color: Color(0xFF9A8880), fontSize: 15),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFF930500),
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  book.rating.toString(),
                  style: const TextStyle(
                    color: Color(0xFF5B4742),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB6AAA5),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  book.year.toString(),
                  style: const TextStyle(
                    color: Color(0xFF9A8880),
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Container(
              height: 1,
              color: const Color(0xFF95BBEA).withValues(alpha: 0.35),
            ),

            const SizedBox(height: 22),

            const Text(
              'About this book',
              style: TextStyle(
                color: Color(0xFF5B4742),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              book.description,
              style: const TextStyle(
                color: Color(0xFF6B5953),
                fontSize: 14,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(child: _buildDetail('Genre', book.genre)),
                const SizedBox(width: 12),
                Expanded(child: _buildDetail('Pages', '${book.pages}')),
              ],
            ),

            const SizedBox(height: 12),

            _buildDetail('Publisher', book.publisher),

            const SizedBox(height: 25),

            Row(
              children: [
                const Text(
                  'Rating',
                  style: TextStyle(
                    color: Color(0xFF5B4742),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < book.rating.round()
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      size: 20,
                      color: const Color(0xFF930500),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF95BBEA).withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF9A8880), fontSize: 11),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF5B4742),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
