/* const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

class RoomService {
  
  async createRoom(data) {
    const room = await prisma.room.create({
      data,
    });
    return room;
  }

  // Приклад методу в класі, який працює з кімнатами
async getOccupiedPlacesByHotel() {

  const occupiedRooms = await prisma.room.groupBy({
    by: ['hotel_id'],
    _sum: {
      placeN: true,
    },
    where: {
      status: 'occupied',
    },
  });
    const occupiedPlacesByHotel = occupiedRooms.map((roomGroup) => ({
  hotelId: roomGroup.hotel_id,
  totalPlaces: roomGroup._sum.placeN || 0,
}));
    console.log(occupiedPlacesByHotel);
  return occupiedPlacesByHotel;
}

  async getAllRoom() {
    const rooms = await prisma.room.findMany();
    return rooms;
  }
}

const roomInstance = new RoomService();

module.exports = roomInstance;
 */
const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/", async (req, res) => {
  const data = await prisma.room.findMany();
  res.json(data);
});

router.get("/room/:id", async (req, res) => {
  const data = await prisma.room.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(data);
});

router.get("/occupiedPlacesByHotel", async (req, res) => {
  const occupiedRooms = await prisma.room.groupBy({
    by: ["hotel_id"],
    _sum: {
      placeN: true,
    },
    where: {
      status: "occupied",
    },
  });
  const occupiedPlacesByHotel = occupiedRooms.map((roomGroup) => ({
    hotelId: roomGroup.hotel_id,
    totalPlaces: roomGroup._sum.placeN || 0,
  }));
  console.log(occupiedPlacesByHotel);
  res.json(occupiedPlacesByHotel);
});
router.get("/create", async (req, res) => {
  const data = await prisma.room.create({
    data: req.body,
  });
  res.json(data);
});

module.exports = router;
