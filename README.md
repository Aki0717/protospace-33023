# テーブル設計

## users
| Column | Type | Options |
| email     | string | null: false |
| password  | string | null: false |
| user-name | string | null: false |
| profile   | string | null: false |
| belongs   | string | null: false |
| post      | string | null: false |

### Asociation
- has_many :tweets


## tweets
| Column | Type | Options |
| image | string | null: false |
| title | string | null: false |
| concept | string | null: false |
| text | string | null: false |
| user | references | null: false, foreign_key: true |

### Asociation
- belongs_to :users

