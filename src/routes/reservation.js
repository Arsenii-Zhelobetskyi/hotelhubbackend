const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:user_id", async (req, res) => {
  const { user_id } = req.params;
  console.log(user_id);
  const reservations = await prisma.reservation.findMany({
    where: { user_id: parseInt(user_id) },
  });

  // Отримання масиву reservation_id з результатів першого запиту
  const reservationIds = reservations.map((reservation) => reservation.id);

  // Запит до таблиці payCheck за допомогою reservation_id
  const payChecks = await prisma.payCheck.findMany({
    where: { reservation_id: { in: reservationIds } },
    select: {
      reservation_id: true,
      payType: true,
    },
  });

  // Додавання інформації про payCheck безпосередньо до об'єктів reservations
  reservations.forEach((reservation) => {
    const relevantPayCheck = payChecks.find(
      (payCheck) => payCheck.reservation_id === reservation.id
    );
    reservation.payCheck = relevantPayCheck;
  });

  res.json(reservations);
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

module.exports = router;
