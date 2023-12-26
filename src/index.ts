import { PrismaClient } from "@prisma/client"
import app from "./app";
import { Request, Response } from "express";

const prisma = new PrismaClient()
const port = process.env.PORT || 8080;


async function main() {
    app.listen(port, () => {
        console.log(`Server running on port ${port}`);
    });
}

main()
    .then(async () => {
        await prisma.$disconnect()
    })
    .catch(async (e) => {
        console.error(e)
        await prisma.$disconnect()
        process.exit(1)
    })