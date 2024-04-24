package com.cec.mini.calory.nutrition;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;

import androidx.annotation.RequiresApi;

import com.cec.mini.calory.models.Nutrition;
import com.cec.mini.calory.constants.SQLQuery;
import com.cec.mini.calory.helper.NutritionHelper;

public class NutritionDataBaseHelper {

    SQLiteOpenHelper dbhandler;
    SQLiteDatabase database;

    private static final String GET_FOOD_QUERY ="SELECT * FROM NUTRITION WHERE FOOD_NAME= ?";

    @RequiresApi(api = Build.VERSION_CODES.P)
    public NutritionDataBaseHelper(Context context) {
        dbhandler=new LoginDatabase(context);
        database = dbhandler.getWritableDatabase();
    }

    public String saveFood(Nutrition nutrition){
        double calories = NutritionHelper.getCalorie(nutrition.getProtienWeight(),nutrition.getFatWeight(),nutrition.getCarbhydrateWeight());
        ContentValues values = new ContentValues();
        values.put(SQLQuery.FOOD_NAME,nutrition.getFoodName());
        values.put(SQLQuery.CALORIES,calories);
        values.put(SQLQuery.FOOD_WEIGHT, nutrition.getFoodWeight());
        values.put(SQLQuery.CARBO_HYDRATE_WEIGHT, nutrition.getCarbhydrateWeight());
        values.put(SQLQuery.PROTIEN_WEIGHT,nutrition.getProtienWeight());
        values.put(SQLQuery.FAT_WEIGHT,nutrition.getFatWeight());
        long id= database.insert(SQLQuery.TABLE_NUTRITION,null,values);
        return id!=0?"Food Added":"Operation Failed";
    }

    @SuppressLint("Range")
    public Nutrition getNutrition(String foodName){
        Nutrition nutrition = new Nutrition();
       Cursor cursor=database.rawQuery(GET_FOOD_QUERY,new String[]{foodName});
       if(cursor.getCount()>0) {
           while (cursor.moveToNext()) {
               nutrition.setFoodName(cursor.getString(cursor.getColumnIndex(SQLQuery.FOOD_NAME)));
               nutrition.setCarbhydrateWeight(cursor.getDouble(cursor.getColumnIndex(SQLQuery.CARBO_HYDRATE_WEIGHT)));
           }
       }
       return nutrition;
    }

    public void close(){
        dbhandler.close();
    }
}
