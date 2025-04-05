import express from "express";
import sequelizeController from "../controllers/sequelize.controller";

const sequelizeRouter = express.Router();
sequelizeRouter.get("/getListLikesByUser", sequelizeController.getListLikesByUser);
sequelizeRouter.get("/getListLikesByRestaurant", sequelizeController.getListLikesByRestaurant);
sequelizeRouter.get("/getListRateByUser", sequelizeController.getListRateByUser);
sequelizeRouter.get("/getListRateByRestaurant", sequelizeController.getListRateByRestaurant);
sequelizeRouter.post("/createRate", sequelizeController.createRate);
sequelizeRouter.post("/createOrder", sequelizeController.createOrder);

export default sequelizeRouter;
