{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_clock (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/luke/Dropbox/code/exercism/haskell/clock/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/bin"
libdir     = "/home/luke/Dropbox/code/exercism/haskell/clock/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/lib/x86_64-linux-ghc-8.0.1/clock-0.0.0-C2hzRbvtHFmH8t82fVkGG2"
datadir    = "/home/luke/Dropbox/code/exercism/haskell/clock/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/share/x86_64-linux-ghc-8.0.1/clock-0.0.0"
libexecdir = "/home/luke/Dropbox/code/exercism/haskell/clock/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/libexec"
sysconfdir = "/home/luke/Dropbox/code/exercism/haskell/clock/.stack-work/install/x86_64-linux/lts-7.9/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "clock_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "clock_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "clock_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "clock_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "clock_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)