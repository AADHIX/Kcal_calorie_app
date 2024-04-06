package com.cec.mini.calory.helper;

public class NutritionHelper {

    private static final double CALORIE_PROTIEN = 4;

    private static final double CALORIE_FAT = 9;


    private static final double CALORIE_CARBOHYDRATE = 4;



    public static double getCalorie(double protien,double fat, double carbs){
        return (protien*CALORIE_PROTIEN)+(fat*CALORIE_FAT)+(carbs*CALORIE_CARBOHYDRATE);
    }

    public static double getCaloriesMoreThanHundred(double calories, double unputweight){
        return (calories/100)*unputweight;

    }
}
