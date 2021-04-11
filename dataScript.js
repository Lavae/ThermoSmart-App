function myFunction() {
  const email = "sc-energy-app@appspot.gserviceaccount.com";
  const key = "";
  
  const projectId = "sc-energy-app";
  var firestore = FirestoreApp.getFirestore (email, key, projectId);

  // get document data from ther spreadsheet
   var ss = SpreadsheetApp.getActiveSpreadsheet();
   var sheetname = "Week data";
   var sheet = ss.getSheetByName("Sheet1"); 
   // get the last row and column in order to define range
   var sheetLR = sheet.getLastRow(); // get the last row
   var sheetLC = sheet.getLastColumn(); // get the last column

   var dataSR = 2; // the first row of data
   // define the data range
   var sourceRange = sheet.getRange(2,1,sheetLR-dataSR+1,sheetLC);

   // get the data
   var sourceData = sourceRange.getValues();
   // get the number of length of the object in order to establish a loop value
   var sourceLen = sourceData.length;
  
  // Loop through the rows
   for (var i=0; i<sourceLen; i++){
     if(sourceData[i][1] !== '') {
       var data = {};
       var dateSt = sourceData[i][0].toString();
       var stDate = new Date(dateSt);
       var stringfied = JSON.stringify(stDate);
       var updatedDt = stringfied.slice(1,11);

       data.day = updatedDt;
       data.Hr1 = sourceData[i][1];
       data.Hr2 = sourceData[i][2];
       data.Hr3 = sourceData[i][3];
       data.Hr4 = sourceData[i][4];
       data.Hr5 = sourceData[i][5];
       data.Hr6 = sourceData[i][6];
       data.Hr7 = sourceData[i][7];
       data.Hr8 = sourceData[i][8];
       data.Hr9 = sourceData[i][9];
       data.Hr10 = sourceData[i][10];
       data.Hr11 = sourceData[i][11];
       data.Hr12 = sourceData[i][12];
       data.Hr13 = sourceData[i][13];
       data.Hr14 = sourceData[i][14];
       data.Hr15 = sourceData[i][15];
       data.Hr16 = sourceData[i][16];
       data.Hr17 = sourceData[i][17];
       data.Hr18 = sourceData[i][18];
       data.Hr19 = sourceData[i][19];
       data.Hr20 = sourceData[i][20];
       data.Hr21 = sourceData[i][21];
       data.Hr22 = sourceData[i][22];
       data.Hr23 = sourceData[i][23];
       data.Hr24 = sourceData[i][24];

        
       firestore.createDocument("Week data",data);
     }
   }
    
}