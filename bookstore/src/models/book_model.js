const { Schema, model } = require("mongoose");

const bookSchema = new Schema({
  title: { type: String, required: [true, "title is required"] },
  description: { type: String, default: "" },
  price: { type: Number, default: "" },
  images: { type: Array, default: [] },
  updatedOn: { type: Date },
  createdOn: { type: Date },
});

bookSchema.pre("save", function (next) {
  this.updatedOn = new Date();
  this.createdOn = new Date();

  next();
});

bookSchema.pre(["update", "findOneAndUpdate", "updateOne"], function (next) {
  const update = this.getUpdate();
  delete update._id;

  this.updatedOn = new Date();

  next();
});

const BookModel = model("Book", bookSchema);

module.exports = BookModel;
