package com.example.appfood.activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.ViewFlipper;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.appfood.activity.Admin.MainAdminActivity;
import com.example.appfood.adapter.MonNgauNhienAdapter;
import com.example.appfood.adapter.NavAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.NavForm;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Mon;
import com.google.android.material.navigation.NavigationView;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {

    Toolbar toolbar_Home;
    ViewFlipper viewFlipper;
    RecyclerView recycleView_MonNgauNhien;
    NavigationView navigationView;
    ListView listView_NavHome;
    DrawerLayout drawerLayout;
    NavAdapter navAdapter;
    TextView thongbao_soluong;

    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;

    List<Mon.Result> listMonNgauNhienResult;
    MonNgauNhienAdapter monNgauNhienAdapter;
    private static final String FILE_NAME = "myFile";
    List<String> slider = new ArrayList<>();
    boolean isLoading = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        checkCardView();
        getViewId();
        actionToolbar();
        khoitao();
        setNav();

        //check network
        if(NetworkConnection.isConnected(this)) {
            GetSlider();
            GetMonNgauNhien();
            Show.thayDoiSoLuongGioHangNho(thongbao_soluong);
            ChuyenTrang();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void checkCardView() {
        SharedPreferences sharedPreferences = getSharedPreferences(FILE_NAME, MODE_PRIVATE);
        String user_phone = sharedPreferences.getString("user_phone", "");
        String user_password = sharedPreferences.getString("user_password", "");
        if(user_phone.equals("0999999999")){
            startActivity(new Intent(this, MainAdminActivity.class));
            finish();
        }
    }



    private void setNav() {
        //list tùy chọn nav
        navAdapter = new NavAdapter(MainActivity.this,R.layout.item_list_nav);
        listView_NavHome.setAdapter(navAdapter);
        navAdapter.add(new NavForm(R.drawable.ic_info,getString(R.string.introduce)));
        navAdapter.add(new NavForm(R.drawable.ic_menu_res,getString(R.string.menu)));
        navAdapter.add(new NavForm(R.drawable.ic_store,getString(R.string.store)));
        navAdapter.add(new NavForm(R.drawable.ic_recruit,getString(R.string.apply)));
        navAdapter.add(new NavForm(R.drawable.ic_contact,getString(R.string.contact)));
        navAdapter.add(new NavForm(R.drawable.ic_account,getString(R.string.account)));
    }

    private void ChuyenTrang() {
        listView_NavHome.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                drawerLayout.closeDrawer(GravityCompat.START);
                switch (i) {
                    case 0:
                        Intent gioithieuchung = new Intent(getApplicationContext(), GioiThieuChungActivity.class);
                        startActivity(gioithieuchung);
                        break;
                    case 1:
                        Intent danhmuc = new Intent(getApplicationContext(),DanhMucActivity.class);
                        startActivity(danhmuc);
                        break;
                    case 2:
                        Intent cuahang = new Intent(getApplicationContext(),DanhSachCuaHang.class);
                        startActivity(cuahang);
                        break;
                    case 3:
                        Intent tuyendung = new Intent(getApplicationContext(),TuyenDungActivity.class);
                        startActivity(tuyendung);
                        break;
                    case 4:
                        Intent lienhe = new Intent(getApplicationContext(),LienHeActivity.class);
                        startActivity(lienhe);
                        break;
                    case 5:
                        Intent taikhoan = new Intent(getApplicationContext(),TaiKhoanActivity.class);
                        startActivity(taikhoan);
                        break;
                }
            }
        });
    }

    private void GetSlider(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest(Request.Method.GET, Url.getSlider, null,
                response -> {
                        for(int i=0; i<=response.length(); i++){
                            try {
                                JSONObject jsonObject = response.getJSONObject(i);
                                String link = jsonObject.getString("link");
                                String newLink = Url.linkSlider + link;
                                Log.d("onResponse", newLink);
                                slider.add(newLink);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        Slider(slider);
                        },
                error -> {
                }
        );
        requestQueue.add(jsonArrayRequest);
    }

    private void GetMonNgauNhien() {
        compositeDisposable.add(appFoodMethods.GET_MonNgauNhien()
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
            mon -> {
                if(mon.isSuccess()) {
                    listMonNgauNhienResult = mon.getResult();
                    monNgauNhienAdapter = new MonNgauNhienAdapter(this, listMonNgauNhienResult);
                    recycleView_MonNgauNhien.setAdapter(monNgauNhienAdapter);
                }
            },
            throwable -> {
                Show.Notify(this,"Không thể kết nối với Server!");
            }
        ));
    }

    private void Slider(List<String> slider) {
        for (int i = 0; i< slider.size();i++) {
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(slider.get(i)).into(imageView);

            //fix imageView vào ViewFlipper
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation animation_slide_step_1 = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slider_step_1);
        Animation animation_slide_step_2 = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slider_step_2);

        viewFlipper.setInAnimation(animation_slide_step_1);
        viewFlipper.setOutAnimation(animation_slide_step_2);
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
        viewFlipper = findViewById(R.id.viewFlipper);
        recycleView_MonNgauNhien = findViewById(R.id.recycleView_MonNgauNhien);
        navigationView = findViewById(R.id.navigationView);
        listView_NavHome = findViewById(R.id.listView_NavHome);
        drawerLayout = findViewById(R.id.drawerLayout);
        thongbao_soluong = findViewById(R.id.thongbao_soluong);

    }

    private void khoitao() {
        listMonNgauNhienResult = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);

        //set layout 2 cột
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this,2);
        recycleView_MonNgauNhien.setLayoutManager(layoutManager);
        recycleView_MonNgauNhien.setHasFixedSize(true);

        //giỏ hàng
        if(Show.listGiohang == null) {
            Show.listGiohang = new ArrayList<>();
        }
    }

    public void openCart(View view) {
        Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
        startActivity(giohang);
    }

    public void searchMon(View view) {
        Intent timkiem = new Intent(getApplicationContext(),TimKiemActivity.class);
        startActivity(timkiem);
    }

    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        startActivity(trangchu);
    }
//    <FrameLayout
//    android:layout_marginTop="@dimen/margin_1_2"
//    android:layout_marginBottom="@dimen/margin_1_2"
//    android:background="@color/third"
//    android:layout_width="match_parent"
//    android:layout_height="wrap_content">
//                <LinearLayout
//    android:onClick="ToHome"
//    android:layout_gravity="center"
//    android:layout_width="wrap_content"
//    android:layout_height="match_parent">
//                    <ImageView
//    android:layout_gravity="center"
//    android:src="@drawable/logo_app"
//    android:layout_marginRight="@dimen/margin_1_2"
//    android:layout_width="@dimen/item_logo_top_size"
//    android:layout_height="@dimen/item_logo_top_size"/>
//                    <TextView
//    android:layout_width="@dimen/app_name_width"
//    android:layout_height="wrap_content"
//    android:paddingBottom="@dimen/padding_text"
//    android:paddingRight="@dimen/padding_1"
//    android:fontFamily="@font/dancing_script_medium"
//    android:text="@string/app_name"
//    android:textColor="@color/black"
//    android:textSize="@dimen/text_size_big"
//    android:textStyle="bold" />
//                </LinearLayout>
//            </FrameLayout>

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

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}