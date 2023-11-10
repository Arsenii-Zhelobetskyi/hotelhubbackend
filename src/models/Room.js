const { PrismaClient } = require("@prisma/client");

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
