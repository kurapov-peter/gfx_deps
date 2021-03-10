if [[ -z "${ENABLE_SPIRV}" ]] ; then
    echo ENABLE_SPIRV is disabled by default, enable with --build-args ENABLE_SPIRV=true ;
else
    echo Building with spirv translator enabled ;
fi