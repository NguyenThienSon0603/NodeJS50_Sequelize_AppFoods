import { models } from "../sequelize/connect.sequelize";

const sequelizeService = {
  // Lấy danh sách nhà hàng mà user đã like
  getListLikesByUser: async (req, res, next) => {
    const userId = req.query.userId;
    try {
      const likeList = await models.Like_Res.findAll({
        where: { user_id: userId },
        include: [
          {
            model: models.Restaurant,
            as: "re",
            attributes: ["res_id", "res_name"],
          },
        ],
        attributes: ["user_id", "date_like"],
      });
      return likeList;
    } catch (error) {
      next(error);
    }
  },

  // Lấy danh sách user đã like nhà hàng
  getListLikesByRestaurant: async (req, res, next) => {
    const resId = req.query.resId;
    try {
      const likeList = await models.Like_Res.findAll({
        where: { res_id: resId },
        include: [
          {
            model: models.Users,
            as: "user",
            attributes: ["user_id", "full_name"],
          },
        ],
        attributes: ["res_id", "date_like"],
      });
      return likeList;
    } catch (error) {
      next(error);
    }
  },

  // Lấy danh sách rate theo user
  getListRateByUser: async (req, res, next) => {
    const userId = req.query.userId;
    try {
      const rateList = await models.Rate_Res.findAll({
        where: { user_id: userId },
        include: [
          {
            model: models.Restaurant,
            as: "re",
            attributes: ["res_id", "res_name"],
          },
        ],
        attributes: ["user_id", "date_rate"],
      });
      return rateList;
    } catch (error) {
      next(error);
    }
  },

  // Lấy danh sách rate theo restaurant
  getListRateByRestaurant: async (req, res, next) => {
    const resId = req.query.resId;
    try {
      const rateList = await models.Rate_Res.findAll({
        where: { res_id: resId },
        include: [
          {
            model: models.Users,
            as: "user",
            attributes: ["user_id", "full_name"],
          },
        ],
        attributes: ["res_id", "date_rate"],
      });
      return rateList;
    } catch (error) {
      next(error);
    }
  },

  // Thêm mới rate
  createRate: async (req, res, next) => {
    const data = req.body;
    try {
      const result = await models.Rate_Res.create(data);
      return result;
    } catch (error) {
      next(error);
    }
  },

  // Thêm mới order
  createOrder: async (req, res, next) => {
    const data = req.body;
    try {
      const result = await models.Orders.create(data);
      return result;
    } catch (error) {
      next(error);
    }
  },
};

export default sequelizeService;
