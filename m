Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Thu, 02 Nov 2023 12:08:03 -0000
Message-ID: <169892688309.28157.4669690919337818835@emeril.freedesktop.org>
References: <20231102110656.2381729-1-jesse.zhang@amd.com>
In-Reply-To: <20231102110656.2381729-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_amdgpu_test_suite?=
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

Series: tests/amdgpu: add amdgpu test suite
URL   : https://patchwork.freedesktop.org/series/125892/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1024769 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/51092504):
  [5/975] Generating core_hotunplug.testlist with a meson_exe.py custom com=
mand.
  [6/975] Generating nouveau_crc.testlist with a meson_exe.py custom comman=
d.
  [7/975] Generating amd_basic.testlist with a meson_exe.py custom command.
  [8/975] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  cc -Itests/59830eb@@amd_pstate@exe -Itests -I../tests -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysca=
lls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_6=
4-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I=
/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr=
/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valg=
rind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D=
_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wd=
eclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogica=
l-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-=
pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno=
-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/59830e=
b@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/59830eb@@amd_pstate@exe=
/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926773:step_script
  section_start:1698926773:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926774:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/51092507):
  [2/720] Linking target lib/libi915_perf.so.1.5.
  [3/720] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/720] Linking target tests/core_hotunplug.
  [5/720] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@amd_pstate@exe -Itests -I=
../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -=
I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/inclu=
de/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pi=
xman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16=
 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64=
-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD=
 -MQ 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/59830=
eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd_pstate@e=
xe/amdgpu_amd_pstate.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926803:step_script
  section_start:1698926803:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926803:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/51092506):
  [3/719] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/719] Linking target tests/core_hotunplug.
  [5/719] Linking target tests/prime_nv_pcopy.
  [6/719] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@amd_pstate@exe -Itests =
-I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib=
 -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/inc=
lude/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/includ=
e/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm=
-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-=
color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -=
std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -W=
bad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fal=
lthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute=
 -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defin=
ition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunin=
itialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fie=
ld-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-=
unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bound=
s -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Wer=
ror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-=
int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs=
 -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  =
-MD -MQ 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/59=
830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd_pstat=
e@exe/amdgpu_amd_pstate.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926801:step_script
  section_start:1698926801:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926802:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/51092508):
  [3/722] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/722] Linking target tests/core_hotunplug.
  [5/722] Linking target tests/nouveau_crc.
  [6/722] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@amd_pstate@exe -Itests -I../=
tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
/lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/=
glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1=
 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/us=
r/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gn=
u -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways =
-pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2=
 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-ca=
st -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -W=
logical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-nore=
turn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer=
-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunu=
sed -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers=
 -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-paramete=
r -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimp=
licit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Wer=
ror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werro=
r=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrit=
e-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/=
59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/59830eb@@amd_psta=
te@exe/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd_pstate@exe/amdgpu_am=
d_pstate.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926813:step_script
  section_start:1698926813:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926814:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/51092499):
  [4/983] Linking target tests/core_hotunplug.
  [5/983] Generating core_hotunplug.testlist with a meson_exe.py custom com=
mand.
  [6/983] Generating amd_basic.testlist with a meson_exe.py custom command.
  [7/983] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  cc -Itests/59830eb@@amd_pstate@exe -Itests -I../tests -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysca=
lls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/gli=
b-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inclu=
de/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/incl=
ude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -W=
all -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config=
.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement =
-Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations=
 -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wneste=
d-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow=
 -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uni=
nitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-=
of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59=
830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/59830eb@@amd_pstate=
@exe/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_=
pstate.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     22 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926755:step_script
  section_start:1698926755:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926756:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/51092503):
          igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
                        ^~~~~~~~~~
  ../lib/igt_core.h:827:49: note: expanded from macro 'igt_assert_eq'
  #define igt_assert_eq(n1, n2) igt_assert_cmpint(n1, =3D=3D, !=3D, n2)
                                                  ^~
  ../lib/igt_core.h:737:15: note: expanded from macro 'igt_assert_cmpint'
                  int __n1 =3D (n1), __n2 =3D (n2); \
                              ^~
  ../tests/amdgpu/amd_pstate.c:17:37: note: initialize the variable 'new_ps=
tate' to silence this warning
          uint32_t current_pstate, new_pstate;
                                             ^
                                              =3D 0
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1698926791:step_script
  section_start:1698926791:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926791:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/51092502):
  [6/879] Generating vgem_basic.testlist with a meson_exe.py custom command.
  [7/879] Generating vgem_slow.testlist with a meson_exe.py custom command.
  [8/879] Generating amd_module_load.testlist with a meson_exe.py custom co=
mmand.
  [9/879] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  cc -Itests/59830eb@@amd_pstate@exe -Itests -I../tests -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysca=
lls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/gli=
b-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inclu=
de/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-col=
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
o-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@amd_pstate@exe/amdgpu_amd=
_pstate.c.o' -MF 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o.d' -o=
 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -c ../tests/amdgpu/a=
md_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     22 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926763:step_script
  section_start:1698926763:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926763:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/51092500):
  [5/985] Generating core_hotunplug.testlist with a meson_exe.py custom com=
mand.
  [6/985] Generating prime_nv_pcopy.testlist with a meson_exe.py custom com=
mand.
  [7/985] Generating amd_module_load.testlist with a meson_exe.py custom co=
mmand.
  [8/985] Compiling C object 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_psta=
te.c.o'.
  FAILED: tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  cc -Itests/59830eb@@amd_pstate@exe -Itests -I../tests -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysca=
lls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/=
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
hread -MD -MQ 'tests/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'te=
sts/59830eb@@amd_pstate@exe/amdgpu_amd_pstate.c.o.d' -o 'tests/59830eb@@amd=
_pstate@exe/amdgpu_amd_pstate.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     22 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926764:step_script
  section_start:1698926764:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926765:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/51092501):
  [5/987] Generating core_hotunplug.testlist with a meson_exe.py custom com=
mand.
  [6/987] Generating prime_nv_pcopy.testlist with a meson_exe.py custom com=
mand.
  [7/987] Generating nouveau_crc.testlist with a meson_exe.py custom comman=
d.
  [8/987] Compiling C object 'tests/tests@@amd_pstate@exe/amdgpu_amd_pstate=
.c.o'.
  FAILED: tests/tests@@amd_pstate@exe/amdgpu_amd_pstate.c.o=20
  cc -Itests/tests@@amd_pstate@exe -Itests -I../tests -I../include -I../inc=
lude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscall=
s -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-=
2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include=
/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/includ=
e/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wal=
l -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h=
 -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -W=
format=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -=
Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-=
externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -=
Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-unini=
tialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of=
-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wn=
o-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit=
 -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/t=
ests@@amd_pstate@exe/amdgpu_amd_pstate.c.o' -MF 'tests/tests@@amd_pstate@ex=
e/amdgpu_amd_pstate.c.o.d' -o 'tests/tests@@amd_pstate@exe/amdgpu_amd_pstat=
e.c.o' -c ../tests/amdgpu/amd_pstate.c
  ../tests/amdgpu/amd_pstate.c: In function =E2=80=98amdgpu_stable_pstate_t=
est=E2=80=99:
  ../tests/amdgpu/amd_pstate.c:22:6: error: implicit declaration of functio=
n =E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99; did you mean =E2=80=98amdg=
pu_cs_ctx_create=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     22 |  r =3D amdgpu_cs_ctx_stable_pstate(context_handle,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      amdgpu_cs_ctx_create
  ../tests/amdgpu/amd_pstate.c:22:6: warning: nested extern declaration of =
=E2=80=98amdgpu_cs_ctx_stable_pstate=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1698926767:step_script
  section_start:1698926767:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698926768:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1024769
