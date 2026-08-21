import pymysql
import pymysql.cursors

# === НАСТРОЙКИ ===
DB_HOST = '127.0.0.1'
DB_USER = 'root'
DB_PASSWORD = 'admin'  # Твой пароль
DB_NAME = 'auth'
OUTPUT_FILE = 'auth.sql'

# === ПОДКЛЮЧЕНИЕ ===
connection = pymysql.connect(
    host=DB_HOST,
    user=DB_USER,
    password=DB_PASSWORD,
    database=DB_NAME,
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

def get_tables():
    with connection.cursor() as cursor:
        cursor.execute("SHOW FULL TABLES WHERE Table_Type = 'BASE TABLE'")
        return [row['Tables_in_' + DB_NAME] for row in cursor.fetchall()]

def get_create_table(table_name):
    with connection.cursor() as cursor:
        cursor.execute(f"SHOW CREATE TABLE `{table_name}`")
        row = cursor.fetchone()
        return row['Create Table']

def get_first_row(table_name):
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM `{table_name}` LIMIT 1")
        return cursor.fetchone()

def generate_insert(table_name, row):
    if not row:
        return None
    columns = ', '.join([f'`{col}`' for col in row.keys()])
    values = []
    for val in row.values():
        if val is None:
            values.append('NULL')
        elif isinstance(val, (int, float)):
            values.append(str(val))
        else:
            escaped = str(val).replace('\\', '\\\\').replace("'", "\\'").replace('"', '\\"')
            values.append(f"'{escaped}'")
    return f"INSERT INTO `{table_name}` ({columns}) VALUES ({', '.join(values)});"

def main():
    print(f'📦 Подключение к БД: {DB_NAME}')
    tables = get_tables()
    print(f'✅ Найдено таблиц: {len(tables)}')

    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        for table in tables:
            print(f'  📄 Обработка: {table}')
            # Структура
            create_sql = get_create_table(table)
            f.write(f'\n-- ==========================================\n')
            f.write(f'-- Table: {table}\n')
            f.write(f'-- ==========================================\n')
            f.write(create_sql + ';\n\n')
            
            # Данные (1 строка)
            row = get_first_row(table)
            if row:
                insert_sql = generate_insert(table, row)
                if insert_sql:
                    f.write(insert_sql + '\n\n')
            else:
                f.write(f'-- (Table {table} is empty)\n\n')

    print(f'\n✅ Готово! Файл сохранён: {OUTPUT_FILE}')

if __name__ == '__main__':
    main()