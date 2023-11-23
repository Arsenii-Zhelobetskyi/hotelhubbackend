const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();
router.get("/count", async (req, res) => {
  try {
    const id = parseInt(req.query.id);
    const quantity = await prisma.room.count({
      where: {
        hotel_id: id,
      },
    });
    res.json({ quantity });
  } catch (err) {
    console.error(err);
    res.json(err);
  }
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
  res.json(occupiedPlacesByHotel);
});
router.get("/create", async (req, res) => {
  const data = await prisma.room.create({
    data: req.body,
  });
  res.json(data);
});

router.get("/:id", async (req, res) => {
  try {
    const page = parseInt(req.query.page);
    const limit = parseInt(req.query.limit);
    const skip = (page - 1) * limit;
    const data = await prisma.room.findMany({
      skip: skip,
      take: limit,
      where: { hotel_id: parseInt(req.params.id) },
    });
    res.json(data);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});

router.put("/update/:id", async (req, res) => {
  console.log(req.params.id);
  const { hotel_id, placeN, description, price, photo, status } = req.body;
  const data = await prisma.room.update({
    where: { id: parseInt(req.params.id) },
    data: {
      placeN: placeN,
      description: description,
      price: price,
      photo: photo,
      status: status,
    },
  });
  res.json({ data });
});

module.exports = router;
