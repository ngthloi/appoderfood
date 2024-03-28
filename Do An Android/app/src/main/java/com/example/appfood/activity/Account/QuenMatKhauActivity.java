
package com.example.appfood.activity.Account;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.example.appfood.R;

public class QuenMatKhauActivity extends AppCompatActivity {
    TextView tvLogin_forgetpw, tvRegister_forgetpw;
    Toolbar toolbar_QuenMatKhau;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quen_mat_khau);
        getViewId();
        actionToolbar();
        event();
    }

    private void event() {

    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_QuenMatKhau);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_QuenMatKhau.setNavigationOnClickListener(view -> finish());
        tvLogin_forgetpw.setOnClickListener(view -> startActivity(new Intent(QuenMatKhauActivity.this, DangNhapActivity.class)));
        tvRegister_forgetpw.setOnClickListener(view -> startActivity(new Intent(QuenMatKhauActivity.this, DangKyActivity.class)));
    }

    private void getViewId() {
        toolbar_QuenMatKhau = findViewById(R.id.toolbar_QuenMatKhau);
        tvLogin_forgetpw = findViewById(R.id.tvLogin_forgetpw);
        tvRegister_forgetpw = findViewById(R.id.tvRegister_forgetpw);
    }
}