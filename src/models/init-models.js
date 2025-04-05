import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _Food_Type from  "./Food_Type.js";
import _Foods from  "./Foods.js";
import _Like_Res from  "./Like_Res.js";
import _Orders from  "./Orders.js";
import _Rate_Res from  "./Rate_Res.js";
import _Restaurant from  "./Restaurant.js";
import _Sub_Food from  "./Sub_Food.js";
import _Users from  "./Users.js";

export default function initModels(sequelize) {
  const Food_Type = _Food_Type.init(sequelize, DataTypes);
  const Foods = _Foods.init(sequelize, DataTypes);
  const Like_Res = _Like_Res.init(sequelize, DataTypes);
  const Orders = _Orders.init(sequelize, DataTypes);
  const Rate_Res = _Rate_Res.init(sequelize, DataTypes);
  const Restaurant = _Restaurant.init(sequelize, DataTypes);
  const Sub_Food = _Sub_Food.init(sequelize, DataTypes);
  const Users = _Users.init(sequelize, DataTypes);

  Foods.belongsTo(Food_Type, { as: "type", foreignKey: "type_id"});
  Food_Type.hasMany(Foods, { as: "Foods", foreignKey: "type_id"});
  Orders.belongsTo(Foods, { as: "food", foreignKey: "food_id"});
  Foods.hasMany(Orders, { as: "Orders", foreignKey: "food_id"});
  Sub_Food.belongsTo(Foods, { as: "food", foreignKey: "food_id"});
  Foods.hasMany(Sub_Food, { as: "Sub_Foods", foreignKey: "food_id"});
  Like_Res.belongsTo(Restaurant, { as: "re", foreignKey: "res_id"});
  Restaurant.hasMany(Like_Res, { as: "Like_Res", foreignKey: "res_id"});
  Rate_Res.belongsTo(Restaurant, { as: "re", foreignKey: "res_id"});
  Restaurant.hasMany(Rate_Res, { as: "Rate_Res", foreignKey: "res_id"});
  Like_Res.belongsTo(Users, { as: "user", foreignKey: "user_id"});
  Users.hasMany(Like_Res, { as: "Like_Res", foreignKey: "user_id"});
  Orders.belongsTo(Users, { as: "user", foreignKey: "user_id"});
  Users.hasMany(Orders, { as: "Orders", foreignKey: "user_id"});
  Rate_Res.belongsTo(Users, { as: "user", foreignKey: "user_id"});
  Users.hasMany(Rate_Res, { as: "Rate_Res", foreignKey: "user_id"});

  return {
    Food_Type,
    Foods,
    Like_Res,
    Orders,
    Rate_Res,
    Restaurant,
    Sub_Food,
    Users,
  };
}
