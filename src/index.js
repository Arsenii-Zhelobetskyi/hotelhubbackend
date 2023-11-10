const express = require("express");
const userInstance = require("./models/User");
const houseInstance = require("./models/House");
const hotelInstance = require("./models/Hotel");
const roomInstance = require("./models/Room");
const cors = require("cors");
const FRONTEND_URL = process.env.FRONTEND_URL; // імпортуємо з .env

const app = express();
app.use(
  cors({
    origin: FRONTEND_URL,
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
    credentials: true,
  })
);
app.use(express.json());

// усі шляхи у нашому api:
app.get("/api/users", async (req, res) => {
  const users = await userInstance.getAllUsers();
  res.json(users);
});

app.get("/api/houses", async (req, res) => {
  const houses = await houseInstance.getAllHouses();
  res.json(houses);
});

app.get("/api/hotels", async (req, res) => {
  const hotels = await hotelInstance.getAllHotels();
  res.json(hotels);
});

app.get("/api/hotel/:id", async (req, res) => {
  const hotel = await hotelInstance.getHotelById(parseInt(req.params.id));

  res.json(hotel);
});

app.get("/api/totalOccupiedPlaces", async (req, res) => {
  const rooms = await roomInstance.getOccupiedPlacesByHotel();
  res.json(rooms);
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
