package com.example.appfood.activity.Admin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.util.Base64;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
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
import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.DanhMuc;
import com.example.lib.model.Mon;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MonChiTietActivity extends AppCompatActivity {

    String action,hinhAnhMoi;
    Mon.Result monResult;
    EditText edtTenMon, edtGiaMon, edtMoTaMon;
    ImageView imgHinhAnhMon,icCamera;
    LinearLayoutCompat layoutFeature;
    private int REQUEST_CODE_FOLDER=456;
    Toolbar toolbar_Mon;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    List<DanhMuc.Result> listDanhMucResult;
    Bitmap image;
    int index=0;
    Button btnDelete, btnConfirm, btnAdd;
    AppFoodMethods appFoodMethods;
    Spinner spinner;
    TextView message_name,message_price,message_describe;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mon_chi_tiet);
        action=getIntent().getStringExtra("action");
        monResult = (Mon.Result) getIntent().getSerializableExtra("chitietmon");
        getViewId();
        hinhAnhMoi="";
        image = BitmapFactory.decodeResource(getResources(), R.drawable.ic_account);
        if(action.equals("edit")){
            edtTenMon.setText(monResult.getTenmon());
            edtGiaMon.setText(monResult.getGia());
            edtMoTaMon.setText(monResult.getMota());
            Glide.with(MonChiTietActivity.this).load(Url.linkMon + monResult.getHinhmon())
                    .placeholder(R.drawable.img_default)
                    .error(R.drawable.img_error)
                    .into(imgHinhAnhMon);
            layoutFeature.setVisibility(View.VISIBLE);
            btnAdd.setVisibility(View.GONE);
            hinhAnhMoi=monResult.getHinhmon();
        }else{
            btnAdd.setVisibility(View.VISIBLE);
            layoutFeature.setVisibility(View.GONE);
        }

        listDanhMucResult = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        actionToolbar();
        if(NetworkConnection.isConnected(this)) {
            getDanhMuc();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                index=position;
            }
            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
            }
        });
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AddMon(new Mon.Result(0,listDanhMucResult.get(index).getId(),edtTenMon.getText().toString(),(hinhAnhMoi.length()>0)?"Yes":"",edtMoTaMon.getText().toString(),edtGiaMon.getText().toString()),image);
            }
        });

        btnConfirm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(edtTenMon.getText().toString().length()==0){
                    message_name.setVisibility(View.VISIBLE);
                    message_price.setVisibility(View.GONE);
                    message_describe.setVisibility(View.GONE);
                }else{
                    if(edtGiaMon.getText().toString().length()==0){
                        message_name.setVisibility(View.GONE);
                        message_price.setVisibility(View.VISIBLE);
                        message_describe.setVisibility(View.GONE);
                    }else{
                        if(edtMoTaMon.getText().toString().length()==0) {
                            message_name.setVisibility(View.GONE);
                            message_price.setVisibility(View.GONE);
                            message_describe.setVisibility(View.VISIBLE);
                        }else{
                            message_name.setVisibility(View.GONE);
                            message_price.setVisibility(View.GONE);
                            message_describe.setVisibility(View.GONE);
                            monResult.setGia(edtGiaMon.getText().toString());
                            monResult.setMota(edtMoTaMon.getText().toString());
                            monResult.setTenmon(edtTenMon.getText().toString());
                            monResult.setMadanhmuc(listDanhMucResult.get(index).getId());
                            UpdateMon(monResult,image);
                        }
                    }
                }

            }
        });

        btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deleteMon();
            }
        });

    }

    private void deleteMon() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.deleteMon, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.equals("Done")){
                    Toast.makeText(MonChiTietActivity.this, "Xoá món thành công!", Toast.LENGTH_SHORT).show();
                    Intent returnIntent = new Intent();
                    returnIntent.putExtra("id_mon", monResult.getId());
                    returnIntent.putExtra("action", "delete");
                    setResult(Activity.RESULT_OK, returnIntent);
                    finish();
                }else {
                    Toast.makeText(MonChiTietActivity.this, "Xoá món không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MonChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("id", monResult.getId()+"");
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void AddMon(Mon.Result mon, Bitmap bitmap) {
        String encodedImage = "";

        if (bitmap != null) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
            byte[] imageBytes = baos.toByteArray();
            encodedImage = Base64.encodeToString(imageBytes, Base64.DEFAULT);
        }
        String finalEncodedImage = encodedImage;
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.addMon, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(response.equals("Done")){
                    Toast.makeText(MonChiTietActivity.this, "Thêm món thành công!", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(getApplicationContext(), MainAdminActivity.class);
                    startActivity(intent);
                }else {
                    Toast.makeText(MonChiTietActivity.this, "Thêm món không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MonChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("madanhmuc", mon.getMadanhmuc()+"");
                param.put("tenmon", mon.getTenmon());
                param.put("mota", mon.getMota());
                param.put("hinhanhmon", mon.getHinhmon());
                param.put("file", finalEncodedImage);
                param.put("gia", mon.getGia());
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void UpdateMon(Mon.Result mon, Bitmap bitmap) {
        String encodedImage = "";

        if (bitmap != null) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
            byte[] imageBytes = baos.toByteArray();
            encodedImage = Base64.encodeToString(imageBytes, Base64.DEFAULT);
        }
        String finalEncodedImage = encodedImage;
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, Url.updateMon, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                if(!response.equals("Error")){
                    Toast.makeText(MonChiTietActivity.this, "Cập nhật món thành công!", Toast.LENGTH_SHORT).show();
                    Intent returnIntent = new Intent();
                    returnIntent.putExtra("id_mon", monResult.getId());
                    returnIntent.putExtra("action", "update");
                    returnIntent.putExtra("madanhmuc",mon.getMadanhmuc());
                    returnIntent.putExtra("tenmon",mon.getTenmon());
                    returnIntent.putExtra("hinhmon",(hinhAnhMoi.equals(monResult.getHinhmon())?hinhAnhMoi:response));
                    returnIntent.putExtra("gia",mon.getGia());
                    returnIntent.putExtra("mota",mon.getMota());
                    setResult(Activity.RESULT_OK, returnIntent);
                    finish();
                }else {
                    Toast.makeText(MonChiTietActivity.this, "Cập nhật món không thành công!", Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(MonChiTietActivity.this, "e" + error.toString(), Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("id",monResult.getId()+"");
                param.put("madanhmuc", mon.getMadanhmuc()+"");
                param.put("tenmon", mon.getTenmon());
                param.put("hinhanhmon", (hinhAnhMoi.equals(monResult.getHinhmon())?"":hinhAnhMoi));
                param.put("file", finalEncodedImage);
                param.put("mota", mon.getMota());
                param.put("gia", mon.getGia());
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    public static Bitmap uriToBitmap(Context context, Uri uri) {
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            Bitmap bitmap = BitmapFactory.decodeStream(context.getContentResolver().openInputStream(uri), null, options);
            return bitmap;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if(requestCode==REQUEST_CODE_FOLDER&& resultCode==RESULT_OK&&data!=null){
            Uri uri =data.getData();
            image=uriToBitmap(this, uri);
            hinhAnhMoi = uri.toString();
            Glide.with(MonChiTietActivity.this).load(uri.toString())
                    .error(R.drawable.icon_food_gray)
                    .placeholder(R.drawable.icon_food_gray)
                    .into(imgHinhAnhMon);
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    private List<String> getNameOfList(List<DanhMuc.Result> list){
        List<String> listName=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            listName.add(list.get(i).getTendanhmuc());
        }
        return listName;
    }

    private int getIndexOfName(List<DanhMuc.Result> list,int id){
        for(int i=0;i<list.size();i++){
            if(id==list.get(i).getId()){
                return i;
            }
        }
        return 0;
    }

    private void getDanhMuc(){
        compositeDisposable.add(appFoodMethods.GET_DanhMuc()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        danhMuc -> {
                            if(danhMuc.isSuccess()) {
                                listDanhMucResult = danhMuc.getResult();
                                List<String> listName=getNameOfList(listDanhMucResult);
                                ArrayAdapter<String> adapterDanhMuc=new ArrayAdapter<>(this,R.layout.item_spinner,listName);
                                adapterDanhMuc.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                                spinner.setAdapter(adapterDanhMuc);
                                if(action.equals("edit")) {
                                    index = getIndexOfName(listDanhMucResult, monResult.getMadanhmuc());
                                    spinner.setSelection(index);
                                }else{
                                    spinner.setSelection(index);
                                }
                            }
                        },
                        throwable -> {
                            Show.Notify(this,getString(R.string.error_server));
                        }
                ));
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
    private void actionToolbar() {
        setSupportActionBar(toolbar_Mon);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Mon.setNavigationOnClickListener(view -> finish());
    }
    private void getViewId() {
        toolbar_Mon = findViewById(R.id.toolbar_Chitietmon);
        btnDelete = findViewById(R.id.btnDelete);
        layoutFeature = findViewById(R.id.layout_feature);
        btnAdd = findViewById(R.id.btnSave);
        btnConfirm = findViewById(R.id.btnConfirm);
        imgHinhAnhMon = findViewById(R.id.hinhmon_chitiet);
        icCamera = findViewById(R.id.img_camera);
        edtTenMon = findViewById(R.id.txt_ten_mon);
        edtGiaMon = findViewById(R.id.txt_price);
        edtMoTaMon = findViewById(R.id.txt_mo_ta);
        spinner = findViewById(R.id.sp_danh_muc);
        message_name = findViewById(R.id.message_name);
        message_price = findViewById(R.id.message_price);
        message_describe = findViewById(R.id.message_describe);
    }

    public void addImage(View view) {
        Intent intent=new Intent(Intent.ACTION_PICK);
        intent.setType("image/*");
        startActivityForResult(intent,REQUEST_CODE_FOLDER);
    }
}