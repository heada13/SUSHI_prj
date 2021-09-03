const deployer = "0xAAF62F2b55181Ee65A11E79743Ef0Ceb673e4cDF"
const SushiCreate = artifacts.require('SushiCreate');

module.exports = (deployer) => {
  deployer.deploy(SushiCreate, 10000, { from : DEPLOYER });
};