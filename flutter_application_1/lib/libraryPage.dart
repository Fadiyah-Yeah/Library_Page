import 'package:flutter/material.dart';
import 'bookModels.dart';
import 'details.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8E7),
        elevation: 0,
        title: const Text(
          'My Library',
          style: TextStyle(
            color: Color(0xFF5B4742),
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: bookList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  final BookModel book = bookList[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(book: book),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF95BBEA).withValues(alpha: 0.18),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF5B4742).withValues(alpha: 0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Image.network(
                                  book.imageUrl,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: const Color(0xFF95BBEA)
                                          .withValues(alpha: 0.2),
                                      child: const Center(
                                        child: Icon(
                                          Icons.menu_book_rounded,
                                          size: 45,
                                          color: Color(0xFF8BAEDB),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 9),

                            Text(
                              book.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF5B4742),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              book.author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF9A8880),
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 7),

                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFF930500),
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  book.rating.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF6B5953),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  book.year.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF9A8880),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
