const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:id", async (req, res) => {
  const type = req.query.type;
  const data = await prisma[`${type}s_comments`].findMany({
    take: 5,
    where: {
      [`${type}_id`]: parseInt(req.params.id),
    },
  });
  res.json(data);
});

router.post("/create", async (req, res) => {
  try {
    const type = req.query.type;
    const { title, body, rating, id } = req.body;
    console.log(req.body);
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
module.exports = router;
