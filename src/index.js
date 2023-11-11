const express = require("express");

const cors = require("cors");
const FRONTEND_URL = process.env.FRONTEND_URL; // імпортуємо з .env

const users = require("./routes/users");
const houses = require("./routes/houses");
const hotels = require("./routes/hotels");
const rooms = require("./routes/rooms");
const app = express();
app.use(cors());

app.use(express.json());

app.use("/api/users", users);
app.use("/api/houses", houses);
app.use("/api/hotels", hotels);
app.use("/api/rooms", hotels);

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
