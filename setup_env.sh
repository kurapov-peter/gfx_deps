if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

export LD_LIBRARY_PATH=$GFX_BUILD_HOME/install/neo_loader/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/install/neo/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/install/igc/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/install/gmm/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/install/spirv/lib:$LD_LIBRARY_PATH

export CPATH=$GFX_BUILD_HOME/install/neo_loader/include:$CPATH
export CPATH=$GFX_BUILD_HOME/install/spirv/include:$CPATH

export PATH=$GFX_BUILD_HOME/install/spirv/bin:$PATH

export PKG_CONFIG_PATH=$GFX_BUILD_HOME/install/spirv/lib/pkgconfig:$PKG_CONFIG_PATH
