package services

import (
	"github.com/kinako0626-ota/todo_api/src/models"
	"github.com/kinako0626-ota/todo_api/src/repositories"
)

type TodoService interface {
	GetAllTodos() ([]models.Todo, error)
	CreateTodo(todo models.Todo) (models.Todo, error)
	UpdateTodo(id string, updateTodo models.Todo) (models.Todo, error)
	DeleteTodo(id string) error
}

type todoService struct {
	todoRepo repositories.TodoRepository
}

func SetupTodoService(todoRepo repositories.TodoRepository) TodoService {
	return &todoService{todoRepo: todoRepo}
}

func (s *todoService) GetAllTodos() ([]models.Todo, error) {
	return s.todoRepo.GetTodos()
}

func (s *todoService) CreateTodo(todo models.Todo) (models.Todo, error) {
	return s.todoRepo.CreateTodo(todo)
}

func (s *todoService) UpdateTodo(id string, updateTodo models.Todo) (models.Todo, error) {
	return s.todoRepo.UpdateTodo(id, updateTodo)
}

func (s *todoService) DeleteTodo(id string) error {
	return s.todoRepo.DeleteTodo(id)
}