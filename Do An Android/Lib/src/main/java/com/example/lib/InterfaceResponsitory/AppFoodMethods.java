package com.example.lib.InterfaceResponsitory;

import com.example.lib.model.BinhLuan;
import com.example.lib.model.DanhMuc;
import com.example.lib.model.Mon;
import com.example.lib.model.TaiKhoan;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface AppFoodMethods {
    @GET("danhmuc.php")
    Observable<DanhMuc> GET_DanhMuc();

    @GET("monngaunhien.php")
    Observable<Mon> GET_MonNgauNhien();

    @POST("danhsachmon.php")
    @FormUrlEncoded
    Observable<Mon> POST_DanhSachMon(
            @Field("size") int size
    );

    @POST("danhsachtaikhoan.php")
    @FormUrlEncoded
    Observable<TaiKhoan> POST_DanhSachTaiKhoan(
            @Field("size") int size
    );

    @POST("chitietdanhmuc.php")
    @FormUrlEncoded
    Observable<Mon> POST_MonTheoDanhMuc(
            @Field("madanhmuc") int madanhmuc
    );

    @POST("timkiemmon.php")
    @FormUrlEncoded
    Observable<Mon> POST_TimKiemMon(
            @Field("tenmon") String tenmon
    );

    @POST("timkiemtaikhoan.php")
    @FormUrlEncoded
    Observable<TaiKhoan> POST_TimKiemTaiKhoan(
            @Field("tentaikhoan") String tentaikhoan
    );

    @POST("binhluan.php")
    @FormUrlEncoded
    Observable<BinhLuan> POST_BinhLuan(
            @Field("mamon") String mamon
    );

}
