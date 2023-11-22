const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

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

router.get("/:id", async (req, res) => {
  const data = await prisma.room.findMany({
    where: { hotel_id: parseInt(req.params.id) },
  });
  res.json(data);
});
module.exports = router;
