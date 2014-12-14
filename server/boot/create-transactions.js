module.exports = function(app) {
  app.dataSources.mysqlDs.automigrate('Transactions', function(err) {
    if (err) throw err;

    app.models.Transactions.create([
      {amount: 'Bel Cafe'},
      {amount: 'Three Bees Coffee House'},
      {amount: 'Caffe Artigiano'},
    ], function(err, coffeeShops) {
      if (err) throw err;

      console.log('Models created: \n', coffeeShops);
    });
  });
};