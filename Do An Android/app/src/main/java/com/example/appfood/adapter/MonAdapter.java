package com.example.appfood.adapter;


import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.lib.common.Url;
import com.example.lib.model.Mon;

import java.text.DecimalFormat;
import java.util.List;


public class MonAdapter extends RecyclerView.Adapter<MonAdapter.GetViewMonNgauNhien> {
    Context context;
    List<Mon.Result> list;

    private MonAdapter.OnClickListener onClickListener;

    public interface OnClickListener {
        void onItemClick(int position);
    }

    public void setOnClickListener(MonAdapter.OnClickListener listener) {
        this.onClickListener = listener;
    }

    public MonAdapter(Context context, List<Mon.Result> list) {
        this.context = context;
        this.list = list;
    }

    public void removeMon(int Idmon){
        int index=0;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getId()==Idmon){
                index=i;
                break;
            }
        }
        list.remove(index);
        notifyDataSetChanged();
    }

    public void updateMon(Mon.Result mon){
        for(int i=0;i<list.size();i++){
            if(list.get(i).getId()==mon.getId()){
                list.get(i).setHinhmon(mon.getHinhmon());
                list.get(i).setMadanhmuc(mon.getMadanhmuc());
                list.get(i).setTenmon(mon.getTenmon());
                list.get(i).setGia(mon.getGia());
                list.get(i).setMota(mon.getMota());
                break;
            }
        }
        notifyDataSetChanged();
    }

    public void setList(List<Mon.Result> list) {
        this.list = list;
        notifyDataSetChanged();
    }

    public void addAllList(List<Mon.Result> list){
        this.list.addAll(list);
        notifyDataSetChanged();
    }

    public List<Mon.Result> getList() {
        return list;
    }

    @NonNull
    @Override
    public GetViewMonNgauNhien onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_linear_mon,parent,false);
        GetViewMonNgauNhien getViewMonNgauNhien = new GetViewMonNgauNhien(view);
        return getViewMonNgauNhien;
    }

    @Override
    public void onBindViewHolder(@NonNull GetViewMonNgauNhien holder, int position) {
        Mon.Result monResult = list.get(position);
        int p=position;
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.gia.setText(decimalFormat.format(Double.parseDouble(monResult.getGia()))+" đ");
        holder.tenmon.setText(monResult.getTenmon());
        holder.mota.setText(monResult.getMota());
        Glide.with(context).load(Url.linkMon + monResult.getHinhmon())
                .placeholder(R.drawable.img_default)
                .error(R.drawable.img_error)
                .into(holder.hinhmon);

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

    public class GetViewMonNgauNhien extends  RecyclerView.ViewHolder{
        TextView gia,tenmon,mota;
        ImageView hinhmon;
        ConstraintLayout layoutItem;
        public GetViewMonNgauNhien(@NonNull View itemView) {
            super(itemView);
            gia = itemView.findViewById(R.id.gia);
            tenmon = itemView.findViewById(R.id.tenmon);
            mota = itemView.findViewById(R.id.mota);
            hinhmon = itemView.findViewById(R.id.hinhmon);
            layoutItem = itemView.findViewById(R.id.layout_item);
        }
    }
}
