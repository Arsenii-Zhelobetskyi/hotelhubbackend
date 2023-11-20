const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:accommodationType", async (req, res) => {
  console.log(req.params.accommodationType,);
  console.log(req.query);
  const accommodationType = req.params.accommodationType;
  const { city, startDate, endDate, guests } = req.query;
  let data;
  
  const reservObject = await prisma.reservation.findMany({
      select: { object_id: true },
      where: { start_date: { gte: new Date(startDate) }, end_date: { lte: new Date(endDate) }, }
  }); console.log(reservObject);

  if (accommodationType === 'house') {
    
      const objectIds = await prisma.reservation_object.findMany({
        select: { house_id: true },
        where: { id: { in: reservObject.map(object => object.object_id) }, },
      }); console.log(objectIds);
      
      data = await prisma.house.findMany({
        where: {
          city: { name: city },
          placeN: parseInt(guests),
          id: { notIn: objectIds.map(object => object.house_id) },
        },
      });
    
  } else if (accommodationType === 'room') {
      const hotelIds = await prisma.hotel.findMany({
        select: { id: true, name: true, address: true},
        where: { city: { name: city }, },
      });

      const objectIds = await prisma.reservation_object.findMany({
        select: { room_id: true },
        where: { id: { in: reservObject.map(object => object.object_id) }, },
      }); console.log(objectIds);

      const roomData = await prisma.room.findMany({
        where: {
          id: { notIn: objectIds.map(object => object.room_id) },
          hotel_id: { in: hotelIds.map(hotel => hotel.id) },
          placeN: parseInt(guests),
        }
      }); console.log(roomData);

      data = roomData.map(room => ({
        ...room,
        name: hotelIds.find(hotel => hotel.id === room.hotel_id)?.name || '',
        address: hotelIds.find(hotel => hotel.id === room.hotel_id)?.address || 'Unknown Address',
      }));
  };

  console.log(data);
  res.json(data);
});

module.exports = router;