package models

type Todo struct {
	ID          uint   `json:"id" gorm:"primaryKey"`
	Title       string `json:"title"`
	Description string `json:"description"`
	Completed   bool   `json:"completed"`
	UserID      uint   `json:"userId" validate:"required"`
	CreatedAt   string `json:"createdAt" gorm:"autoCreateTime"`
	UpdatedAt   string `json:"updatedAt" gorm:"autoUpdateTime"`
	DeleteAt    string `json:"deleteAt" gorm:"autoDelete"`
}
