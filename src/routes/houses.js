const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();
router.get("/count", async (req, res) => {
  try {
    const quantity = await prisma.house.count();
    res.json({ quantity });
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});
router.get("/", async (req, res) => {
  const page = parseInt(req.query.page);
  const limit = parseInt(req.query.limit);
  const skip = (page - 1) * limit;

  const data = await prisma.house.findMany({
    skip: skip,
    take: limit,
  });
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
