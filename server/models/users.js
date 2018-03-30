let Sequelize = require('sequelize');

let attributes = {
    userid: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    username: {
        type: Sequelize.STRING,
        validate: {
            is: /^[a-z0-9\_\-]+$/i,
        }
    },
    password: {
        type: Sequelize.STRING,
    }
};

let options = {
    freezeTableName: true
};

module.exports.attributes = attributes;
module.exports.options = options;