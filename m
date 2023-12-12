Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5Bi-g-t=2Cv5=2C1/6=5D_lib=3A_Add_blt_command_properties_for_luna?=
 =?utf-8?q?rlake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Date: Tue, 12 Dec 2023 01:46:27 -0000
Message-ID: <170234558739.31292.9016945290649202448@emeril.freedesktop.org>
References: <cover.1702386259.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702386259.git.akshata.jahagirdar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: series starting with [i-g-t,v5,1/6] lib: Add blt command properties=
 for lunarlake
URL   : https://patchwork.freedesktop.org/series/127658/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1054838 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52650769):
  ninja: Entering directory `build'
  [1/1495] Generating version.h with a custom command.
  [2/1493] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1493] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I=
/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib=
-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/fre=
etype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/=
nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/incl=
ude/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_B=
ITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inc=
lude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after=
-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-d=
eclarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototy=
pes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-dec=
ls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wn=
o-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -W=
no-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -=
Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-s=
elf -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -=
Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werro=
r=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin=
-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/sha=
re/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DI=
GT_LOG_DOMAIN=3D"intel_blt"'  -MD -MQ 'lib/76b5a35@@igt-intel_blt_c@sta/int=
el_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o 'lib/=
76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99; did you mean =E2=80=
=98__xe_default_cpu_caching=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
      cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->fd, regi=
on);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    __xe_default_cpu_caching
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345458:step_script
  section_start:1702345458:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345459:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/52650772):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1151] Generating version.h with a custom command.
  [2/1149] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -=
I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib=
/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/u=
sr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/in=
clude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/=
libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/us=
r/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -=
D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_=
GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wde=
claration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical=
-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -W=
missing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith =
-Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wn=
o-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-p=
ointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-=
unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -=
Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D=
"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-ta=
gs/tests"' '-DIGT_LOG_DOMAIN=3D"intel_blt"'  -MD -MQ 'lib/76b5a35@@igt-inte=
l_blt_c@sta/intel_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.=
c.o.d' -o 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c ../lib/intel_=
blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99; did you mean =E2=80=
=98__xe_default_cpu_caching=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
      cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->fd, regi=
on);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    __xe_default_cpu_caching
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345464:step_script
  section_start:1702345464:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345464:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/52650771):
  [1/1168] Generating version.h with a custom command.
  [2/1166] Linking static target lib/libigt-i915_intel_decode_c.a.
  [3/1166] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [4/1166] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib=
 -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../l=
ib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-1 -I/us=
r/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/incl=
ude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gnueabihf=
 -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -=
pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 =
-g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cas=
t -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wl=
ogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noret=
urn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-=
arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunus=
ed -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers =
-Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter=
 -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpl=
icit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werr=
or=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATA=
DIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt=
-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_blt"'  -MD -MQ 'lib/76b5a35@@ig=
t-intel_blt_c@sta/intel_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@sta/inte=
l_blt.c.o.d' -o 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c ../lib/=
intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99; did you mean =E2=80=
=98__xe_default_cpu_caching=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
      cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->fd, regi=
on);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    __xe_default_cpu_caching
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345465:step_script
  section_start:1702345465:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345465:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/52650773):
  ninja: Entering directory `build'
  [1/1153] Generating version.h with a custom command.
  [2/1151] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1151] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I..=
/lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/st=
ubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/include=
/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OF=
FSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURC=
E -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration=
-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-p=
rototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredunda=
nt-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobber=
ed -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ar=
ith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-re=
sult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3D=
init-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/loc=
al/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"=
' '-DIGT_LOG_DOMAIN=3D"intel_blt"'  -MD -MQ 'lib/76b5a35@@igt-intel_blt_c@s=
ta/intel_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o=
 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99; did you mean =E2=80=
=98__xe_default_cpu_caching=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
      cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->fd, regi=
on);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    __xe_default_cpu_caching
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345465:step_script
  section_start:1702345465:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345465:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/52650770):
  ninja: Entering directory `build'
  [1/402] Generating version.h with a custom command.
  [2/400] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/400] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.=
o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I=
../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/includ=
e/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libd=
rm -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORT=
IFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-extern=
s -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstric=
t-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitializ=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wn=
o-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -W=
error=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-t=
o-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -W=
error=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point =
-Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builti=
n-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' =
'-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"in=
tel_blt"'  -MD -MQ 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -MF 'li=
b/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o 'lib/76b5a35@@igt-intel_=
blt_c@sta/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99; did you mean =E2=80=
=98__xe_default_cpu_caching=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
      cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->fd, regi=
on);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    __xe_default_cpu_caching
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345459:step_script
  section_start:1702345459:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345460:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/52650764):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1500] Generating version.h with a custom command.
  [2/1498] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1498] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I=
/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/u=
sr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member=
 -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resul=
t -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dini=
t-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-brace=
s -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -We=
rror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-buil=
tin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/sh=
are/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-D=
IGT_LOG_DOMAIN=3D"intel_blt"' -MD -MQ 'lib/76b5a35@@igt-intel_blt_c@sta/int=
el_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o 'lib/=
76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
   1815 |    cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->f=
d, region);
        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345462:step_script
  section_start:1702345462:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345463:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52650768):
          return ret;
                 ^~~
  ../lib/intel_blt.c:1745:2: note: remove the 'if' if its condition is alwa=
ys false
          if (mem->driver =3D=3D INTEL_DRIVER_XE) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_blt.c:1737:9: note: initialize the variable 'ret' to silence=
 this warning
          int ret;
                 ^
                  =3D 0
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function '__xe=
_default_cpu_caching_from_placement' is invalid in C99 [-Werror,-Wimplicit-=
function-declaration]
                          cpu_caching =3D __xe_default_cpu_caching_from_pla=
cement(blt->fd, region);
                                        ^
  4 warnings and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1702345464:step_script
  section_start:1702345464:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345465:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/52650767):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1343] Generating version.h with a custom command.
  [2/1341] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1341] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I=
/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/u=
sr/include/libdrm -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pip=
e -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g =
-D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -=
Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogi=
cal-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn=
 -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ari=
th -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused =
-Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wn=
o-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-l=
imits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3D=
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointe=
r-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3D=
pointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_=
SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_blt=
"' -MD -MQ 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -MF 'lib/76b5a3=
5@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o 'lib/76b5a35@@igt-intel_blt_c@st=
a/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
   1815 |    cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->f=
d, region);
        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345460:step_script
  section_start:1702345460:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345460:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52650765):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1499] Generating version.h with a custom command.
  [2/1497] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1497] Compiling C object 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c=
.o'.
  FAILED: lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/76b5a35@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I=
../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BIT=
S=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inclu=
de config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-s=
tatement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-dec=
larations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototype=
s -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls=
 -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-=
maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno=
-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-pa=
rameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmai=
n -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast =
-Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-D=
IGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gf=
x-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_blt"' -MD -MQ 'lib/76b5=
a35@@igt-intel_blt_c@sta/intel_blt.c.o' -MF 'lib/76b5a35@@igt-intel_blt_c@s=
ta/intel_blt.c.o.d' -o 'lib/76b5a35@@igt-intel_blt_c@sta/intel_blt.c.o' -c =
../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
   1815 |    cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->f=
d, region);
        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345462:step_script
  section_start:1702345462:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345464:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52650766):
  ninja: Entering directory `build'
  [1/1505] Generating version.h with a custom command.
  [2/1503] Linking static target lib/libigt-media_spin_c.a.
  [3/1503] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [4/1503] Compiling C object 'lib/lib@@igt-intel_blt_c@sta/intel_blt.c.o'.
  FAILED: lib/lib@@igt-intel_blt_c@sta/intel_blt.c.o=20
  cc -Ilib/lib@@igt-intel_blt_c@sta -Ilib -I../lib -I../include -I../includ=
e/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr=
/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr=
/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/i=
nclude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagn=
ostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -W=
extra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpli=
cit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-miss=
ing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wn=
o-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -W=
error=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-se=
lf -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -W=
error=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/shar=
e/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIG=
T_LOG_DOMAIN=3D"intel_blt"'  -MD -MQ 'lib/lib@@igt-intel_blt_c@sta/intel_bl=
t.c.o' -MF 'lib/lib@@igt-intel_blt_c@sta/intel_blt.c.o.d' -o 'lib/lib@@igt-=
intel_blt_c@sta/intel_blt.c.o' -c ../lib/intel_blt.c
  ../lib/intel_blt.c: In function =E2=80=98blt_create_object=E2=80=99:
  ../lib/intel_blt.c:1815:18: error: implicit declaration of function =E2=
=80=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Werror=3Dimplicit-=
function-declaration]
   1815 |    cpu_caching =3D __xe_default_cpu_caching_from_placement(blt->f=
d, region);
        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/intel_blt.c:1815:18: warning: nested extern declaration of =E2=80=
=98__xe_default_cpu_caching_from_placement=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1702345460:step_script
  section_start:1702345460:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702345461:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1054838
