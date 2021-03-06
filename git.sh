# Эта команда создаёт в текущем каталоге новый подкаталог с именем .git,
# содержащий все необходимые файлы репозитория - структуру Git репозитория.
# На этом этапе ваш проект ещё не находится под версионным контролем.
git init

# Git хранит варианты конфигурации в трех различных файлах, позволяющих
# ограничивать область видимости на уровне отдельных репозиториев (локальный),
# пользователя (глобальный) или всей системы (системный):
# Укажите имя автора, которое будет использоваться для всех коммитов в текущем репозитории.
# Обычно для настройки параметров конфигурации для текущего пользователя используется флаг --global.
# git config --global user.name <name>
# Эта команда задает имя автора, которое будет использоваться для всех коммитов,
# выполненных текущим пользователем.
# https://www.atlassian.com/ru/git/tutorials/setting-up-a-repository
git config user.name "My Name"
git config user.email myEmail@example.com

# .gitignore - файл, который позволяет вести список игнорируемых файлов.

# Если вы хотите добавить под версионный контроль существующие файлы
# (в отличие от пустого каталога), вам стоит добавить их в индекс и осуществить
# первый коммит изменений. Добиться этого вы сможете запустив команду git add
# несколько раз, указав индексируемые файлы, а затем выполнив git commit.
git add .
git commit -m "Initial commit"
git commit --amend
git commit --amend -m "an updated commit message"
git commit --amend --no-edit

git rm --cached

# По умолчанию команда git diff выводит все неподтвержденные изменения,
# внесенные после последнего коммита.
# https://www.atlassian.com/ru/git/tutorials/saving-changes/git-diff
git diff

# Команда git status отображает состояние рабочего каталога и раздела
# проиндексированных файлов. С ее помощью можно проверить индексацию изменений
# и увидеть файлы, которые не отслеживаются Git.
# Команда git status относительно проста в использовании.
# Она показывает, какие изменения были внесены с помощью команд git add и git commit.
# Сообщения о состоянии также содержат инструкции по индексированию
# файлов либо отмене этой операции.
# https://www.atlassian.com/ru/git/tutorials/inspecting-a-repository
git status

# Команда git log отображает отправленные снимки состояния и позволяет просматривать
# и фильтровать историю проекта, а также искать в ней конкретные изменения.
# https://www.atlassian.com/ru/git/tutorials/inspecting-a-repository
git log
git log -n 20
git log --oneline
git log --stat

# Команда git stash сохраняет неподтвержденные изменения (индексированные и неиндексированные)
# в отдельном хранилище, чтобы вы могли вернуться к ним позже.
# Затем происходит откат до исходной рабочей копии.
# Чтобы применить ранее отложенные изменения, воспользуйтесь командой git stash pop.
# При извлечении отложенных изменений они удаляются из набора и применяются к рабочей копии.
# Вы также можете применить изменения к рабочей копии, не удаляя их из набора отложенных изменений.
# Для этого воспользуйтесь командой git stash apply.
# https://www.atlassian.com/ru/git/tutorials/saving-changes/git-stash
git stash
git stash pop
git stash apply

# После настройки удаленного репозитория его URL-адрес нужно добавить
# в локальный файл git config, а также создать вышестоящую ветку для локальных веток.
# Такую возможность предоставляет команда git remote.
# git remote add <remote_name> <remote_repo_url>
# Эта команда привяжет удаленный репозиторий по адресу к ссылке в вашем
# локальном репозитории.
git remote add origin git@gitlab.com:x55aah/app.git

# После привязки удаленного репозитория в него можно будет отправлять
# локальные ветки с помощью команды push.
# git push -u <remote_name> <local_branch_name>
# Эта команда поместит ветку локального репозитория с именем <local_branch_name>
# в удаленный репозиторий <remote_name>.
git push -u origin master
git push origin master
git push

# Если проект уже настроен в центральном репозитории, наиболее распространенным
# способом создать его локальный клон является команда clone.
# Клонирование, как и команда git init, обычно выполняется один раз.
# Получив рабочую копию, разработчик в дальнейшем выполняет все операции
# контроля версий из своего локального репозитория.
git clone git@gitlab.com:x55aah/app.git

# Команда git branch позволяет создавать, просматривать, переименовывать и удалять ветки.
# Она не дает возможности переключаться между ветками или выполнять слияние разветвленной истории.
# https://www.atlassian.com/ru/git/tutorials/using-branches

# Отображение списка веток в репозитории.
git branch
# Создание новой ветки с именем new_feature.
# Эта команда не выполняет переключение на эту новую ветку.
git branch new_feature
# Удаление указанной ветки. Это «безопасная» операция, поскольку Git
# не позволит удалить ветку, если в ней есть неслитые изменения.
git branch -d new_feature
# Принудительное удаление указанной ветки, даже если в ней есть неслитые изменения.
# Эта команда используется, если вы хотите навсегда удалить все коммиты,
# связанные с определенным направлением разработки.
git branch -D new_feature
# Изменение имени текущей ветки на new_branch_name.
git branch -m new_branch_name

# Команда git checkout позволяет перемещаться между ветками,
# созданными командой git branch. При переключении ветки происходит
# обновление файлов в рабочем каталоге в соответствии с версией,
# хранящейся в этой ветке, а Git начинает записывать все новые коммиты в этой ветке.
# https://www.atlassian.com/ru/git/tutorials/using-branches/git-checkout

# Переключение веток
git checkout existant_branch
# одновременно создается ветка <новая-ветка> и сразу же выполняется переключение на нее.
# Опция -b — это удобный способ сообщить системе Git, чтобы она выполнила команду
# git branch <новая-ветка> перед выполнением команды git checkout <новая-ветка>.
git checkout -b new_branch

# Слияние используется в Git, чтобы собрать воедино разветвленную историю.
# Команда git merge выполняет слияние отдельных направлений разработки,
# созданных с помощью команды git branch, в единую ветку.
git merge some_branch

# Команда git pull используется для извлечения и загрузки содержимого из
# удаленного репозитория и немедленного обновления локального репозитория
# этим содержимым.
# https://www.atlassian.com/ru/git/tutorials/syncing/git-pull
git pull origin master
