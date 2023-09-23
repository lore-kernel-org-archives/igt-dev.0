Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Sat, 23 Sep 2023 00:05:14 -0000
Message-ID: <169542751427.3505.16599032683663024957@emeril.freedesktop.org>
References: <20230922234204.9782-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230922234204.9782-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/2=5D_tests/amdgpu=3A_split_deadlock_te?=
 =?utf-8?q?sts?=
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

Series: series starting with [1/2] tests/amdgpu: split deadlock tests
URL   : https://patchwork.freedesktop.org/series/124150/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/992451 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/49364284):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1363] Generating version.h with a custom command.
  [2/1359] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/a=
mdgpu_amd_dispatch.c.o'.
  FAILED: lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.=
o=20
  cc -Ilib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta -Ilib -I../lib -I../inclu=
de -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I=
. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linu=
x-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/i=
nclude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inclu=
de/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -=
I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unuse=
d-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werro=
r=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissin=
g-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-t=
ype -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -f=
no-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr=
/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/te=
sts"' '-DIGT_LOG_DOMAIN=3D"amdgpu/amd_dispatch"'  -MD -MQ 'lib/76b5a35@@igt=
-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -MF 'lib/76b5a35@@igt-a=
mdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o.d' -o 'lib/76b5a35@@igt-am=
dgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -c ../lib/amdgpu/amd_dispa=
tch.c
  ../lib/amdgpu/amd_dispatch.c: In function =E2=80=98amdgpu_memcpy_dispatch=
_hang_slow_test=E2=80=99:
  ../lib/amdgpu/amd_dispatch.c:473:7: error: implicit declaration of functi=
on =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=98am=
dgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]
    r2 =3D amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_query_reset_state
  ../lib/amdgpu/amd_dispatch.c:473:7: warning: nested extern declaration of=
 =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695427183:step_script
  section_start:1695427183:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695427183:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/49364287):
  [1/1032] Generating version.h with a custom command.
  [2/1028] Linking static target lib/libigt-igt_audio_c.a.
  [3/1028] Linking static target lib/libigt-amdgpu_amd_ip_blocks_c.a.
  [4/1028] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/a=
mdgpu_amd_dispatch.c.o'.
  FAILED: lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.=
o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-amdgpu_amd_dispatch_c@s=
ta -Ilib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uap=
i -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1=
 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/us=
r/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux=
-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-param=
eter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3D=
implicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -=
Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -We=
rror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dw=
rite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_=
DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci=
/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"amdgpu/amd_dispatch"'  -MD -MQ 'l=
ib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -MF 'lib=
/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o.d' -o 'lib/=
76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -c ../lib/a=
mdgpu/amd_dispatch.c
  ../lib/amdgpu/amd_dispatch.c: In function =E2=80=98amdgpu_memcpy_dispatch=
_hang_slow_test=E2=80=99:
  ../lib/amdgpu/amd_dispatch.c:473:7: error: implicit declaration of functi=
on =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=98am=
dgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]
    r2 =3D amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_query_reset_state
  ../lib/amdgpu/amd_dispatch.c:473:7: warning: nested extern declaration of=
 =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695427190:step_script
  section_start:1695427190:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695427191:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/49364286):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1026] Generating version.h with a custom command.
  [2/1022] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/a=
mdgpu_amd_dispatch.c.o'.
  FAILED: lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.=
o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-amdgpu_amd_dispatch_c=
@sta -Ilib -I../lib -I../include -I../include/drm-uapi -I../include/linux-u=
api -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/g=
lib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixm=
an-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -=
I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux=
-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
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
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthrea=
d '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/buil=
ds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"amdgpu/amd_dispatch"'  -=
MD -MQ 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o'=
 -MF 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o.d'=
 -o 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -c=
 ../lib/amdgpu/amd_dispatch.c
  ../lib/amdgpu/amd_dispatch.c: In function =E2=80=98amdgpu_memcpy_dispatch=
_hang_slow_test=E2=80=99:
  ../lib/amdgpu/amd_dispatch.c:473:7: error: implicit declaration of functi=
on =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=98am=
dgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]
    r2 =3D amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_query_reset_state
  ../lib/amdgpu/amd_dispatch.c:473:7: warning: nested extern declaration of=
 =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695427187:step_script
  section_start:1695427187:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695427188:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/49364288):
  ninja: Entering directory `build'
  [1/1033] Generating version.h with a custom command.
  [2/1029] Linking static target lib/libigt-igt_frame_c.a.
  [3/1029] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/a=
mdgpu_amd_dispatch.c.o'.
  FAILED: lib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.=
o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-amdgpu_amd_dispatch_c@sta =
-Ilib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -=
I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2=
.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/us=
r/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/incl=
ude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/u=
sr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe =
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
ngs -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=
=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci=
-tags/tests"' '-DIGT_LOG_DOMAIN=3D"amdgpu/amd_dispatch"'  -MD -MQ 'lib/76b5=
a35@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -MF 'lib/76b5a3=
5@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o.d' -o 'lib/76b5a35=
@@igt-amdgpu_amd_dispatch_c@sta/amdgpu_amd_dispatch.c.o' -c ../lib/amdgpu/a=
md_dispatch.c
  ../lib/amdgpu/amd_dispatch.c: In function =E2=80=98amdgpu_memcpy_dispatch=
_hang_slow_test=E2=80=99:
  ../lib/amdgpu/amd_dispatch.c:473:7: error: implicit declaration of functi=
on =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=98am=
dgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]
    r2 =3D amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         amdgpu_cs_query_reset_state
  ../lib/amdgpu/amd_dispatch.c:473:7: warning: nested extern declaration of=
 =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1695427191:step_script
  section_start:1695427191:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1695427192:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/992451
