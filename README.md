This repository contains general build scripts and pipelines for all languages that I incorporate in my projects. The goal is to provide an easy retrieval and update system for the project. Each script will be a shell script containing the following template:
```bash
    #Short description about what I do
    #Language[Folder]
    # #The script's code goes in here.
    # rm -Rf out/*
    # javac -Xlint:unchecked -cp ${PROJECT_DIR}/.. -d ${OUT_DIR} ${PROJECT_DIR}/*.java
    # printf "\n\n\nRunning Program...\n\n"
    # cd $OUT_DIR
    # java ${MAIN_CLASS} "$@"
    # ../scripts/clean.sh
    
```
Each language will be in the following structure:
```
    -<Language>
    --<scripts>
    ---[script files.sh]
```

The `sig` script will display by default any scripts in the `scripts` folder, therefore when creating a project, copy over the scripts folder of the desired language into your project then the `sig` script handles the rest appropriately. If your project requires multiple languages and build setups, then you can use the `sig2` command, which has an additional parameter to specify the language when running it. When setting up a multi-language setup, you'll just copy the entire folder to include the programming language itself. So a multi-language project structure may look something like this:
```
    -C
    --scripts
    ---build.sh
    ---clean.sh
    ---make.sh
    -Java
    --scripts
    ---build.sh
    ---clean.sh
    ---jar.sh
```
