#
# RTEMS Tools Project (http://www.rtems.org/)
# Copyright 2010-2013 Chris Johns (chrisj@rtems.org)
# All rights reserved.
#
# This file is part of the RTEMS Tools package in 'rtems-tools'.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#
# All paths in defaults must be Unix format. Do not store any Windows format
# paths in the defaults.
#
# Every entry must describe the type of checking a host must pass.
#
# Records:
#  key: type, attribute, value
#   type     : none, dir, exe, triplet
#   attribute: none, required, optional
#   value    : 'single line', '''multi line'''
#

#
# Global defaults
#
[global]

# Nothing
nil:                 none,    none,     ''

# Set to invalid values.
_bset:               none,    none,     ''
name:                none,    none,     ''
version:             none,    none,     ''
release:             none,    none,     ''

# GNU triples needed to build packages
_host:               triplet, required, ''
_build:              triplet, required, '%{_host}'
_target:             none,    optional, ''

# Paths
_host_platform:      none,    none,     '%{_host_cpu}-%{_host_vendor}-%{_host_os}%{?_gnu}'
_arch:               none,    none,     '%{_host_arch}'
_topdir:             dir,     required, '%{_cwd}'
_configdir:          dir,     optional, '%{_topdir}/config:%{_sbdir}/config'
_tardir:             dir,     optional, '%{_topdir}/tar'
_sourcedir:          dir,     optional, '%{_topdir}/sources'
_patchdir:           dir,     optional, '%{_topdir}/patches:%{_sbdir}/patches'
_builddir:           dir,     optional, '%{_topdir}/build/%{name}-%{version}-%{release}'
_buildcxcdir:        dir,     optional, '%{_topdir}/build/%{name}-%{version}-%{release}-cxc'
_docdir:             dir,     none,     '%{_defaultdocdir}'
_tmppath:            dir,     none,     '%{_topdir}/build/tmp'
_tmproot:            dir,     none,     '%{_tmppath}/source-build-%(%{__id_u} -n)/%{_bset}'
_tmpcxcroot:         dir,     none,     '%{_tmppath}/source-build-%(%{__id_u} -n)-cxc/%{_bset}'
buildroot:           dir,     none,     '%{_tmppath}/%{name}-root-%(%{__id_u} -n)'
buildcxcroot:        dir,     none,     '%{_tmppath}/%{name}-root-%(%{__id_u} -n)-cxc'
_datadir:            dir,     none,     '%{_prefix}/share'
_defaultdocdir:      dir,     none,     '%{_prefix}/share/doc'
_exeext:             none,    none,     ''
_exec_prefix:        dir,     none,     '%{_prefix}'
_bindir:             dir,     none,     '%{_exec_prefix}/bin'
_sbindir:            dir,     none,     '%{_exec_prefix}/sbin'
_libexecdir:         dir,     none,     '%{_exec_prefix}/libexec'
_datarootdir:        dir,     none,     '%{_prefix}/share'
_datadir:            dir,     none,     '%{_datarootdir}'
_sysconfdir:         dir,     none,     '%{_prefix}/etc'
_sharedstatedir:     dir,     none,     '%{_prefix}/com'
_localstatedir:      dir,     none,     '%{prefix}/var'
_includedir:         dir,     none,     '%{_prefix}/include'
_lib:                dir,     none,     'lib'
_libdir:             dir,     none,     '%{_exec_prefix}/%{_lib}'
_libexecdir:         dir,     none,     '%{_exec_prefix}/libexec'
_mandir:             dir,     none,     '%{_datarootdir}/man'
_infodir:            dir,     none,     '%{_datarootdir}/info'
_localedir:          dir,     none,     '%{_datarootdir}/locale'
_localedir:          dir,     none,     '%{_datadir}/locale'
_localstatedir:      dir,     none,     '%{_prefix}/var'
_prefix:             dir,     none,     '%{_usr}'
_usr:                dir,     none,     '/usr/local'
_usrsrc:             dir,     none,     '%{_usr}/src'
_var:                dir,     none,     '/usr/local/var'
_varrun:             dir,     none,     '%{_var}/run'

# Defaults, override in platform specific modules.
___setup_shell:      exe,     required, '/bin/sh'
__aclocal:           exe,     optional, 'aclocal'
__ar:                exe,     required, 'ar'
__arch_install_post: exe,     none,     '%{nil}'
__as:                exe,     required, 'as'
__autoconf:          exe,     required, 'autoconf'
__autoheader:        exe,     required, 'autoheader'
__automake:          exe,     required, 'automake'
__awk:               exe,     required, 'awk'
__bash:              exe,     optional, '/bin/bash'
__bison:             exe,     required, '/usr/bin/bison'
__bzip2:             exe,     required, '/usr/bin/bzip2'
__cat:               exe,     required, '/bin/cat'
__cc:                exe,     required, '/usr/bin/gcc'
__chgrp:             exe,     required, '/usr/bin/chgrp'
__chmod:             exe,     required, '/bin/chmod'
__chown:             exe,     required, '/usr/sbin/chown'
__cp:                exe,     required, '/bin/cp'
__cpp:               exe,     none,     '%{__cc} -E'
__cvs:               exe,     optional, '/usr/bin/cvs'
__cvs_z:             none,    none,     '%{__cvs} -z 9'
__cxx:               exe,     required, '/usr/bin/g++'
__flex:              exe,     required, '/usr/bin/flex'
__git:               exe,     required, '/usr/bin/git'
__grep:              exe,     required, '/usr/bin/grep'
__gzip:              exe,     required, '/usr/bin/gzip'
__id:                exe,     required, '/usr/bin/id'
__id_u:              exe,     none,     '%{__id} -u'
__install:           exe,     required, '/usr/bin/install'
__install_info:      exe,     optional, '/usr/bin/install-info'
__ld:                exe,     required, '/usr/bin/ld'
__ldconfig:          exe,     required, '/sbin/ldconfig'
__ln_s:              exe,     none,     'ln -s'
__make:              exe,     required, 'make'
__makeinfo:          exe,     required, '/usr/bin/makeinfo'
__mkdir:             exe,     required, '/bin/mkdir'
__mkdir_p:           exe,     none,     '/bin/mkdir -p'
__mv:                exe,     required, '/bin/mv'
__nm:                exe,     required, '/usr/bin/nm'
__objcopy:           exe,     optional, '/usr/bin/objcopy'
__objdump:           exe,     optional, '/usr/bin/objdump'
__patch_bin:         exe,     required, '/usr/bin/patch'
__patch_opts:        none,    none,     '%{nil}'
__patch:             exe,     none,     '%{__patch_bin} %{__patch_opts}'
__perl:              exe,     optional, 'perl'
__svn:               exe,     optional, '/usr/bin/svn'
__ranlib:            exe,     required, 'ranlib'
__rm:                exe,     required, '/bin/rm'
__rmfile:            exe,     none,     '%{__rm} -f'
__rmdir:             exe,     none,     '%{__rm} -rf'
__sed:               exe,     required, '/usr/bin/sed'
__setup_post:        exe,     none,     '%{__chmod} -R a+rX,g-w,o-w .'
__sh:                exe,     required, '/bin/sh'
__tar:               exe,     required, '/usr/bin/tar'
__tar_extract:       exe,     none,     '%{__tar} -xvvf'
__touch:             exe,     required, '/usr/bin/touch'
__unzip:             exe,     required, '/usr/bin/unzip'
__xz:                exe,     required, '/usr/bin/xz'

# Shell Build Settings.
___build_args:       none,    none,     '-e'
___build_cmd:        none,    none,     '%{?_sudo:%{_sudo} }%{?_remsh:%{_remsh} %{_remhost} }%{?_remsudo:%{_remsudo} }%{?_remchroot:%{_remchroot} %{_remroot} }%{___build_shell} %{___build_args}'
___build_post:       none,    none,     'exit 0'

# Prebuild set up script.
___build_pre:        none,    none,     '''# ___build_pre in as set up in defaults.py
# Save the original path away.
export SB_ORIG_PATH=${PATH}
# Directories
%{?_prefix:SB_PREFIX="%{_prefix}"}
%{?_prefix:SB_PREFIX_CLEAN=$(echo "%{_prefix}" | %{__sed} -e 's/^\///')}
SB_SOURCE_DIR="%{_sourcedir}"
SB_BUILD_DIR="%{_builddir}"
SB_OPT_FLAGS="%{?_tmproot:-I%{_tmproot}/${SB_PREFIX_CLEAN}/include -L%{_tmproot}/${SB_PREFIX_CLEAN}/lib} %{optflags}"
SB_ARCH="%{_arch}"
SB_OS="%{_os}"
export SB_SOURCE_DIR SB_BUILD_DIR SB_OPT_FLAGS SB_ARCH SB_OS
# Documentation
SB_DOC_DIR="%{_docdir}"
export SB_DOC_DIR
# Packages
SB_PACKAGE_NAME="%{name}"
SB_PACKAGE_VERSION="%{version}"
SB_PACKAGE_RELEASE="%{release}"
export SB_PACKAGE_NAME SB_PACKAGE_VERSION SB_PACKAGE_RELEASE
# Build directories
export SB_PREFIX
%{?_builddir:SB_BUILD_DIR="%{_builddir}"}
%{?buildroot:SB_BUILD_ROOT="%{buildroot}"}
%{?buildroot:%{?_prefix:SB_BUILD_ROOT_BINDIR="%{buildroot}/${SB_PREFIX_CLEAN}/bin"}}
export SB_BUILD_ROOT SB_BUILD_DIR SB_BUILD_ROOT_BINDIR
%{?_buildcxcdir:SB_BUILD_CXC_DIR="%{_buildcxcdir}"}
%{?buildcxcroot:SB_BUILD_CXC_ROOT="%{buildcxcroot}"}
%{?buildcxcroot:%{?_prefix:SB_BUILD_CXC_ROOT_BINDIR="%{buildcxcroot}/${SB_PREFIX_CLEAN}/bin"}}
export SB_BUILD_CXC_ROOT SB_BUILD_CXC_DIR SB_BUILD_CXC_ROOT_BINDIR
%{?_tmproot:SB_TMPROOT="%{_tmproot}"}
%{?_tmproot:%{?_prefix:SB_TMPPREFIX="%{_tmproot}/${SB_PREFIX_CLEAN}"}}
%{?_tmproot:%{?_prefix:SB_TMPBINDIR="%{_tmproot}/${SB_PREFIX_CLEAN}/bin"}}
export SB_TMPROOT SB_TMPPREFIX SB_TMPBINDIR
%{?_tmpcxcroot:SB_TMPCXCROOT="%{_tmproot}"}
%{?_tmpcxcroot:%{?_prefix:SB_TMPCXCPREFIX="%{_tmpcxcroot}/${SB_PREFIX_CLEAN}"}}
%{?_tmpcxcroot:%{?_prefix:SB_TMPCXCBINDIR="%{_tmpcxcroot}/${SB_PREFIX_CLEAN}/bin"}}
export SB_TMPCXCROOT SB_TMPCXCPREFIX SB_TMPCXCBINDIR
# The compiler flags
%{?_targetcflags:CFLAGS_FOR_TARGET="%{_targetcflags}"}
%{?_targetcxxflags:CXXFLAGS_FOR_TARGET="%{_targetcxxflags}"}
export CFLAGS_FOR_TARGET
export CXXFLAGS_FOR_TARGET
# Set up the path. Put the CXC path first.
if test -n "${SB_TMPBINDIR}" ; then
 PATH="${SB_TMPBINDIR}:$PATH"
fi
if test -n "${SB_TMPCXCBINDIR}" ; then
 PATH="${SB_TMPCXCBINDIR}:$PATH"
fi
export PATH
# Default environment set up.
LANG=C
export LANG
unset DISPLAY || :
umask 022
cd "%{_builddir}"'''

___build_shell:      none,    none,     '%{?_buildshell:%{_buildshell}}%{!?_buildshell:/bin/sh}'

___build_template:   none,    none,     '''#!%{___build_shell}
%{___build_pre}
%{nil}'''

# Configure command
configure:           none,    none,     '''
CFLAGS="${CFLAGS:-%optflags}" ; export CFLAGS ;
CXXFLAGS="${CXXFLAGS:-%optflags}" ; export CXXFLAGS ;
FFLAGS="${FFLAGS:-%optflags}" ; export FFLAGS ;
./configure --build=%{_build} --host=%{_host} \
      --target=%{_target_platform} \
      --program-prefix=%{?_program_prefix} \
      --prefix=%{_prefix} \
      --exec-prefix=%{_exec_prefix} \
      --bindir=%{_bindir} \
      --sbindir=%{_sbindir} \
      --sysconfdir=%{_sysconfdir} \
      --datadir=%{_datadir} \
      --includedir=%{_includedir} \
      --libdir=%{_libdir} \
      --libexecdir=%{_libexecdir} \
      --localstatedir=%{_localstatedir} \
      --sharedstatedir=%{_sharedstatedir} \
      --mandir=%{_mandir} \
      --infodir=%{_infodir}'''

# Default package settings
_forced_static:     none,         none, '-Xlinker -Bstatic ${LIBS_STATIC} -Xlinker -Bdynamic'
__xz:                exe,     required, '/usr/bin/xz'
