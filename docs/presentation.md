# Презентация проекта

## Ссылка на презентацию

- [Открыть презентацию (PDF)](https://github.com/fpmi-pmvs2026/pmvs12b-project-dka-team/blob/main/docs/presentation/presentation.pdf)

## Краткое содержание презентации

Презентация отражает:

1. **Цель проекта и контекст**
   - разработка Android-приложения NewsAppDemo для получения новостей через NewsAPI;
   - сценарий использования: подписки на темы, просмотр и обновление новостей.

2. **Функциональные требования (Use Case)**
   - UC-01: подписки (добавление/удаление темы, выбор активных тем для фильтрации);
   - UC-02: статьи (загрузка из NewsAPI, ручное и фоновое обновление, очистка локальных статей);
   - UC-03: просмотр (карточка статьи, открытие в браузере, шаринг ссылки);
   - UC-04: настройки (язык RU/EN/FR/DE, интервал, уведомления, Wi-Fi only).

3. **Архитектура приложения**
   - Clean Architecture + MVVM со слоями `presentation`, `domain`, `data`;
   - `presentation`: Jetpack Compose UI, ViewModel/StateFlow, NavGraph;
   - `domain`: use case, entities (`Article`, `Settings`), repository interfaces;
   - `data`: Room (SQLite), Retrofit + NewsAPI, DataStore, WorkManager;
   - стек: Kotlin, Hilt, Retrofit, Room, WorkManager, Coil, Material 3, Compose.

4. **Схема базы данных**
   - таблицы `subscriptions` и `articles`;
   - составной ключ `articles`: (`url`, `topic`);
   - внешний ключ `articles.topic -> subscriptions.topic`;
   - связь `1:N` и каскадное удаление (`ON DELETE CASCADE`);
   - индекс `index_articles_topic` для ускорения выборки статей по теме.

5. **Организация разработки**
   - основной репозиторий: `pmvs12b-project-dka-team`;
   - исходный код приложения вынесен в git-сабмодуль `code`;
   - документация хранится в `docs` (включая функциональные требования и схему БД);
   - git-поток: основная ветка `main`, разработка через Pull Request и code review;
   - CI/CD в GitHub Actions: сборка и тесты (`testDebugUnitTest`, `assembleDebug`, `assembleDebugAndroidTest`) с опциональным Firebase Test Lab.

6. **Распределение задач в команде**
   - участник 1: доменный слой, use-case, Room (entities/DAO), DataStore;
   - участник 2: UI на Compose (экраны), Navigation/NavGraph, ViewModel + StateFlow, Coil;
   - участник 3: интеграция Retrofit + NewsAPI, WorkManager, GitHub Actions CI/CD, документация;
   - имена участников указываются в финальной версии презентации.

7. **Итоги проекта**
   - реализовано: подписки и фильтрация новостей, локальный кэш Room, фоновые обновления, уведомления (Android 13+), persist-настройки в DataStore, CI/CD;
   - возможные улучшения: пагинация (Paging 3), полнотекстовый поиск в Room, экран детального просмотра статьи, виджет, поддержка профилей, расширенное тестирование.
