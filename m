Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Fri, 22 Sep 2023 01:56:11 -0000
Message-ID: <169534777185.5198.14248647807008449175@emeril.freedesktop.org>
References: <20230922013641.3413262-1-jesse.zhang@amd.com>
In-Reply-To: <20230922013641.3413262-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_stable_pstate_tet?=
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

Series: tests/amdgpu: add stable pstate tet
URL   : https://patchwork.freedesktop.org/series/124087/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/991632 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/49309999):
  [1/940] Generating version.h with a custom command.
  [2/364] Generating kms_chamelium_color.testlist with a meson_exe.py custo=
m command.
  [3/364] Generating kms_chamelium_frames.testlist with a meson_exe.py cust=
om command.
  [4/364] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Itests/amdgpu -I../tests/amdgpu=
 -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib =
-I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-=
2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I=
/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/i=
nclude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu=
 -I/usr/include/valgrind -I/usr/include/alsa -I/usr/include -fdiagnostics-c=
olor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -s=
td=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wb=
ad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fall=
through=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute =
-Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defini=
tion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunini=
tialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fiel=
d-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-u=
nused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds=
 -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werr=
or=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-i=
nt-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs =
-Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -=
MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -MF 'tests/amdgp=
u/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_bas=
ic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347536:step_script
  section_start:1695347536:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347537:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/49310002):
  [5/315] Linking target tests/gem_barrier_race.
  [6/315] Linking target tests/perf.
  [7/315] Linking target tests/kms_frontbuffer_tracking.
  [8/315] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Ite=
sts/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../includ=
e/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/includ=
e/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/inclu=
de -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa =
-fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid=
-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY=
_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 =
-Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wo=
ld-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pro=
totypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-typ=
e-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-poi=
nter-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=
=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werr=
or=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-cal=
loc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -=
MF 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgpu/b=
9f2b1d@@amd_basic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347534:step_script
  section_start:1695347534:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347534:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/49310001):
  ninja: Entering directory `build'
  [1/618] Generating version.h with a custom command.
  [2/310] Linking target tests/kms_frontbuffer_tracking.
  [3/310] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -I=
tests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../incl=
ude/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/incl=
ude/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/i=
nclude -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2=
 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouvea=
u -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include=
/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Wi=
nvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_F=
ORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wforma=
t=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmiss=
ing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exter=
ns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstri=
ct-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitiali=
zed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -W=
no-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -=
Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-=
to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -=
Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point=
 -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-built=
in-calloc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.=
c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/am=
dgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347542:step_script
  section_start:1695347542:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347542:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/49310003):
  [4/309] Linking target tests/core_hotunplug.
  [5/309] Linking target tests/gem_barrier_race.
  [6/309] Linking target tests/perf.
  [7/309] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Itests=
/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../include/l=
inux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/c=
airo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/i=
nclude/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnos=
tics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wex=
tra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpli=
cit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-miss=
ing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limit=
s -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darra=
y-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pt=
hread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -MF 'tes=
ts/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgpu/b9f2b1d@=
@amd_basic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347548:step_script
  section_start:1695347548:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347549:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/49309994):
  [2/368] Linking target tests/kms_chamelium_frames.
  [3/368] Generating kms_chamelium_frames.testlist with a meson_exe.py cust=
om command.
  [4/368] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom =
command.
  [5/368] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Itests/amdgpu -I../tests/amdgpu=
 -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib =
-I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-=
2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/fr=
eetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm=
/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -W=
missing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissin=
g-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredu=
ndant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clob=
bered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer=
-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wn=
o-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bou=
nds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -W=
error=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-t=
o-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigrap=
hs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread=
 -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -MF 'tests/amd=
gpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_b=
asic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    625 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347532:step_script
  section_start:1695347532:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347533:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/49309998):
  [4/367] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom =
command.
  [5/367] Linking target tests/amdgpu/amd_abm.
  [6/367] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  clang -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Itests/amdgpu -I../tests/amd=
gpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../l=
ib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gl=
ib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include=
/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/lib=
drm/nouveau -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FI=
LE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_=
SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclar=
ation-after-statement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-st=
yle-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototyp=
es -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-ar=
ith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-u=
nused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds=
 -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werr=
or=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-i=
nt-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs =
-Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -M=
D -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -MF 'tests/amdgpu=
/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_basi=
c@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n 'amdgpu_cs_ctx_stable_pstate' is invalid in C99 [-Werror,-Wimplicit-funct=
ion-declaration]
          r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
              ^
  ../tests/amdgpu/amd_basic.c:625:6: note: did you mean 'amdgpu_cs_ctx_crea=
te'?
  /usr/include/libdrm/amdgpu.h:897:5: note: 'amdgpu_cs_ctx_create' declared=
 here
  int amdgpu_cs_ctx_create(amdgpu_device_handle dev,
      ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1695347549:step_script
  section_start:1695347549:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347549:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/49309995):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/942] Generating version.h with a custom command.
  [2/361] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic=
.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_basic@exe -Itests/amdgpu -I../tests/amdgpu=
 -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib =
-I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/c=
airo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/p=
ixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/lib=
drm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-col=
or=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-com=
pare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dad=
dress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -pthread -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_=
basic.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o.d' -o 'te=
sts/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_bas=
ic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    625 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347539:step_script
  section_start:1695347539:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347540:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/49309996):
  ninja: Entering directory `build'
  [1/939] Generating version.h with a custom command.
  [2/358] Generating kms_chamelium_frames.testlist with a meson_exe.py cust=
om command.
  [3/358] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_basic@exe/amd_=
basic.c.o'.
  FAILED: tests/amdgpu/tests@amdgpu@@amd_basic@exe/amd_basic.c.o=20
  cc -Itests/amdgpu/tests@amdgpu@@amd_basic@exe -Itests/amdgpu -I../tests/a=
mdgpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
/lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/=
glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inclu=
de/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/l=
ibdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D=
_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_G=
NU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdec=
laration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-=
op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wm=
issing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -=
Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno=
-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-po=
inter-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limit=
s -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darra=
y-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pt=
hread  -MD -MQ 'tests/amdgpu/tests@amdgpu@@amd_basic@exe/amd_basic.c.o' -MF=
 'tests/amdgpu/tests@amdgpu@@amd_basic@exe/amd_basic.c.o.d' -o 'tests/amdgp=
u/tests@amdgpu@@amd_basic@exe/amd_basic.c.o' -c ../tests/amdgpu/amd_basic.c
  ../tests/amdgpu/amd_basic.c: In function =E2=80=98amdgpu_stable_pstate_te=
st=E2=80=99:
  ../tests/amdgpu/amd_basic.c:625:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    625 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_basic.c:625:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695347530:step_script
  section_start:1695347530:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695347530:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/991632
