const cds = require('@sap/cds');

class CatalogService extends cds.ApplicationService {
  async init() {
    const RemoteService = await cds.connect.to('RemoteService');
    const { Holes, Players } = this.entities;

    this.on('*', Players, (req) => {
      console.log('>>> delegating to remote service...');
      return RemoteService.run(req.query);
    });

    this.on('CREATE', Holes, async (req, next) => {
      const { score, par } = req.data;

      const resultValues = {
        '-3': 'albatross',
        '-2': 'eagle',
        '-1': 'birdie',
        0: 'par',
        1: 'bogey',
        2: 'double bogey',
        3: 'triple bogey',
      };

      req.data.result = score === 1 ? 'hole in one' : resultValues[score - par];
      return next();
    });

    await super.init();
  }
}

module.exports = CatalogService;
