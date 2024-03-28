package com.example.appfood.adapter;


import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.lib.model.TaiKhoan;

import java.util.List;


public class TaiKhoanAdapter extends RecyclerView.Adapter<TaiKhoanAdapter.GetViewTaiKhoan> {
    Context context;
    List<TaiKhoan.Result> list;
    private TaiKhoanAdapter.OnClickListener onClickListener;

    public interface OnClickListener {
        void onItemClick(int position);
    }

    public void setOnClickListener(TaiKhoanAdapter.OnClickListener listener) {
        this.onClickListener = listener;
    }

    public void setList(List<TaiKhoan.Result> list) {
        this.list = list;
        notifyDataSetChanged();
    }

    public void removeTaiKhoan(int IdTaiKhoan){
        int index=0;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getId()==IdTaiKhoan){
                index=i;
                break;
            }
        }
        list.remove(index);
        notifyDataSetChanged();
    }

    public void updateTaiKhoan(TaiKhoan.Result taikhoan){
        for(int i=0;i<list.size();i++){
            if(list.get(i).getId()==taikhoan.getId()){
                list.get(i).setEmail(taikhoan.getEmail());
                list.get(i).setSdt(taikhoan.getSdt());
                list.get(i).setTenkhachhang(taikhoan.getTenkhachhang());
                break;
            }
        }
        notifyDataSetChanged();
    }

    public void addAllList(List<TaiKhoan.Result> list){
        this.list.addAll(list);
        notifyDataSetChanged();
    }

    public List<TaiKhoan.Result> getList() {
        return list;
    }

    public TaiKhoanAdapter(Context context, List<TaiKhoan.Result> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public GetViewTaiKhoan onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_user,parent,false);
        GetViewTaiKhoan getViewMonNgauNhien = new GetViewTaiKhoan(view);
        return getViewMonNgauNhien;
    }

    @Override
    public void onBindViewHolder(@NonNull GetViewTaiKhoan holder, int position) {
        TaiKhoan.Result taikhoanResult = list.get(position);
        int p=position;
        holder.tenkhachhang.setText(taikhoanResult.getTenkhachhang());
        holder.email.setText(taikhoanResult.getEmail());

        if(onClickListener!=null) {
            holder.layoutItem.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    onClickListener.onItemClick(p);
                }
            });
        }
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class GetViewTaiKhoan extends  RecyclerView.ViewHolder {
        TextView tenkhachhang,email;
        CardView layoutItem;
        public GetViewTaiKhoan(@NonNull View itemView) {
            super(itemView);
            tenkhachhang = itemView.findViewById(R.id.txt_name_user);
            email = itemView.findViewById(R.id.txt_email);
            layoutItem = itemView.findViewById(R.id.layout_item_user);
        }
    }
}
