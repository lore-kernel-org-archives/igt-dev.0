Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Sep 2021 05:33:47 -0000
Message-ID: <163289362722.27097.17989687552354568780@emeril.freedesktop.org>
References: <20210929052214.437157-1-stylon.wang@amd.com>
In-Reply-To: <20210929052214.437157-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?est/amdgpu=3A_Test_max-bpc_fallback_for_4K_modes_on_HDMI?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: test/amdgpu: Test max-bpc fallback for 4K modes on HDMI
URL   : https://patchwork.freedesktop.org/series/95188/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/411416 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/14118993):
  [885/1119] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_link_settings@ex=
e/amd_link_settings.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/534] Generating version.h with a custom command.
  [2/236] Linking target tests/perf_pmu.
  [3/236] Linking target tests/perf.
  [4/236] Linking target tests/amdgpu/amd_module_load.
  [5/236] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe -Itests/amdgpu -I../tests/amdg=
pu -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/gli=
b-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/fr=
eetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm=
/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/inc=
lude/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_=
BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -in=
clude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-afte=
r-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-=
declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-protot=
ypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-de=
cls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -W=
no-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -=
Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result =
-Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-=
self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werr=
or=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builti=
n-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/amdgpu/b9f2b=
1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_max_bpc=
@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_b=
pc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
   IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893393:step_script
  section_start:1632893393:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893395:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/14118996):
  [867/1055] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_mem_leak@exe/amd=
_mem_leak.c.o'.
  [868/1055] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vrr_range@exe/am=
d_vrr_range.c.o'.
  [869/1055] Compiling C object 'tests/59830eb@@perf@exe/i915_perf.c.o'.
  [870/1055] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/i915=
_gem_concurrent_all.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/481] Generating version.h with a custom command.
  [2/187] Linking target tests/perf.
  [3/187] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe -I=
tests/amdgpu -I../tests/amdgpu -I../include/drm-uapi -Ilib -I../lib -I../li=
b/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/i=
nclude/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/includ=
e/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aar=
ch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-co=
lor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -st=
d=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wba=
d-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallt=
hrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -=
Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definit=
ion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninit=
ialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field=
-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-un=
used-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds =
-Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werro=
r=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-in=
t-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -=
Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pt=
hread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF =
'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/=
b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
   IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893396:step_script
  section_start:1632893396:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893397:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/14118995):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/479] Generating version.h with a custom command.
  [2/186] Linking target tests/perf_pmu.
  [3/186] Linking target tests/perf.
  [4/186] Linking target tests/amdgpu/amd_basic.
  [5/186] Linking target tests/amdgpu/amd_prime.
  [6/186] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe =
-Itests/amdgpu -I../tests/amdgpu -I../include/drm-uapi -Ilib -I../lib -I../=
lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr=
/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/in=
clude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include=
/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnost=
ics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wext=
ra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D=
2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit=
-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attri=
bute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-d=
efinition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -W=
uninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing=
-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -=
Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-b=
ounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast =
-Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer=
-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigr=
aphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcomm=
on -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=
' -MF 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/a=
mdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_max_=
bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
   IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893400:step_script
  section_start:1632893400:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893401:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/14118997):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/472] Generating version.h with a custom command.
  [2/176] Linking target tests/perf_pmu.
  [3/176] Linking target tests/gem_exec_balancer.
  [4/176] Linking target tests/perf.
  [5/176] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe -Ites=
ts/amdgpu -I../tests/amdgpu -I../include/drm-uapi -Ilib -I../lib -I../lib/s=
tubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/incl=
ude/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixm=
an-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -=
I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linu=
x-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalw=
ays -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11=
 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-functio=
n-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D=
0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-=
noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoi=
nter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -=
Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initiali=
zers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-para=
meter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmai=
n -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast =
-Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread =
 -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF 'tests=
/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/b9f2b1=
d@@amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
   IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893366:step_script
  section_start:1632893366:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893367:cleanup_file_variables
  ERROR: Failed to cleanup volumes
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/14118988):
  [888/1119] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_mem_leak@exe/amd=
_mem_leak.c.o'.
  [889/1119] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vrr_range@exe/am=
d_vrr_range.c.o'.
  [890/1119] Linking target tests/amdgpu/amd_module_load.
  [891/1119] Linking target tests/amdgpu/amd_prime.
  [892/1119] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_link_settings@ex=
e/amd_link_settings.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/529] Generating version.h with a custom command.
  [2/229] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe -Itests/amdgpu -I../tests/amdg=
pu -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -=
I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/=
usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -f=
diagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-p=
ch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_S=
OURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -W=
implicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-form=
at-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold=
-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-proto=
types -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno=
-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-membe=
r -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resu=
lt -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Din=
it-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-brac=
es -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -W=
error=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-bui=
ltin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/amdgpu/b9f=
2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_max_b=
pc@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
     26 | IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high=
");
        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893390:step_script
  section_start:1632893390:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893392:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/14118992):
  IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                    ^
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected ')'
  ../tests/amdgpu/amd_max_bpc.c:26:18: note: to match this '('
  IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                   ^
  ../tests/amdgpu/amd_max_bpc.c:26:1: error: type specifier missing, defaul=
ts to 'int' [-Werror,-Wimplicit-int]
  IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
  ^
  ../tests/amdgpu/amd_max_bpc.c:26:18: warning: this function declaration i=
s not a prototype [-Wstrict-prototypes]
  IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                   ^
                                                                    void
  1 warning and 3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1632893408:step_script
  section_start:1632893408:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893408:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/14118989):
  [883/1119] Compiling C object 'tests/59830eb@@perf@exe/i915_perf.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/533] Generating version.h with a custom command.
  [2/238] Linking target tests/perf_pmu.
  [3/238] Linking target tests/perf.
  [4/238] Linking target tests/amdgpu/amd_info.
  [5/238] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max=
_bpc.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_max_bpc@exe -Itests/amdgpu -I../tests/amdg=
pu -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -=
I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr=
/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I=
/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -=
I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BI=
TS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -incl=
ude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-=
statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-de=
clarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototyp=
es -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decl=
s -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno=
-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wn=
o-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread =
-MD -MQ 'tests/amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF 'tests/=
amdgpu/b9f2b1d@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/b9f2b1d=
@@amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
     26 | IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high=
");
        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893393:step_script
  section_start:1632893393:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893395:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/14118990):
  [883/1119] Compiling C object 'tests/tests@@perf@exe/i915_perf.c.o'.
  [884/1119] Compiling C object 'tests/tests@@perf_pmu@exe/i915_perf_pmu.c.=
o'.
  [885/1119] Linking target tests/amdgpu/amd_prime.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/533] Generating version.h with a custom command.
  [2/236] Linking target tests/perf_pmu.
  [3/236] Linking target tests/perf.
  [4/236] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/am=
d_max_bpc.c.o'.
  FAILED: tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o=20
  cc -Itests/amdgpu/tests@amdgpu@@amd_max_bpc@exe -Itests/amdgpu -I../tests=
/amdgpu -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I=
../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/incl=
ude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng1=
6 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgri=
nd -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORT=
IFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-extern=
s -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstric=
t-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitializ=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packe=
d-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unus=
ed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissi=
ng-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-=
type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -=
fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/am=
dgpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF 'tests/amdgpu/tests=
@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/amdgpu/tests@amdgpu@@=
amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_max_bpc.c
  ../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifie=
rs or =E2=80=98...=E2=80=99 before string constant
     26 | IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high=
");
        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1632893393:step_script
  section_start:1632893393:cleanup_file_variables
  Cleaning up file based variables
  section_end:1632893394:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/411416
