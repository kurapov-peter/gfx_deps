if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

export LD_LIBRARY_PATH=$GFX_BUILD_HOME/neo_loader/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/neo/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/igc/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/gmm/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$GFX_BUILD_HOME/spirv/lib:$LD_LIBRARY_PATH

export CPATH=$GFX_BUILD_HOME/neo_loader/include:$CPATH
export CPATH=$GFX_BUILD_HOME/spirv/include:$CPATH

export PATH=$GFX_BUILD_HOME/spirv/bin:$PATH

export PKG_CONFIG_PATH=$GFX_BUILD_HOME/spirv/lib/pkgconfig:$PKG_CONFIG_PATH

export CMAKE_PREFIX_PATH=/gfx_deps:/gfx_deps/gmm:/gfx_deps/igc:/gfx_deps/neo:/gfx_deps/neo_loader:$CMAKE_PREFIX_PATH
