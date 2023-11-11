const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

class HouseService {
  //класи запропонував ДЖПТІШКА, по суті хз можна відразу робить у index js різні шляхи  й там долбіть прізму, але хз
  async createHouse(data) {
    const house = await prisma.house.create({
      data,
    });
    return house;
  }

  async getHouseById(id) {
    const house = await prisma.house.findUnique({
      where: { id: id },
    });
    return house;
  }

  async getAllHouses() {
    const houses = await prisma.house.findMany();
    return houses;
  }
}

const houseInstance = new HouseService();

module.exports = houseInstance;
