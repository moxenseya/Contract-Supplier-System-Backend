var express = require('express');
var app = express();
var sql = require("mssql");
// config for your database
var config = {
 user: 'sa',
 password: 'password',
 server: 'DESKTOP-TB0VDKH\\SQLEXPRESS',
 database: 'ContractSuppliesSystem',
 options: {
        trustedConnection: true
    },
    port: 1433
 };

//Transaction 6
app.get('/Orders/:OrderNo/', function(req, res) {

      //  console.log(req.params.OrderNo);

var OrderNo = req.params.OrderNo;

        sql.connect(config, function (err) {

        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();

        // query to the database and get the data
        request.query( 'select ItemNo,ItemDesc from dbo.Items where ItemNo in(select itemno from MadeOf where OrderNo =' +OrderNo+')', function (err, recordset) {
        if (err) console.log(err)

        // send data as a response
        res.send(recordset);
        sql.close();

        });
        });

  //  send.json(data);
});

//Transaction 7
app.get('/Orders/:OrderNo/:ItemNo', function(req, res) {

      //  console.log(req.params.OrderNo);

var OrderNo = req.params.OrderNo;
var ItemNo = req.params.ItemNo;

        sql.connect(config, function (err) {

        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();

        // query to the database and get the data
        request.query('select ContractPrice from ToSupply where ItemNo =' +ItemNo+ ' and ContractNo in (select ContractNo from Orders where OrderNo = ' + OrderNo+ ')', function (err, recordset) {
        if (err) console.log(err)

        // send data as a response
        res.send(recordset);
        sql.close();

        });
        });

  //  send.json(data);
});


//Transaction 8
app.get('/Items/:ItemNo', function(req, res) {

      //  console.log(req.params.OrderNo);

var ItemNo = req.params.ItemNo;

        sql.connect(config, function (err) {

        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();

        // query to the database and get the data
        request.query('Select OrderNo from MadeOf where ItemNo in (Select ItemNo from Items where ItemNo =' +ItemNo+')', function (err, recordset) {
        if (err) console.log(err)

        // send data as a response
        res.send(recordset);
        sql.close();

        });
        });

  //  send.json(data);
});

//Transaction 9
app.get('/Contracts/:ContractNo/:ItemNo', function(req, res) {

      //  console.log(req.params.OrderNo);

      var ContractNo = req.params.ContractNo;

var ItemNo = req.params.ItemNo;

        sql.connect(config, function (err) {

        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();

        // query to the database and get the data
        request.query('Select ContractPrice from ToSupply where ContractNo = ' +ContractNo+' and ItemNo = ' + ItemNo, function (err, recordset) {
        if (err) console.log(err)

        // send data as a response
        res.send(recordset);
        sql.close();

        });
        });

  //  send.json(data);
});


//Transaction 10
app.get('/Contracts/:ContractNo', function(req, res) {

      //  console.log(req.params.OrderNo);

      var ContractNo = req.params.ContractNo;


        sql.connect(config, function (err) {

        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();

        // query to the database and get the data
        request.query('SELECT Contracts.ContractNo ,Suppliers.SupplierName from Suppliers INNER JOIN Contracts ON Suppliers.SupplierNo = Contracts.SupplierNo where ContractNo =' + ContractNo, function (err, recordset) {
        if (err) console.log(err)

        // send data as a response
        res.send(recordset);
        sql.close();

        });
        });

  //  send.json(data);
});



var server = app.listen(4000, function () {
 console.log('Server is running.. on Port 4000');
});
