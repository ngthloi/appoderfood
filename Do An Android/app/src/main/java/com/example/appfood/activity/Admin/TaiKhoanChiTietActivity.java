package com.example.appfood.activity.Admin;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.appcompat.widget.Toolbar;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.appfood.R;
import com.example.lib.common.Url;
import com.example.lib.common.Validate;
import com.example.lib.model.TaiKhoan;

import java.util.HashMap;
import java.util.Map;

public class TaiKhoanChiTietActivity extends AppCompatActivity {

    Button btnDelete,btnConfirm,btnAdd;
    Toolbar toolbar_TaiKhoan;
    TaiKhoan.Result taiKhoanResult;
    LinearLayoutCompat layoutFeature;
    String action;
    EditText user_name, user_phone, user_mail, user_password, user_repassword;
    TextView message_name, message_phone, message_mail, message_password, message_repassword,txtTitlePassword,txtTitleRePassword;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tai_khoan_chi_tiet);
        action=getIntent().getStringExtra("action");
        taiKhoanResult = (TaiKhoan.Result) getIntent().getSerializableExtra("data");
        getViewId();
        if(action.equals("edit")){
            btnAdd.setVisibility(View.GONE);
            layoutFeature.setVisibility(View.VISIBLE);
            user_name.setText(taiKhoanResult.getTenkhachhang());
            user_phone.setText(taiKhoanResult.getSdt());
            user_mail.setText(taiKhoanResult.getEmail());
            user_password.setText(taiKhoanResult.getMatkhau());
            user_password.setVisibility(View.GONE);
            user_repassword.setVisibility(View.GONE);
            txtTitlePassword.setVisibility(View.GONE);
            txtTitleRePassword.setVisibility(View.GONE);
        }else{
            btnAdd.setVisibility(View.VISIBLE);
            layoutFeature.setVisibility(View.GONE);
        }
        actionToolbar();
        event();
    }

    private void event() {
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = user_name.getText().toString();
                String phone = user_phone.getText().toString();
                String mail = user_mail.getText().toString();
                String password = user_password.getText().toString();
                String repassword = user_repassword.getText().toString();
                if(Validate.isValidValue(name, message_name) &&
                        Validate.isValidPhone(phone, 10, message_phone) &&
                        Validate.isValidEmail(mail, message_mail) &&
                        Validate.isValidValue(password, message_password) &&
                        Validate.isValidValue(repassword, message_repassword)){
                    if(repassword.equals(password)){
                        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.checkSigUp, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if(response.equals("Fail")){
                                    SigUp(name, phone, mail, password);
                                }else {
                                    Toast.makeText(TaiKhoanChiTietActivity.this, "Số điện thoại đã được đăng ký!", Toast.LENGTH_SHORT).show();
                                }
                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(TaiKhoanChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
                            }
                        }){
                            @Nullable
                            @Override
                            protected Map<String, String> getParams() throws AuthFailureError {
                                HashMap<String, String> param = new HashMap<String, String>();
                                param.put("sdt", phone);
                                return param;
                            }
                        };
                        requestQueue.add(stringRequest);
                    }else {
                        Toast.makeText(TaiKhoanChiTietActivity.this, "Mật khẩu không trùng nhau!", Toast.LENGTH_SHORT).show();
                    }
                }else {
                    Validate.isValidValue(name, message_name);
                    Validate.isValidPhone(phone,10 ,message_phone);
                    Validate.isValidEmail(mail, message_mail);
                    Validate.isValidValue(password, message_password);
                    Validate.isValidValue(repassword, message_repassword);
                }
            }
        });


        btnConfirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = user_name.getText().toString();
                String phone = user_phone.getText().toString();
                String mail = user_mail.getText().toString();
                if(Validate.isValidValue(name, message_name) &&
                        Validate.isValidPhone(phone, 10, message_phone) &&
                        Validate.isValidEmail(mail, message_mail)){
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.checkSigUp, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            if(response.equals("Fail")){
                                Update(name, phone, mail);
                            }else {
                                if (!taiKhoanResult.getSdt().equals(phone)) {
                                    Toast.makeText(TaiKhoanChiTietActivity.this, "Số điện thoại đã được đăng ký!", Toast.LENGTH_SHORT).show();
                                }else{
                                    Update(name, phone, mail);
                                }
                            }
                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(TaiKhoanChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
                        }
                    }){
                        @Nullable
                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            HashMap<String, String> param = new HashMap<String, String>();
                            param.put("sdt", phone);
                            return param;
                        }
                    };
                    requestQueue.add(stringRequest);
                }else {
                    Validate.isValidValue(name, message_name);
                    Validate.isValidPhone(phone,10 ,message_phone);
                    Validate.isValidEmail(mail, message_mail);
                }
            }
        });

        btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deleteAccount();
            }
        });

    }

    private void deleteAccount() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.deleteAccount, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.equals("Done")){
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Xoá tài khoản thành công!", Toast.LENGTH_SHORT).show();
                    Intent returnIntent = new Intent();
                    returnIntent.putExtra("id_taikhoan", taiKhoanResult.getId());
                    returnIntent.putExtra("action", "delete");
                    setResult(Activity.RESULT_OK, returnIntent);
                    finish();
                }else {
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Xoá tài khoản không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(TaiKhoanChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("id", taiKhoanResult.getId()+"");
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void SigUp(String user_name, String user_phone, String user_mail, String user_password) {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.sigUp, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.equals("Done")){
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Thêm tài khoản thành công!", Toast.LENGTH_SHORT).show();
                    Intent dachSachTaiKhoan = new Intent(getApplicationContext(), DanhSachTaiKhoanActivity.class);
                    startActivity(dachSachTaiKhoan);
                }else {
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Thêm tài khoản không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(TaiKhoanChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("tenkhachhang", user_name);
                param.put("sdt", user_phone);
                param.put("email", user_mail);
                param.put("matkhau", user_password);
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void Update(String user_name, String user_phone, String user_mail) {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.updateAccount, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.equals("Done")){
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Cập nhật tài khoản thành công!", Toast.LENGTH_SHORT).show();
                    Intent returnIntent = new Intent();
                    returnIntent.putExtra("id_taikhoan", taiKhoanResult.getId());
                    returnIntent.putExtra("action", "update");
                    returnIntent.putExtra("ten",user_name);
                    returnIntent.putExtra("sdt",user_phone);
                    returnIntent.putExtra("email",user_mail);
                    setResult(Activity.RESULT_OK, returnIntent);
                    finish();
                }else {
                    Toast.makeText(TaiKhoanChiTietActivity.this, "Cập nhật tài khoản không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(TaiKhoanChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("id", taiKhoanResult.getId()+"");
                param.put("tenkhachhang", user_name);
                param.put("sdt", user_phone);
                param.put("email", user_mail);
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_TaiKhoan);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_TaiKhoan.setNavigationOnClickListener(view -> finish());
        }

    private void getViewId() {
        toolbar_TaiKhoan = findViewById(R.id.toolbar_TaiKhoan);
        btnDelete = findViewById(R.id.btnDelete);
        layoutFeature = findViewById(R.id.layout_feature);
        btnAdd = findViewById(R.id.btnSave);
        btnConfirm = findViewById(R.id.btnConfirm);
        message_name = findViewById(R.id.message_name);
        message_phone = findViewById(R.id.message_phone);
        message_mail = findViewById(R.id.message_mail);
        message_password = findViewById(R.id.message_password);
        message_repassword = findViewById(R.id.message_repassword);
        user_name = findViewById(R.id.user_name_register);
        user_phone = findViewById(R.id.user_phone_register);
        user_mail = findViewById(R.id.user_mail_register);
        user_password = findViewById(R.id.user_password_register);
        user_repassword = findViewById(R.id.user_repassword_register);
        txtTitlePassword = findViewById(R.id.txt_title_password);
        txtTitleRePassword = findViewById(R.id.txt_title_repassword);
    }
}