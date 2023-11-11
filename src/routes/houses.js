/* const { PrismaClient } = require("@prisma/client");

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

module.exports = houseInstance; */
const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/", async (req, res) => {
  const data = await prisma.house.findMany();
  res.json(data);
});
router.get("/house/:id", async (req, res) => {
  const data = await prisma.house.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(data);
});
router.get("/create", async (req, res) => {
  const data = await prisma.house.create({
    data: req.body,
  });
  res.json(data);
});

module.exports = router;
