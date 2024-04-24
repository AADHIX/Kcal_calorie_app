package com.cec.mini.calory.nutrition;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.cec.mini.calory.models.LoginModel;
import com.cec.mini.calory.models.SignUpModel;

public class LoginDatabase extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "LoginData.db";
    private static final int DATABASE_VERSION = 1;

    // Table and columns names
    private static final String TABLE_NAME = "LoginData";
    private static final String COLUMN_USERNAME = "username";
    private static final String COLUMN_PASSWORD = "password";
    private static final String COLUMN_ACTIVE = "active";

    public LoginDatabase(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // Create the table
        db.execSQL("CREATE TABLE " + TABLE_NAME + " (" +
                COLUMN_USERNAME + " TEXT PRIMARY KEY NOT NULL, " +
                COLUMN_PASSWORD + " TEXT NOT NULL, " +
                COLUMN_ACTIVE + " INTEGER NOT NULL" +
                ")");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Handle database upgrade (if any)
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    // Insert data into the database using a SignUpModel object
    public void insertLoginData(LoginModel login) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();

        // Use the getters from the LoginModel class to retrieve the data
        values.put(COLUMN_USERNAME, login.getLoginUsername());
        values.put(COLUMN_PASSWORD, login.getLoginPassword());
        values.put(COLUMN_ACTIVE, login.getActive() ? 1 : 0); // Store boolean as INTEGER

        // Insert the data
        db.insert(TABLE_NAME, null, values);

        // Close the database
        db.close();
    }


    // Method to authenticate user credentials
    public boolean authenticateUser(LoginModel login) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = null;
        try {
            // Define the projection (which columns to retrieve)
            String[] projection = {COLUMN_USERNAME, COLUMN_PASSWORD};

            // Define the selection (WHERE clause)
            String selection = COLUMN_USERNAME + " = ? AND " + COLUMN_PASSWORD + " = ?";

            // Define the selection arguments
            String[] selectionArgs = {login.getLoginUsername(), login.getLoginPassword()};

            // Query the database
            cursor = db.query(
                    TABLE_NAME,     // The table to query
                    projection,     // The columns to return
                    selection,      // The columns for the WHERE clause
                    selectionArgs,  // The values for the WHERE clause
                    null,           // Don't group the rows
                    null,           // Don't filter by row groups
                    null            // Don't sort the rows
            );

            // Check if the cursor contains any rows
            if (cursor != null && cursor.getCount() > 0) {
                return true; // Authentication successful
            }
        } finally {
            // Close the cursor and database
            if (cursor != null) {
                cursor.close();
            }
            db.close();
        }
        return false; // Authentication failed
    }

    // Method to update active status for a given username
    public void updateActiveStatus(LoginModel login) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();

        // Set the new active status value
        values.put(COLUMN_ACTIVE, login.getActive() ? 1 : 0); // Store boolean as INTEGER

        // Define the WHERE clause
        String selection = COLUMN_USERNAME + " = ?";
        String[] selectionArgs = { login.getLoginUsername() };

        // Update the active status in the database
        db.update(TABLE_NAME, values, selection, selectionArgs);

        // Close the database
        db.close();
    }


    // Method to retrieve the username of the current user (active user)
    public String getCurrentUser() {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = null;
        String username = null;
        try {
            // Define the projection (which columns to retrieve)
            String[] projection = {COLUMN_USERNAME};

            // Define the selection (WHERE clause)
            String selection = COLUMN_ACTIVE + " = ?";

            // Define the selection arguments
            String[] selectionArgs = { "1" }; // 1 represents active status

            // Query the database
            cursor = db.query(
                    TABLE_NAME,     // The table to query
                    projection,     // The columns to return
                    selection,      // The columns for the WHERE clause
                    selectionArgs,  // The values for the WHERE clause
                    null,           // Don't group the rows
                    null,           // Don't filter by row groups
                    null            // Don't sort the rows
            );

            // Check if the cursor contains any rows
            if (cursor != null && cursor.moveToFirst()) {
                // Retrieve the username from the cursor
                username = cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_USERNAME));
            }
        } finally {
            // Close the cursor and database
            if (cursor != null) {
                cursor.close();
            }
            db.close();
        }
        return username; // Return the username of the current user (active user)
    }
}
