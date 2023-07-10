// ignore_for_file: avoid_unnecessary_containers

import 'package:book_app/apps/models/book_model.dart';
import 'package:book_app/apps/services/book_service.dart';
import 'package:flutter/material.dart';

class EbookScreen extends StatefulWidget {
  const EbookScreen({super.key});

  @override
  State<EbookScreen> createState() => _EbookScreenState();
}

class _EbookScreenState extends State<EbookScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  buildChip('Genres'),
                  buildChip('Top Selling'),
                  buildChip('New Releases'),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Recommended For You',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Based on your reading history',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const DataBook(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'New Releases',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const DataBook(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChip(String label) {
    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

class DataBook extends StatefulWidget {
  const DataBook({
    super.key,
  });

  @override
  State<DataBook> createState() => _DataBookState();
}

class _DataBookState extends State<DataBook> {
  List<BookModel> bookList = [];

  @override
  void initState() {
    super.initState();
    getBooksData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bookList.length,
        itemBuilder: (content, index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: const Offset(2, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  bookList[index].images![0].toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            bookList[index].title.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${bookList[index].price.toString()}',
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getBooksData() async {
    try {
      await BookService().getBooks().then((value) {
        if (value.isNotEmpty) {
          for (var data in value) {
            bookList.add(data);
          }
          setState(() {});
        }
      });
    } catch (e) {
      return e;
    }
  }
}
