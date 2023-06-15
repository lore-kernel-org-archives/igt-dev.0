Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 15 Jun 2023 03:13:20 -0000
Message-ID: <168679880093.10725.11013479461731162461@emeril.freedesktop.org>
References: <20230615021406.131572-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230615021406.131572-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_tests/amdgpu=3A_add_bo_tests?=
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

Series: series starting with [1/2] tests/amdgpu: add bo tests
URL   : https://patchwork.freedesktop.org/series/119358/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/909515 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/43798254):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:213:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_export_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:218:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_import_sync_file=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
    r =3D amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:218:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:228:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_signal=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    r =3D amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:228:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686798418:step_script
  section_start:1686798418:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798420:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/43798257):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:213:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_export_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:218:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_import_sync_file=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
    r =3D amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:218:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:228:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_signal=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    r =3D amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:228:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686798420:step_script
  section_start:1686798420:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798421:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/43798256):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:213:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_export_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:218:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_import_sync_file=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
    r =3D amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:218:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:228:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_signal=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    r =3D amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:228:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686798441:step_script
  section_start:1686798441:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798441:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/43798258):
        amdgpu_cs_syncobj_export_sync_file
  ../tests/amdgpu/amd_syncobj.c:213:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_export_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:218:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_import_sync_file=E2=80=99? [-Werror=3Dimplicit-func=
tion-declaration]
    r =3D amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_import_sync_file
  ../tests/amdgpu/amd_syncobj.c:218:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_import_sync_file2=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_syncobj.c:228:6: error: implicit declaration of funct=
ion =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99; did you mean =E2=
=80=98amdgpu_cs_syncobj_signal=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    r =3D amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_syncobj_signal
  ../tests/amdgpu/amd_syncobj.c:228:6: warning: nested extern declaration o=
f =E2=80=98amdgpu_cs_syncobj_timeline_signal=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1686798422:step_script
  section_start:1686798422:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798423:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/43798249):
  ninja: Entering directory `build'
  [1/665] Generating version.h with a custom command.
  [2/330] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syn=
cobj.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_syncobj@exe -Itests/amdgpu -I../tests/amdg=
pu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libd=
rm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FI=
LE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -g -D_GNU_SOUR=
CE -include config.h -Wbad-function-cast -Wdeclaration-after-statement -Wfo=
rmat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wm=
issing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-ex=
terns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Ws=
trict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-p=
acked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-=
unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -=
Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/amdgpu/b=
9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_syn=
cobj@exe/amd_syncobj.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_s=
yncobj.c.o' -c ../tests/amdgpu/amd_syncobj.c
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_wait=E2=80=99:
  ../tests/amdgpu/amd_syncobj.c:125:4: error: void value not ignored as it =
ought to be
    125 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, true,
        |    ^
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_signal=E2=80=
=99:
  ../tests/amdgpu/amd_syncobj.c:138:4: error: void value not ignored as it =
ought to be
    138 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, false,
        |    ^
  ninja: build stopped: subcommand failed.
  section_end:1686798423:step_script
  section_start:1686798423:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798423:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/43798253):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/666] Generating version.h with a custom command.
  [2/330] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syn=
cobj.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o=20
  clang -Itests/amdgpu/b9f2b1d@@amd_syncobj@exe -Itests/amdgpu -I../tests/a=
mdgpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
/lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/=
glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inclu=
de/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/l=
ibdrm/nouveau -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -g -D_GNU_SO=
URCE -include config.h -Wbad-function-cast -Wdeclaration-after-statement -W=
format=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-nore=
turn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer=
-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunu=
sed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pack=
ed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unu=
sed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Wer=
ror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmiss=
ing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn=
-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings =
-fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/amdgpu/b9f2=
b1d@@amd_syncobj@exe/amd_syncobj.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_syncob=
j@exe/amd_syncobj.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_sync=
obj.c.o' -c ../tests/amdgpu/amd_syncobj.c
  ../tests/amdgpu/amd_syncobj.c:125:4: error: assigning to 'int' from incom=
patible type 'void'
          r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_h=
andle, true,
            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
  ../tests/amdgpu/amd_syncobj.c:138:4: error: assigning to 'int' from incom=
patible type 'void'
          r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_h=
andle, false,
            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1686798432:step_script
  section_start:1686798432:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798433:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/43798250):
  [1/668] Generating version.h with a custom command.
  [2/335] Linking target tests/amdgpu/amd_abm.
  [3/335] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syn=
cobj.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_syncobj@exe -Itests/amdgpu -I../tests/amdg=
pu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include=
/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include=
/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/l=
ibdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-c=
olor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -s=
td=3Dgnu11 -g -D_GNU_SOURCE -include config.h -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -W=
no-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bo=
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthrea=
d -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o' -MF 'test=
s/amdgpu/b9f2b1d@@amd_syncobj@exe/amd_syncobj.c.o.d' -o 'tests/amdgpu/b9f2b=
1d@@amd_syncobj@exe/amd_syncobj.c.o' -c ../tests/amdgpu/amd_syncobj.c
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_wait=E2=80=99:
  ../tests/amdgpu/amd_syncobj.c:125:4: error: void value not ignored as it =
ought to be
    125 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, true,
        |    ^
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_signal=E2=80=
=99:
  ../tests/amdgpu/amd_syncobj.c:138:4: error: void value not ignored as it =
ought to be
    138 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, false,
        |    ^
  ninja: build stopped: subcommand failed.
  section_end:1686798423:step_script
  section_start:1686798423:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798423:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/43798251):
  ninja: Entering directory `build'
  [1/666] Generating version.h with a custom command.
  [2/331] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_syncobj@exe/am=
d_syncobj.c.o'.
  FAILED: tests/amdgpu/tests@amdgpu@@amd_syncobj@exe/amd_syncobj.c.o=20
  cc -Itests/amdgpu/tests@amdgpu@@amd_syncobj@exe -Itests/amdgpu -I../tests=
/amdgpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I=
../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/includ=
e/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inc=
lude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include=
/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O0 -g -D=
_GNU_SOURCE -include config.h -Wbad-function-cast -Wdeclaration-after-state=
ment -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declara=
tions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -W=
nested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Ws=
hadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-mayb=
e-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-add=
ress-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parame=
ter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Di=
mplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -W=
error=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Wer=
ror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwr=
ite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'test=
s/amdgpu/tests@amdgpu@@amd_syncobj@exe/amd_syncobj.c.o' -MF 'tests/amdgpu/t=
ests@amdgpu@@amd_syncobj@exe/amd_syncobj.c.o.d' -o 'tests/amdgpu/tests@amdg=
pu@@amd_syncobj@exe/amd_syncobj.c.o' -c ../tests/amdgpu/amd_syncobj.c
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_wait=E2=80=99:
  ../tests/amdgpu/amd_syncobj.c:125:4: error: void value not ignored as it =
ought to be
    125 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, true,
        |    ^
  ../tests/amdgpu/amd_syncobj.c: In function =E2=80=98syncobj_signal=E2=80=
=99:
  ../tests/amdgpu/amd_syncobj.c:138:4: error: void value not ignored as it =
ought to be
    138 |  r =3D syncobj_command_submission_helper(sp->device, sp->syncobj_=
handle, false,
        |    ^
  ninja: build stopped: subcommand failed.
  section_end:1686798424:step_script
  section_start:1686798424:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1686798424:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/909515
