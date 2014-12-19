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


module.exports = function(app) {
  app.dataSources.mysqlDs.automigrate('User', function(err) {
    if (err) throw err;

    app.models.User.create([
      {device_id: '123ABC', verification_code: 'AAAA-BBBB-CCCC', number: '778-668-9726'}
    ], function(err, userNames) {
      if (err) throw err;

      console.log('Users created: \n', userNames);
    });
  });
};