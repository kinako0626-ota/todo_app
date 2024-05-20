package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/kinako0626-ota/todo_api/src/models"
	"github.com/kinako0626-ota/todo_api/src/utils"
)

func main() {
	db, error := utils.SetupDB()
	if error != nil {
		log.Fatalf("Error loading .env file", error)
	}
	db.AutoMigrate(&models.Todo{})
	r := gin.Default()
	// GET /todos
	r.GET("/todos", func(ctx *gin.Context) {
		// TODO: 一覧取得処理を実装する
		todos  := []models.Todo{}
		if error := db.Find(&todos).Error; error != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{
				"error": error,
			})
			return
		}
		for i, todo := range todos {
			log.Println(i, todo)
		}

		ctx.JSON(http.StatusOK, gin.H{
			"todos": todos,
		})
	})
	// POST /todo
	r.POST("/todo", func(ctx *gin.Context) {
		// リクエストボディを取得
		var todo models.Todo
	

		if error := ctx.BindJSON(&todo); error != nil {
			ctx.JSON(http.StatusBadRequest, gin.H{
				"error": error,
			})
			return
		}
		// dbに保存
		if error := db.Create(&todo).Error; error != nil {
			ctx.JSON(http.StatusInternalServerError, gin.H{
				"error": error,
			})
			return
		}
		ctx.JSON(http.StatusOK, gin.H{
			"status_code": http.StatusOK,
			"message": "add todo",
			"todo": todo,
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