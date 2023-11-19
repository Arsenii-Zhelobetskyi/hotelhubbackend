const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:accommodationType", async (req, res) => {
  console.log(req.params.accommodationType, "  \n");
  console.log(req.query);
  const accommodationType = req.params.accommodationType;
    const { city, startDate, endDate, guests } = req.query;
    let data;

    if (accommodationType === 'house') {
      data = await prisma.house.findMany({
        where: {
          city: { name: city },
          placeN: parseInt(guests), // Фільтр по кількості гостей
        },
      });
    } else if (accommodationType === 'room') {
      const hotelIds = await prisma.hotel.findMany({
        select: { id: true, name: true, address: true},
        where: {
          city: { name: city },
        },
      });

      const rooms = await prisma.room.findMany({
        where: {
          hotel_id: { in: hotelIds.map(hotel => hotel.id) },
          placeN: parseInt(guests), // Фільтр по кількості гостей
        },
      });

      data = rooms.map(room => ({
        ...room,
        name: hotelIds.find(hotel => hotel.id === room.hotel_id)?.name || '',
        address: hotelIds.find(hotel => hotel.id === room.hotel_id)?.address || 'Unknown Address',
      }));
    }

  console.log(data);
  res.json(data);
});

module.exports = router;