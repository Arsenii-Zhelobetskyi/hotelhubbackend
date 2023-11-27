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
    const resObj = req.query.resObj;
    const { order } = req.body;
    order.sum = parseInt(order.sum);
    console.log(order.sum);
    const newOrder = await prisma.reservation.create({
      data: {
        ...order,
        object_id: parseInt(resObj),
      },
    });
    res.json(newOrder);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});
router.post("/create-pay", async (req, res) => {
  try {
    const resId = req.query.resId;
    const { pay } = req.body;
    pay.sum = parseInt(pay.sum);
    console.log(pay.sum);
    const newPay = await prisma.payCheck.create({
      data: {
        ...pay,
        reservation_id: parseInt(resId),
      },
    });
    res.json(newPay);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});
router.post("/create-reservation-obj", async (req, res) => {
  try {
    const type = req.query.type;
    const { id } = req.body;
    // const type_id = `${type}_id`;
    // const value = data[type_id];
    console.log(id, type);
    const newOrder = await prisma.reservation_object.create({
      data: {
        [`${type}_id`]: parseInt(id),
      },
    });
    res.json(newOrder);
  } catch (err) {
    console.error(err);
    res.json(err);
  }
});

module.exports = router;
