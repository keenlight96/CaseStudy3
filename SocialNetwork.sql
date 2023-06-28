DROP DATABASE SOCIALNETWORK;
CREATE DATABASE SOCIALNETWORK;
USE SOCIALNETWORK;

CREATE TABLE Accounts (
	UserID int AUTO_INCREMENT PRIMARY KEY,
    Username varchar(30) NOT NULL UNIQUE,
    Password varchar(50) NOT NULL UNIQUE
);

CREATE TABLE Users (
	UserID int PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Birthday date,
    Gender varchar(10),
    Email varchar(50) NOT NULL UNIQUE,
    PhoneNumber varchar(10) NOT NULL UNIQUE,
    Address varchar(255),
    Role varchar(20),
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID)
);

CREATE TABLE Friendships (
	FriendshipID int AUTO_INCREMENT PRIMARY KEY,
    UserID int NOT NULL,
    FriendID int NOT NULL,
    Status varchar(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (FriendID) REFERENCES Users(UserID)
);

CREATE TABLE Posts (
	PostID int AUTO_INCREMENT PRIMARY KEY,
    UserID int NOT NULL,
    Content text,
    Timestamp timestamp,
    PostDate datetime,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Photos (
	PhotoID int AUTO_INCREMENT PRIMARY KEY,
    PostID int NOT NULL,
    PhotoSources varchar(255),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

CREATE TABLE Comments (
	CommentID int AUTO_INCREMENT PRIMARY KEY,
    PostID int NOT NULL,
    UserID int NOT NULL,
    Content text,
    CommentDate datetime,
    CommentSourceID int,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CommentSourceID) REFERENCES Comments(CommentID)
);

CREATE TABLE Likes (
	LikeID int AUTO_INCREMENT PRIMARY KEY,
    PostID int,
    CommentID int,
    UserID int NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CommentID) REFERENCES Comments(CommentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Shares (
	PostID int NOT NULL,
	UserID int NOT NULL,
    ShareDate datetime,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);










