const BookRoutes = require("express").Router();
const BookController = require('./../controllers/book_controller');

BookRoutes.get('/', BookController.fetchAllBooks);
BookRoutes.post('/', BookController.createBooks);

module.exports = BookRoutes;