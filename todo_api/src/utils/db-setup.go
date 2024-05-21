package utils

import (
	"fmt"
	"log"
	"os"

	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func SetupDB() (*gorm.DB ,error)  {
	err := godotenv.Load(".env")
	if err != nil {
		log.Print("Error loading .env file", err)
		return nil, err
	}
	root := os.Getenv("MYSQL_ROOT_USER")
	password := os.Getenv("MYSQL_ROOT_PASSWORD")
	dbName := os.Getenv("MYSQL_DATABASE")

	// DB接続
	dsn := fmt.Sprintf("%s:%s@tcp(mysql_todo_db)/%s?charset=utf8mb4&parseTime=True&loc=Local", root, password, dbName)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	

	return db, err
}