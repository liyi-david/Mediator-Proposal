# this file is used to test the grammar files

case $1 in
    build)
        bnfc grammar/syntax.cf -m --haskell -o grammar/target
        cd grammar/target && make
        ;;
    clean)
        rm -rf grammar/target
        ;;
    parse)
        if [ "$2" = "ALL" ]; then
            set -e
            for file in $(find ./grammar -name "*.prog"); do
                grammar/target/TestSyntax $file
            done
        else
            grammar/target/TestSyntax grammar/resources/$2.prog
        fi
        ;;
    *)
        echo "Unrecognized command : $1"
        exit 1
        ;;
esac
