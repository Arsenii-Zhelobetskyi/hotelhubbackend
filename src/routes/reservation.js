const express = require("express");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const router = express.Router();

router.get("/:user_id", async (req, res) => {
    const { user_id } = req.params;
    const reservations = await prisma.reservation.findMany(
        { where: { user_id: parseInt(user_id) } });
    
    // Отримання масиву reservation_id з результатів першого запиту
        const reservationIds = reservations.map(reservation => reservation.id);

        // Запит до таблиці payCheck за допомогою reservation_id
        const payChecks = await prisma.payCheck.findMany({
            where: { reservation_id: { in: reservationIds } },
            select: {
                reservation_id: true,
                payType: true,
            },
        });

        // Додавання інформації про payCheck безпосередньо до об'єктів reservations
        reservations.forEach(reservation => {
            const relevantPayCheck = payChecks.find(payCheck => payCheck.reservation_id === reservation.id);
            reservation.payCheck = relevantPayCheck;
        });

    res.json(reservations);
    console.log(reservations);
});


module.exports = router;
