package com.cec.mini.calory.constants;

import android.content.Context;

import com.cec.mini.calory.models.LoginModel;
import com.cec.mini.calory.models.SignUpModel;
import com.cec.mini.calory.nutrition.LoginDatabase;
import com.cec.mini.calory.nutrition.SignUpDatabase;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class SignUpDataHandler implements MethodChannel.MethodCallHandler {

    private final Context context;
    private final SignUpDatabase database;
    private final LoginDatabase loginDb;

    public SignUpDataHandler(Context context) {
        this.context = context;
        this.database = new SignUpDatabase(context);
        this.loginDb = new LoginDatabase(context);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("submitSignupData")) {
            // Retrieve data from the method call
            String username = call.argument("username");
            String email = call.argument("email");
            String password = call.argument("password");

            boolean active = false;

            // Create a SignUpModel instance and use the setter methods to set the data
            SignUpModel user = new SignUpModel();
            user.setUserName(username);
            user.setUserEmail(email);
            user.setUserPassword(password);

            // Insert the user data into the database
            database.insertUserData(user);

            // Create a SignUpModel instance and use the setter methods to set the data
            LoginModel loginModel = new LoginModel();
            loginModel.setLoginUsername(username);
            loginModel.setLoginPassword(password);
            loginModel.setActive(active);


            // Insert the user data into the database
            loginDb.insertLoginData(loginModel);

            // Respond back to the Flutter side
            result.success("Data stored successfully in the database.");
        } else {
            result.notImplemented();
        }
    }
}
