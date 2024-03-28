package com.example.appfood.activity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.example.appfood.R;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;

public class LienHeActivity extends AppCompatActivity {
    Toolbar toolbar_Lienhe;
    TextView thongbao_soluong,text_phone;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lien_he);
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
        setSupportActionBar(toolbar_Lienhe);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Lienhe.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void getViewId() {
        toolbar_Lienhe = findViewById(R.id.toolbar_Lienhe);
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

    public void DitalPhone(View view) {
        Intent intent = new Intent(Intent.ACTION_DIAL);
        Uri uri = Uri.parse("tel:" + text_phone.getText().toString().trim());
        intent.setData(uri);
        startActivity(intent);
    }


}