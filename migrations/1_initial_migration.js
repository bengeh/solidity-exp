const Migrations = artifacts.require("Migrations");
const Marketplace = artifacts.require("Marketplace");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Marketplace);
};
