target_include_directories(${EXEC_NAME} PRIVATE .)
target_sources(${EXEC_NAME} PRIVATE
        main.cpp
        terminal_process.h
        terminal_process.cpp
)