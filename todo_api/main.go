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
	app, err := utils.SetupFirebaseApp()
	if err != nil {
		log.Printf("failed to setup firebase app: %v", err)
		http.Error(nil, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	authClient, authError := utils.InitializeFirebaseAuthClient(app)

	if authError != nil {
		log.Printf("failed to initialize Firebase Auth client: %v", authError)
		return
	}

	db, error := utils.SetupDB()
	if error != nil {
		log.Printf("failed to connect database: %v", error)
		http.Error(nil, "Internal Server Error", http.StatusInternalServerError)
		return
	}

	db.AutoMigrate(&models.Todo{}, &models.User{})
	todoRepository := repositories.SetupTodoRepository(db)
	todoService := services.SetupTodoService(todoRepository)
	todoHandler := utils.SetupTodoHandler(todoService)
	r := gin.Default()
	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE"},
		AllowHeaders:     []string{"Origin", "Content-Type"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}))
	todoRouter := r.Group("/todos")
	todoRouter.Use(utils.AuthMiddleware(authClient))
	{
		r.GET("/", todoHandler.GetTodos)
		todoRouter.POST("/", todoHandler.CreateTodo)
		todoRouter.PUT("/:id", todoHandler.UpdateTodo)
		todoRouter.DELETE("/:id", todoHandler.DeleteTodo)
	}
	r.Run()
}
