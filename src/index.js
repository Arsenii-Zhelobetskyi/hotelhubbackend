const express = require("express");

const cors = require("cors");
const FRONTEND_URL = process.env.FRONTEND_URL; // імпортуємо з .env

const users = require("./routes/users");
const houses = require("./routes/houses");
const hotels = require("./routes/hotels");
const rooms = require("./routes/rooms");
const reservation = require("./routes/reservation");
const pay = require("./routes/pay");
const cities = require("./routes/cities");
const comments = require("./routes/comments");
const search = require("./routes/search");
const app = express();
app.use(cors());

app.use(express.json());

app.use("/api/users", users);
app.use("/api/houses", houses);
app.use("/api/hotels", hotels);
app.use("/api/rooms", rooms);
app.use("/api/reservation", reservation);
app.use("/api/pay", pay);
app.use("/api/cities", cities);
app.use("/api/comments", comments);
app.use("/api/search", search);

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
