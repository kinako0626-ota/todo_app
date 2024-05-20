package utils

import (
	"fmt"
	"log"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func SetupDB(root, password, dbname string) (*gorm.DB ,error) {

	// DB接続
	dsn := fmt.Sprintf("%s:%s@tcp(mysql_todo_db)/%s?charset=utf8mb4&parseTime=True&loc=Local", root, password, dbname)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		log.Fatal(err)
	}

	return db, err
}