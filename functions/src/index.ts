/* eslint-disable */
import * as functions from "firebase-functions";
const yahooStockAPI  = require('yahoo-stock-api');

export const helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});


export const getStockAPI = functions.https.onRequest(async (request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
  const startDate = new Date('08/21/2020');
  const endDate = new Date('08/26/2020');
   response.send(await 
    yahooStockAPI.getHistoricalPrices(startDate, endDate, "AAPL", "1d")
    );
});
