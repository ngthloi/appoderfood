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
import com.example.appfood.adapter.MonAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Mon;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class TimKiemMonActivity extends AppCompatActivity {

    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;
    EditText seach_mon;
    List<Mon.Result> listMonTimKiem;
    MonAdapter monAdapter;
    private int REQUEST_CODE = 1;
    Toolbar toolbar_Timkiem;
    RecyclerView recycleView_TimKiem;
    String tenmon;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tim_kiem_mon);
        monAdapter = new MonAdapter(this, new ArrayList<>());
        getViewId();
        actionToolbar();
        actionTimKiem();
        monAdapter.setOnClickListener(position -> {
            Intent intent = new Intent(TimKiemMonActivity.this, MonChiTietActivity.class);
            intent.putExtra("chitietmon",monAdapter.getList().get(position));
            intent.putExtra("action","edit");
            startActivityForResult(intent, REQUEST_CODE);
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                int idMon=data.getIntExtra("id_mon",0);
                String action = data.getStringExtra("action");
                int madanhmuc=data.getIntExtra("madanhmuc",0);
                String tenmon=data.getStringExtra("tenmon");
                String hinhmon=data.getStringExtra("hinhmon");
                String gia=data.getStringExtra("gia");
                String mota=data.getStringExtra("mota");
                Mon.Result mon=new Mon.Result(idMon,madanhmuc,tenmon,hinhmon,mota,gia);
                if(action.equals("delete")){
                    monAdapter.removeMon(idMon);
                }else{
                    monAdapter.updateMon(mon);
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
                Intent danhSachMon = new Intent(getApplicationContext(), MainAdminActivity.class);
                startActivity(danhSachMon);
            }
        });
    }

    private void getViewId() {
        toolbar_Timkiem = findViewById(R.id.toolbar_TimKiem);
        recycleView_TimKiem = findViewById(R.id.recycleView_TimKiem);
        seach_mon = findViewById(R.id.seach_mon);
        listMonTimKiem = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        recycleView_TimKiem.setAdapter(monAdapter);
        //set kiểu layout
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recycleView_TimKiem.setLayoutManager(layoutManager);
        recycleView_TimKiem.setHasFixedSize(true);
    }

    private void actionTimKiem(){
        seach_mon.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                tenmon = seach_mon.getText().toString();
                Search();
                closeKeyboard();
                return false;
            }
        });
    }

    private void Search() {
        compositeDisposable.add(appFoodMethods.POST_TimKiemMon(tenmon)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        mon -> {
                            if (mon.isSuccess()) {
                                listMonTimKiem = mon.getResult();
                                monAdapter.setList(listMonTimKiem);
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