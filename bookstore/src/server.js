const express = require("express");
const bodyParser = require("body-parser");
const helmet = require("helmet");
const morgan = require("morgan");
const cors = require("cors");
const mongoose = require("mongoose");

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(helmet());
app.use(morgan("dev"));
app.use(cors());

mongoose.connect(
  "mongodb+srv://chandugangola:BU4te0G0tuFWRFV1@cluster0.crs4o1u.mongodb.net/bookstore?retryWrites=true&w=majority"
);

// Books
const BookRoutes = require("./routes/book_routes");
app.use("/api/books", BookRoutes);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`listening on port: ${PORT}`);
});
