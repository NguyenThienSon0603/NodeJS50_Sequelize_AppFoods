import { responseSuccess } from "../helpers/response.helpers";
import sequelizeService from "../services/sequelize.service";

const sequelizeController = {
  getListLikesByUser: async (req, res, next) => {
    try {
      const result = await sequelizeService.getListLikesByUser(req, res, next);
      const response = responseSuccess(result, "Lấy dữ liệu thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },

  getListLikesByRestaurant: async (req, res, next) => {
    try {
      const result = await sequelizeService.getListLikesByRestaurant(
        req,
        res,
        next
      );
      const response = responseSuccess(result, "Lấy dữ liệu thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },

  getListRateByUser: async (req, res, next) => {
    try {
      const result = await sequelizeService.getListRateByUser(req, res, next);
      const response = responseSuccess(result, "Lấy dữ liệu thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },

  getListRateByRestaurant: async (req, res, next) => {
    try {
      const result = await sequelizeService.getListRateByRestaurant(
        req,
        res,
        next
      );
      const response = responseSuccess(result, "Lấy dữ liệu thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },

  createRate: async (req, res, next) => {
    try {
      const result = await sequelizeService.createRate(req, res, next);
      const response = responseSuccess(result, "Thêm mới thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },

  createOrder: async (req, res, next) => {
    try {
      const result = await sequelizeService.createOrder(req, res, next);
      const response = responseSuccess(result, "Thêm mới thành công.", 200);
      res.status(response.statusCode).json(response);
    } catch (error) {
      next(error);
    }
  },
};

export default sequelizeController;
