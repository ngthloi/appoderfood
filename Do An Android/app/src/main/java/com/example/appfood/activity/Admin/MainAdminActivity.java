package com.example.appfood.activity.Admin;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.appfood.activity.MainActivity;
import com.example.appfood.activity.PaginationScrollListener;
import com.example.appfood.activity.TaiKhoanActivity;
import com.example.appfood.adapter.MonAdapter;
import com.example.appfood.adapter.NavAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.NavForm;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Mon;
import com.google.android.material.navigation.NavigationView;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainAdminActivity extends AppCompatActivity {

    Toolbar toolbar_Home;
    RecyclerView recycleView_Mon;
    NavigationView navigationView;
    ListView listView_NavHome;
    DrawerLayout drawerLayout;
    NavAdapter navAdapter;
    private boolean mIsLastPage;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;
    private int REQUEST_CODE = 1;

    List<Mon.Result> listMonResult;
    private boolean mIsLoading,showMore;
    MonAdapter monAdapter;
    boolean isLoading = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_admin);
        showMore=true;
        mIsLoading = false;
        getViewId();
        actionToolbar();
        khoitao();
        setNav();

        //check network
        if(NetworkConnection.isConnected(this)) {
            GetMonNgauNhien();
            ChuyenTrang();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }

        monAdapter.setOnClickListener(position -> {
            Intent intent = new Intent(MainAdminActivity.this, MonChiTietActivity.class);
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
    private void loadNextPage() {
        Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                mIsLoading = false;
                GetMonNgauNhien();
            }
        }, 1000);
    }

    private void setNav() {
        //list tùy chọn nav
        navAdapter = new NavAdapter(MainAdminActivity.this,R.layout.item_list_nav);
        listView_NavHome.setAdapter(navAdapter);
        navAdapter.add(new NavForm(R.drawable.icon_food,getString(R.string.food)));
        navAdapter.add(new NavForm(R.drawable.icon_manage_account,getString(R.string.manage_account)));
        navAdapter.add(new NavForm(R.drawable.ic_account,getString(R.string.account)));
    }

    private void ChuyenTrang() {
        listView_NavHome.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                drawerLayout.closeDrawer(GravityCompat.START);
                switch (i) {
                    case 0:
                        Intent danhSachMon = new Intent(getApplicationContext(), MainAdminActivity.class);
                        startActivity(danhSachMon);
                        break;
                    case 1:
                        Intent dachSachTaiKhoan = new Intent(getApplicationContext(), DanhSachTaiKhoanActivity.class);
                        startActivity(dachSachTaiKhoan);
                        break;
                    case 2:
                        Intent taiKhoan = new Intent(getApplicationContext(), TaiKhoanActivity.class);
                        startActivity(taiKhoan);
                        break;
                }
            }
        });
    }

    private void GetMonNgauNhien() {
        compositeDisposable.add(appFoodMethods.POST_DanhSachMon(monAdapter.getList().size())
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        mon -> {
                            if(mon.isSuccess()) {
                                listMonResult = mon.getResult();
                                if (listMonResult.size() == 0) showMore = false;
                                if(monAdapter.getList().size()==0){
                                    monAdapter.setList(listMonResult);
                                }else{
                                    if(monAdapter.getList().size()>0) {
                                        monAdapter.addAllList(listMonResult);
                                    }
                                }

                            }
                        },
                        throwable -> {
                            Show.Notify(this,"Không thể kết nối với Server!");
                        }
                ));
    }




    private void actionToolbar() {
        setSupportActionBar(toolbar_Home);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Home.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    private void getViewId() {
        toolbar_Home = findViewById(R.id.toolbar_Home);
        recycleView_Mon = findViewById(R.id.recycleView_Mon);
        navigationView = findViewById(R.id.navigationView);
        listView_NavHome = findViewById(R.id.listView_NavHome);
        drawerLayout = findViewById(R.id.drawerLayout);

    }

    private void khoitao() {
        listMonResult = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        monAdapter = new MonAdapter(this, new ArrayList<>());
        //set layout 2 cột
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recycleView_Mon.setLayoutManager(layoutManager);
        RecyclerView.ItemDecoration itemDecoration = new DividerItemDecoration(this, DividerItemDecoration.VERTICAL);
        recycleView_Mon.addItemDecoration(itemDecoration);
        recycleView_Mon.addOnScrollListener(new PaginationScrollListener(layoutManager) {
            @Override
            public void loadMoreItems() {
                if (showMore) {
                    mIsLoading = true;
                    loadNextPage();
                }
            }

            @Override
            public boolean isLoading() {
                return mIsLoading;
            }

            @Override
            public boolean isLastPage() {
                return mIsLastPage;
            }

            @Override
            public void onScrolledUp() {

            }
        });

        recycleView_Mon.setHasFixedSize(true);
        recycleView_Mon.setAdapter(monAdapter);
    }


    public void searchMon(View view) {
        Intent timkiem = new Intent(getApplicationContext(), TimKiemMonActivity.class);
        startActivity(timkiem);
    }

    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(), MainActivity.class);
        startActivity(trangchu);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }

    public void addMon(View view) {
        Intent monchitiet = new Intent(getApplicationContext(), MonChiTietActivity.class);
        monchitiet.putExtra("action","add");
        startActivity(monchitiet);
    }
}