package com.cec.mini.calory.helper;



import android.graphics.Bitmap;

import com.cec.mini.calory.MainActivity;
import com.cec.mini.calory.ml.MobilenetV110224Quant;

import org.tensorflow.lite.DataType;
import org.tensorflow.lite.support.image.TensorImage;
import org.tensorflow.lite.support.tensorbuffer.TensorBuffer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MLHelper {

    public static final String LABEL_FILE_NAME = "labels.txt";

    public static String getFoodName(Bitmap image, MainActivity mainActivity, String[] is){
        String foodName = "";
        try {

            MobilenetV110224Quant model = MobilenetV110224Quant.newInstance(mainActivity);

            Bitmap bitmapupdated =  Bitmap.createScaledBitmap(image,224,224,true);
            // Creates inputs for reference.

            TensorBuffer inputFeature0 = TensorBuffer.createFixedSize(new int[]{1, 224, 224, 3}, DataType.UINT8);

            inputFeature0.loadBuffer(TensorImage.fromBitmap(bitmapupdated).getBuffer());

            // Runs model inference and gets result.
            MobilenetV110224Quant.Outputs outputs = model.process(inputFeature0);

            TensorBuffer outputFeature0 = outputs.getOutputFeature0AsTensorBuffer();
            foodName= is[getMax(outputFeature0.getFloatArray())];

            model.close();

            // Releases model resources if no longer used.
        } catch (IOException e) {
            System.out.println("EXCEPTION--"+e.getMessage());
        }
        return foodName;

    }


    private static int getMax(float[] input){
        int maxvalue = 0;
        for(int i=0;i<input.length;i++){
        if(input[i]>input[maxvalue]){
           maxvalue=i;
        }
    }
return maxvalue;
    }

}
