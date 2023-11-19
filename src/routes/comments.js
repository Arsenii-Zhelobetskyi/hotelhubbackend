const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/count", async (req, res) => {
  try {
    const id = parseInt(req.query.id);
    const type = req.query.type;
    const quantity = await prisma[`${type}s_comments`].count({
      where: {
        [`${type}_id`]: id,
      },
    });
    res.json({ quantity });
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});

router.get("/:id", async (req, res) => {
  const id = parseInt(req.params.id);
  const type = req.query.type;
  const page = parseInt(req.query.page);
  const limit = parseInt(req.query.limit);
  const skip = (page - 1) * limit;
  const data = await prisma[`${type}s_comments`].findMany({
    skip: skip,
    take: limit,
    where: {
      [`${type}_id`]: id,
    },
  });
  res.json(data);
});

router.post("/create", async (req, res) => {
  try {
    const type = req.query.type;
    const { title, body, rating, id } = req.body;
    const newComment = await prisma[`${type}s_comments`].create({
      data: {
        title,
        body,
        rating,
        [`${type}_id`]: parseInt(id),
      },
    });
    res.json(newComment);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});

router.post("/sortBy", async (req, res) => {
  try {
    const type = req.query.type;
    const { title, body, rating, id } = req.body;
    console.log(req.body);

    res.json(newComment);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});

module.exports = router;
