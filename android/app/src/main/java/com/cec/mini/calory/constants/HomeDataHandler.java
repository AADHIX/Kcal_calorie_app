package com.cec.mini.calory.constants;

import android.content.Context;

import com.cec.mini.calory.nutrition.LoginDatabase;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class HomeDataHandler implements MethodChannel.MethodCallHandler {

    private final Context context;
    private final LoginDatabase loginDb;
    public HomeDataHandler(Context context) {
        this.context = context;
        this.loginDb = new LoginDatabase(context);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getCurrentUser")) {
            // Retrieve data from the method call
            String username = loginDb.getCurrentUser();

            result.success(username);

        } else {
            result.notImplemented();
        }
    }
}
