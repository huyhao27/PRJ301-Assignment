/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
/**
 *
 * @author LENOVO
 */
public class Like {
    private int userId;
    private int postId;
    private Timestamp likedAt;

    public Like() {}

    public Like(int userId, int postId, Timestamp likedAt) {
        this.userId = userId;
        this.postId = postId;
        this.likedAt = likedAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Timestamp getLikedAt() {
        return likedAt;
    }

    public void setLikedAt(Timestamp likedAt) {
        this.likedAt = likedAt;
    }
    
}
