package com.cec.mini.calory.nutrition;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.cec.mini.calory.models.SignUpModel;

public class SignUpDatabase extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "SignUpData.db";
    private static final int DATABASE_VERSION = 1;

    // Table and columns names
    private static final String TABLE_NAME = "SignUpData";
    private static final String COLUMN_USERNAME = "username";
    private static final String COLUMN_EMAIL = "email";
    private static final String COLUMN_PASSWORD = "password";

    public SignUpDatabase(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // Create the table
        db.execSQL("CREATE TABLE " + TABLE_NAME + " (" +
                COLUMN_USERNAME + " TEXT NOT NULL, " +
                COLUMN_EMAIL + " TEXT PRIMARY KEY NOT NULL, " +
                COLUMN_PASSWORD + " TEXT NOT NULL" +
                ")");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Handle database upgrade (if any)
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    // Insert data into the database using a SignUpModel object
    public void insertUserData(SignUpModel user) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();

        // Use the getters from the SignUpModel class to retrieve the data
        values.put(COLUMN_USERNAME, user.getUserName());
        values.put(COLUMN_EMAIL, user.getUserEmail());
        values.put(COLUMN_PASSWORD, user.getUserPassword());

        // Insert the data
        long rowId = db.insert(TABLE_NAME, null, values);

        // Check the result of the insertion and print a message
        if (rowId != -1) {
            System.out.println("Data inserted successfully with row ID: " + rowId);
        } else {
            System.out.println("Failed to insert data into the database.");
        }

        db.close();
    }
}
