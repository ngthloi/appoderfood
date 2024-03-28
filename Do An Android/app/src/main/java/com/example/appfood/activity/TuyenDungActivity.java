package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.example.appfood.R;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;

public class TuyenDungActivity extends AppCompatActivity {
    Toolbar toolbar_TuyenDung;
    TextView thongbao_soluong,text_phone;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tuyen_dung);
        getViewId();
        actionToolbar();

        //check network
        if(NetworkConnection.isConnected(this)) {
            Show.thayDoiSoLuongGioHangNho(thongbao_soluong);
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_TuyenDung);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_TuyenDung.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void getViewId() {
        toolbar_TuyenDung = findViewById(R.id.toolbar_TuyenDung);
        thongbao_soluong = findViewById(R.id.thongbao_soluong);
        text_phone = findViewById(R.id.text_phone);
    }

    @Override
    protected void onStart() {
        super.onStart();
        Show.thayDoiSoLuongGioHangNho(thongbao_soluong);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Show.thayDoiSoLuongGioHangNho(thongbao_soluong);
    }


    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        startActivity(trangchu);
    }

    public void openCart(View view) {
        Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
        startActivity(giohang);
    }
}