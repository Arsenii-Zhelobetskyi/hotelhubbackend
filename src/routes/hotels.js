/* const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

class HotelService {
  //класи запропонував ДЖПТІШКА, по суті хз можна відразу робить у index js різні шляхи  й там долбіть прізму, але хз
  async createHotel(data) {
    const hotel = await prisma.hotel.create({
      data,
    });
    return hotel;
  }

  async getHotelById(id) {
    const hotel = await prisma.hotel.findUnique({
      where: { id: id },
    });
    return hotel;
  }

  async getPhotoHotelById(id) {
    const hotel = await prisma.hotel.findUnique({
      where: { id: id },
    });
    if (hotel && hotel.photo) {
      return hotel.photo;
    } else {
      return null;
    }
  }

  async getAllHotels() {
    const hotels = await prisma.hotel.findMany();
    return hotels;
  }
}

const hotelInstance = new HotelService();

module.exports = hotelInstance; */

const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();
router.get("/", async (req, res) => {
  const data = await prisma.hotel.findMany();

  res.json(data);
});
router.get("/hotel/:id", async (req, res) => {
  const data = await prisma.hotel.findUnique({
    where: { id: parseInt(req.params.id) },
  });

  res.json(data);
});
router.get("/create", async (req, res) => {
  const data = await prisma.hotel.create({
    data: req.body,
  });
  res.json(data);
});

module.exports = router;
