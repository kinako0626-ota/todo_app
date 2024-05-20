package main

import (
	"log"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"github.com/kinako0626-ota/todo_api/src/models"
	"github.com/kinako0626-ota/todo_api/src/utils"
)

func main() {
	// env取得
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatalf("Error loading .env file", err)
	}
	root := os.Getenv("MYSQL_ROOT_USER")
	password := os.Getenv("MYSQL_ROOT_PASSWORD")
	dbname := os.Getenv("MYSQL_DATABASE")
	db, error := utils.SetupDB(root, password, dbname)
	if error != nil {
		log.Fatalf("Error loading .env file", error)
	}
	// マイグレーション
	db.AutoMigrate(&models.Todo{})
	r := gin.Default()
	// GET /todos
	r.GET("/todos", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Hello World!",
		})
	})
	// POST /todo
	r.POST("/todo", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Hello World!",
		})
	})
	// PUT /todo/:id
	r.PUT("/todo/:id", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Hello World!",
		})
	})
	// DELETE /todo/:id
	r.DELETE("/todo/:id", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"message": "Hello World!",
		})
	})
	r.Run()
}