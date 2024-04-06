package com.cec.mini.calory;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import com.cec.mini.calory.helper.MLHelper;
import com.cec.mini.calory.helper.NutritionHelper;
import com.cec.mini.calory.models.Nutrition;
import com.cec.mini.calory.nutrition.NutritionDataBaseHelper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Collections;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {



    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        String channel = "form_data_channel";
        String[] labels = getLabels();
        new MethodChannel(flutterEngine.getDartExecutor(), channel).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @RequiresApi(api = Build.VERSION_CODES.P)
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("submitFormData")) {
                            System.out.println("LABELS---"+ Arrays.asList(labels));
                            String formData = call.argument("weight");
                            String name = call.argument("name");
                            byte[] imagePath = call.argument("path");
                            Bitmap bitmap = BitmapFactory.decodeByteArray(imagePath, 0, imagePath.length);
                            System.out.println(formData);
                            System.out.println(name);
                            System.out.println(MLHelper.getFoodName(bitmap,MainActivity.this, labels));
                            String foodname = MLHelper.getFoodName(bitmap,MainActivity.this, labels);
                            NutritionDataBaseHelper nutritionDataBaseHelper = new NutritionDataBaseHelper(MainActivity.this);
                            dummyInsert(nutritionDataBaseHelper);
                            Nutrition nutrition = nutritionDataBaseHelper.getNutrition("apple");
                            System.out.println(nutrition);
                            Toast.makeText(MainActivity.this,nutrition.getFoodName(), Toast.LENGTH_SHORT).show();
                            result.success(Collections.singletonList("test"));
                        }
                    }
                }
        );   }

    @NonNull
    private void dummyInsert(NutritionDataBaseHelper nutritionDataBaseHelper) {
        Nutrition nutrition = new Nutrition();
        nutrition.setFoodName("apple");
        nutrition.setCalories(103);
        nutrition.setProtienWeight(0);
        nutrition.setCarbhydrateWeight(13);
        nutrition.setFatWeight(0);
        System.out.println(nutritionDataBaseHelper.saveFood(nutrition));
    }

    @NonNull
    private String[] getLabels() {
        BufferedReader reader =null;
        String[] labels = new String[1001];
        int count = 0;
        try {
             reader = new BufferedReader(new InputStreamReader(getAssets().open(MLHelper.LABEL_FILE_NAME)));
             String labelvalue = reader.readLine();
             while(labelvalue!=null){
                 labels[count] = labelvalue;
                 count++;
                 labelvalue=reader.readLine();
             }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return labels;
    }
}
