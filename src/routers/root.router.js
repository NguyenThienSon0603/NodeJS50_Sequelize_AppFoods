import express from "express";
import sequelizeRouter from "./sequelize.router";

const rootRouter = express.Router();

rootRouter.use("/sequelize", sequelizeRouter);

export default rootRouter;
