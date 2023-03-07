Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Mar 2023 22:28:12 -0000
Message-ID: <167822809289.31452.907942743076014205@emeril.freedesktop.org>
References: <20230307221236.913429-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307221236.913429-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nitial_Xe_test_suite_=28rev7=29?=
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

Series: Initial Xe test suite (rev7)
URL   : https://patchwork.freedesktop.org/series/112191/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/824287 fo=
r the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/37654188):
  [108/820] Linking target tests/kms_plane_alpha_blend.
  [109/820] Linking target tests/kms_plane_cursor.
  [110/820] Compiling C object 'tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o'.
  FAILED: tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/xe/2e9594b@@xe_vm@exe -Itests/xe=
 -I../tests/xe -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib=
 -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib=
-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-=
1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/u=
sr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gn=
ueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Da=
lways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu=
11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-funct=
ion-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=
=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initi=
alizers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ =
'tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o' -MF 'tests/xe/2e9594b@@xe_vm@exe/xe=
_vm.c.o.d' -o 'tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o' -c ../tests/xe/xe_vm.c
  ../tests/xe/xe_vm.c: In function =E2=80=98test_munmap_style_unbind=E2=80=
=99:
  ../tests/xe/xe_vm.c:1102:14: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map =3D mmap((void *)addr, bo_size, PROT_READ |
                ^
  ../tests/xe/xe_vm.c:1256:14: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map =3D mmap((void *)addr, bo_size, PROT_READ |
                ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678227891:step_script
  section_start:1678227891:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678227891:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/37654190):
  [2/747] Linking target lib/libi915_perf.so.1.5.
  [3/747] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/747] Compiling C object 'tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o'.
  FAILED: tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/xe/2e9594b@@xe_vm@exe -Itests/xe -I..=
/tests/xe -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I..=
/lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 =
-I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/i=
nclude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include=
/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/=
include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GN=
U_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecl=
aration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-o=
p -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmi=
ssing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -W=
redundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-=
clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poi=
nter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmis=
sing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretur=
n-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings=
 -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/xe/2e9594=
b@@xe_vm@exe/xe_vm.c.o' -MF 'tests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o.d' -o 't=
ests/xe/2e9594b@@xe_vm@exe/xe_vm.c.o' -c ../tests/xe/xe_vm.c
  ../tests/xe/xe_vm.c: In function =E2=80=98test_munmap_style_unbind=E2=80=
=99:
  ../tests/xe/xe_vm.c:1102:14: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map =3D mmap((void *)addr, bo_size, PROT_READ |
                ^
  ../tests/xe/xe_vm.c:1256:14: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map =3D mmap((void *)addr, bo_size, PROT_READ |
                ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678227877:step_script
  section_start:1678227877:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678227877:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/824287
