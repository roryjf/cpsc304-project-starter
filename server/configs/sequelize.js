const Sequelize = require('sequelize')

const sequelize = new Sequelize(
  process.env.DB_NAME || 'hrjovofg',
  process.env.DB_USER || 'hrjovofg',
  process.env.DB_PASSWORD || '05OZQ_G2THpMSzJxfDRXvAxPiNef03fF',
  {
    host: process.env.DB_HOST || 'baasu.db.elephantsql.com',
    port: parseInt(process.env.DB_PORT) || 5432,
    dialect: 'postgres',
    pool: {
      max: 10,
      min: 0,
      idle: 30000
    },
    define: {
      timestamps: false
    }
  }
)

module.exports = sequelize
