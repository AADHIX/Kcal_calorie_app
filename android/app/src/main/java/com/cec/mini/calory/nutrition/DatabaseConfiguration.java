package com.cec.mini.calory.nutrition;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.cec.mini.calory.constants.SQLQuery;

public class DatabaseConfiguration extends SQLiteOpenHelper {

    private  final String NUTRITION ="CREATE TABLE "+SQLQuery.TABLE_NUTRITION+"(" +SQLQuery.COLOUMN_ID+ " INTEGER PRIMARY KEY AUTOINCREMENT, "+
            SQLQuery.FOOD_NAME + " TEXT, " +
            SQLQuery.FOOD_WEIGHT + " NUMERIC, " +
            SQLQuery.PROTIEN_WEIGHT + " NUMERIC, " +
            SQLQuery.CARBO_HYDRATE_WEIGHT + " NUMERIC ," +
            SQLQuery.FAT_WEIGHT+" NUMERIC,"+
            SQLQuery.CALORIES+" NUMERIC"+
            ")";
    @RequiresApi(api = Build.VERSION_CODES.P)
    public DatabaseConfiguration(@Nullable Context context) {
        super(context, SQLQuery.DB_NAME, null, 2);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        sqLiteDatabase.execSQL(NUTRITION);

    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }
}
