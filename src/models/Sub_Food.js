import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class Sub_Food extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    sub_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    sub_name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    sub_price: {
      type: DataTypes.FLOAT,
      allowNull: false
    },
    food_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Foods',
        key: 'food_id'
      }
    },
    deleteBy: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    isDelete: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: 0
    },
    deleteAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    createAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    updateAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'Sub_Food',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "sub_id" },
        ]
      },
      {
        name: "food_id",
        using: "BTREE",
        fields: [
          { name: "food_id" },
        ]
      },
    ]
  });
  }
}
