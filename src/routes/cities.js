const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/", async (req, res) => {
  const cities = await prisma.city.findMany({
    select: {
      name: true,
      country: true,
    },
    distinct: ["name", "country"], // distinct для використання індексу idx_city
  });
  res.json(cities);
});

module.exports = router;
