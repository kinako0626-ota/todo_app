package main

import (
	"context"
	"log"
	"net/http"
	"time"

	"firebase.google.com/go/auth"
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
	authClient, err := app.Auth(context.Background())
	if err != nil {
		log.Printf("failed to setup firebase auth client: %v", err)
		http.Error(nil, "Internal Server Error", http.StatusInternalServerError)
		return
	}
	email := "test@gmail.com"
	password := "-Password123"
	displayName := "test"
	photoURL := "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"

	createUserParams := (&auth.UserToCreate{}).Email(email).Password(password).DisplayName(displayName).PhotoURL(photoURL).Disabled(false)

	
	user, authError:= authClient.CreateUser( context.Background(), createUserParams)

	if authError != nil {
		log.Printf("failed to create user: %v", authError)
		return
	}
	log.Printf("Successfully created user: %v", user)
	
	

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