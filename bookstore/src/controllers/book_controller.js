const BookModel = require("./../models/book_model");

const BookController = {
  createBooks: async function (req, res) {
    try {
      const bookData = req.body;
      const newBooks = new BookModel(bookData);
      await newBooks.save();

      return res.json({
        success: true,
        data: newBooks,
        message: "Books created!",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  fetchAllBooks: async function (req, res) {
    try {
      const books = await BookModel.find();
      return res.json({ success: true, data: books });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },
};

module.exports = BookController;
