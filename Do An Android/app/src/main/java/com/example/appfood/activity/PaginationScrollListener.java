package com.example.appfood.activity;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

public abstract class PaginationScrollListener extends RecyclerView.OnScrollListener {

    private LinearLayoutManager mLinearLayoutManager;

    public PaginationScrollListener(LinearLayoutManager LinearLayoutManager){
        this.mLinearLayoutManager=LinearLayoutManager;
    }

    @Override
    public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
        super.onScrolled(recyclerView, dx, dy);

        int visibleItemCount=mLinearLayoutManager.getChildCount();
        int totalItemCount=mLinearLayoutManager.getItemCount();
        int firstVisibleItemPosition=mLinearLayoutManager.findFirstVisibleItemPosition();

        if(isLoading() || isLastPage()){
            return;
        }

        if(firstVisibleItemPosition>=0 && (visibleItemCount+firstVisibleItemPosition)>=totalItemCount){
            loadMoreItems();
        }

    }
    public abstract void loadMoreItems();
    public abstract boolean isLoading();
    public abstract boolean isLastPage();

    public abstract void onScrolledUp();
}
