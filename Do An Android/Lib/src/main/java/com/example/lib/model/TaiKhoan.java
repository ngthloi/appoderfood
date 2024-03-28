package com.example.lib.model;

import java.io.Serializable;
import java.util.List;

public class TaiKhoan implements Serializable {
    public static class Result implements Serializable {
        private int id;
        private String tenkhachhang;
        private String sdt;
        private String email;
        private String matkhau;

        public Result(int id, String tenkhachhang, String sdt, String email, String matkhau) {
            this.id = id;
            this.tenkhachhang = tenkhachhang;
            this.sdt = sdt;
            this.email = email;
            this.matkhau = matkhau;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getTenkhachhang() {
            return tenkhachhang;
        }

        public void setTenkhachhang(String tenkhachhang) {
            this.tenkhachhang = tenkhachhang;
        }

        public String getSdt() {
            return sdt;
        }

        public void setSdt(String sdt) {
            this.sdt = sdt;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getMatkhau() {
            return matkhau;
        }

        public void setMatkhau(String matkhau) {
            this.matkhau = matkhau;
        }
    }
    boolean success;
    String message;
    List<TaiKhoan.Result> result;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Result> getResult() {
        return result;
    }

    public void setResult(List<Result> result) {
        this.result = result;
    }
}
