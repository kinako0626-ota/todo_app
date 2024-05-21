package repositories

import (
	"github.com/kinako0626-ota/todo_api/src/models"
	"gorm.io/gorm"
)

type TodoRepository interface {
	GetTodos() ([]models.Todo, error)
	CreateTodo(todo models.Todo) (models.Todo, error)
	UpdateTodo(id string, updateTodo models.Todo) (models.Todo, error)
	DeleteTodo(id string) error
}

type todoRepository struct {
	db *gorm.DB
}

func SetupTodoRepository(db *gorm.DB) TodoRepository {
	return &todoRepository{db: db}
}

func (r *todoRepository) GetTodos() ([]models.Todo, error) {
	var todos []models.Todo
	if err := r.db.Find(&todos).Error; err != nil {
		return nil, err
	}
	return todos, nil
}

func (r *todoRepository) CreateTodo(todo models.Todo) (models.Todo, error) {
	if err := r.db.Create(&todo).Error; err != nil {
		return models.Todo{}, err
	}
	return todo, nil
}

func (r *todoRepository) UpdateTodo(id string, updateTodo models.Todo) (models.Todo, error) {
	var todo models.Todo
	if err := r.db.Model(&todo).Where("id = ?", id).Updates(updateTodo).Error; err != nil {
		return models.Todo{}, err
	}
	return todo, nil
}

func (r *todoRepository) DeleteTodo(id string) error {
	if err := r.db.Where("id = ?", id).Delete(&models.Todo{}).Error; err != nil {
		return err
	}
	return nil
}