const express = require("express");
const cors = require("cors");
const FRONTEND_URL = process.env.FRONTEND_URL; // імпортуємо з .env
const front_url = "http://localhost:5173";

const users = require("./routes/users");
const houses = require("./routes/houses");
const hotels = require("./routes/hotels");
const rooms = require("./routes/rooms");
const reservation = require("./routes/reservation");
const pay = require("./routes/pay");
const cities = require("./routes/cities");
const comments = require("./routes/comments");
const search = require("./routes/search");
const authorization = require("./routes/authorization");
const app = express();

app.use(cors({
  origin: front_url,
  credentials: true,
}));

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
app.use("/api/authorization", authorization);

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
