package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/kinako0626-ota/todo_api/src/models"
	"github.com/kinako0626-ota/todo_api/src/repositories"
	"github.com/kinako0626-ota/todo_api/src/services"
	"github.com/kinako0626-ota/todo_api/src/utils"
)

func main() {
	db, error := utils.SetupDB()
	if error != nil {
		log.Printf("failed to connect database: %v", error)
		http.Error(nil, "Internal Server Error", http.StatusInternalServerError)
		return
	}
	db.AutoMigrate(&models.Todo{})
	todoRepository := repositories.SetupTodoRepository(db)
	todoService := services.SetupTodoService(todoRepository)
	todoHandler := utils.SetupTodoHandler(todoService)
	r := gin.Default()
	r.Use(cors.New(cors.Config{
		AllowOrigins:[]string{"*"}, 
        AllowMethods:[]string{"GET", "POST", "PUT", "DELETE"},
        AllowHeaders:[]string{"Origin", "Content-Type"},
        ExposeHeaders:[]string{"Content-Length"},
        AllowCredentials: true,
        MaxAge:12 * time.Hour,

	}))
	r.GET("/todos", todoHandler.GetTodos)
	r.POST("/todos", todoHandler.CreateTodo)
	r.PUT("/todos/:id", todoHandler.UpdateTodo)
	r.DELETE("/todos/:id", todoHandler.DeleteTodo)
	r.Run()
}