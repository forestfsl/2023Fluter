package com.example.flutter_next_douban;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

import io.flutter.embedding.engine.FlutterEngine;

import io.flutter.plugin.common.MethodCall;

import io.flutter.plugin.common.MethodChannel;

import io.flutter.plugins.GeneratedPluginRegistrant;

//本来是kt的，更改成java
public class MainActivity extends FlutterActivity{
    private static final String CHANNEL = "next.flutter.io/battery";
    private MethodChannel methodChannel;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL);
        methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                if (call.method.equals("getBatteryLevel")) {
                    //do something
                    int batteryLevel = getBatteryLevel();
                    if (batteryLevel != - 1) {
                        result.success(batteryLevel);
                    }else{
                        result.error("Error","Fail to get battery level",null);
                    }

                } else {
                    //没有对应方法
                    result.notImplemented();
                }
            }
        });
    }

    private int getBatteryLevel() {
        int batterLevel = -1;
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager)getSystemService(BATTERY_SERVICE);
            batterLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        }else {
            Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batterLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL,-1) * 100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE,-1);
        }
        return batterLevel;
    }
    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);

    }
}
