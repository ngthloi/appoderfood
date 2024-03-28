package com.example.appfood.activity.Admin;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.appfood.adapter.TaiKhoanAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.TaiKhoan;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class TimKiemTaiKhoanActivity extends AppCompatActivity {

    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;
    EditText seach_taikhoan;
    List<TaiKhoan.Result> listTaiKhoanTimKiem;
    TaiKhoanAdapter taiKhoanAdapter;
    private int REQUEST_CODE = 1;
    Toolbar toolbar_Timkiem;
    RecyclerView recycleView_TimKiem;
    String tentaikhoan;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tim_kiem_tai_khoan);
        taiKhoanAdapter = new TaiKhoanAdapter(this, new ArrayList<>());
        getViewId();
        actionToolbar();
        actionTimKiem();
        taiKhoanAdapter.setOnClickListener(position -> {
            Intent intent = new Intent(TimKiemTaiKhoanActivity.this, TaiKhoanChiTietActivity.class);
            intent.putExtra("action","edit");
            intent.putExtra("data",taiKhoanAdapter.getList().get(position));
            startActivityForResult(intent, REQUEST_CODE);
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                int idTaiKhoan=data.getIntExtra("id_taikhoan",0);
                String action = data.getStringExtra("action");
                if(action.equals("update")) {
                    String ten = data.getStringExtra("ten");
                    String sdt = data.getStringExtra("sdt");
                    String email = data.getStringExtra("email");
                    TaiKhoan.Result taikhoan = new TaiKhoan.Result(idTaiKhoan, ten, sdt, email, "");
                    taiKhoanAdapter.updateTaiKhoan(taikhoan);
                }else{
                    taiKhoanAdapter.removeTaiKhoan(idTaiKhoan);
                }
            }
        }

    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_Timkiem);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Timkiem.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent danhSachTaiKhoan = new Intent(getApplicationContext(), DanhSachTaiKhoanActivity.class);
                startActivity(danhSachTaiKhoan);
            }
        });
    }

    private void getViewId() {
        toolbar_Timkiem = findViewById(R.id.toolbar_TimKiem);
        recycleView_TimKiem = findViewById(R.id.recycleView_TimKiem);
        seach_taikhoan = findViewById(R.id.search_tai_khoan);
        listTaiKhoanTimKiem = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        recycleView_TimKiem.setAdapter(taiKhoanAdapter);
        //set kiểu layout
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recycleView_TimKiem.setLayoutManager(layoutManager);
        recycleView_TimKiem.setHasFixedSize(true);
    }

    private void actionTimKiem(){
        seach_taikhoan.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                tentaikhoan = seach_taikhoan.getText().toString();
                Search();
                closeKeyboard();
                return false;
            }
        });
    }

    private void Search() {
        compositeDisposable.add(appFoodMethods.POST_TimKiemTaiKhoan(tentaikhoan)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        taikhoan -> {
                            if (taikhoan.isSuccess()) {
                                listTaiKhoanTimKiem = taikhoan.getResult();
                                taiKhoanAdapter.setList(listTaiKhoanTimKiem);
                            }
                        },
                        throwable -> {
                            Show.Notify(this,getString(R.string.error_server));
                        }
                ));
    }

    private void closeKeyboard()
    {
        View view = this.getCurrentFocus();
        if (view != null) {
            InputMethodManager manager
                    = (InputMethodManager)
                    getSystemService(
                            getApplicationContext().INPUT_METHOD_SERVICE);
            manager
                    .hideSoftInputFromWindow(
                            view.getWindowToken(), 0);
        }
    }
}