# Быстрый старт: Установка Memory Bank

## 🎯 Три способа установки

### 1️⃣ Автоматическая установка (самый простой)

```bash
# Скачайте репозиторий
git clone https://github.com/feodus/antigravity-memory-bank
cd antigravity-memory-bank

# Перейдите в ваш проект
cd /path/to/your/project

# Запустите установщик
/path/to/antigravity-memory-bank/install.sh
```

### 2️⃣ Curl установка (one-liner)

```bash
# Из вашего проекта
curl -fsSL https://raw.githubusercontent.com/feodus/antigravity-memory-bank/main/install.sh | bash
```

### 3️⃣ Ручная установка (максимальный контроль)

```bash
# В вашем проекте
mkdir -p .agent/workflows .agent/memory/patterns

# Скачайте workflow файлы
curl -o .agent/workflows/init-memory.md https://raw.githubusercontent.com/.../init-memory.md
curl -o .agent/workflows/update-memory.md https://raw.githubusercontent.com/.../update-memory.md

# Создайте базовый файл
echo "# Common Tasks\n\n_No tasks yet._" > .agent/memory/patterns/common-tasks.md
```

---

## ⚙️ Настройка Antigravity

**Добавьте правила в Antigravity:**

1. Откройте `antigravity-memory-bank.md`
2. Скопируйте всё содержимое
3. Вставьте в Custom Rules вашего Antigravity
4. Сохраните

---

## 🚀 Первый запуск

```
/init-memory
```

Antigravity проанализирует проект и создаст банк памяти.

---

## ✅ Готово!

Теперь при каждой новой задаче вы увидите:

```
🧠 **Project Memory**: Active
   - Brief: ✓ [ваш проект]
   - Product: ✓ [описание]
   - Context: ✓ [текущий фокус]
   ...
```

---

📚 **Полная документация**: [INSTALLATION.md](INSTALLATION.md)
