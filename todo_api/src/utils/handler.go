package utils

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/kinako0626-ota/todo_api/src/models"
	"github.com/kinako0626-ota/todo_api/src/services"
)

type TodoHandler struct {
	todoService services.TodoService
}

func SetupTodoHandler(todoService services.TodoService) *TodoHandler {
	return &TodoHandler{todoService: todoService}
}

func (h *TodoHandler) GetTodos(ctx *gin.Context) {
	todos, err := h.todoService.GetAllTodos()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(http.StatusOK,
		todos,
	)
}

func (h *TodoHandler) CreateTodo(ctx *gin.Context) {
	var todo models.Todo
	if err := ctx.BindJSON(&todo); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	createdTodo, err := h.todoService.CreateTodo(todo)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(http.StatusCreated, gin.H{
		"status_code": http.StatusCreated,
		"message":     "add todo",
		"todo":        createdTodo,
	})
}

func (h *TodoHandler) UpdateTodo(ctx *gin.Context) {
	id := ctx.Param("id")
	var updateTodo models.Todo
	if err := ctx.BindJSON(&updateTodo); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	updatedTodo, err := h.todoService.UpdateTodo(id, updateTodo)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(http.StatusOK, gin.H{
		"status_code": http.StatusOK,
		"message":     "update todo",
		"todo":        updatedTodo,
	})
}

func (h *TodoHandler) DeleteTodo(ctx *gin.Context) {
	id := ctx.Param("id")
	err := h.todoService.DeleteTodo(id)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(http.StatusOK, gin.H{
		"status_code": http.StatusOK,
		"message":     "delete todo",
	})
}
