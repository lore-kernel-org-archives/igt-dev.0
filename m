Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 16 Mar 2023 03:07:03 -0000
Message-ID: <167893602330.19094.11142524381292694066@emeril.freedesktop.org>
References: <20230316023250.4115730-1-matthew.brost@intel.com>
In-Reply-To: <20230316023250.4115730-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_T?=
 =?utf-8?q?est_GPUVA_and_NULL_VM_binds_=28rev2=29?=
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

Series: Test GPUVA and NULL VM binds (rev2)
URL   : https://patchwork.freedesktop.org/series/115219/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/831088 fo=
r the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/38167491):
  [3/311] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/311] Linking target tests/gem_barrier_race.
  [5/311] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
  FAILED: tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@xe_vm@exe -Itests -I../=
tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
/lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/=
glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pix=
man-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 =
-I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linu=
x-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
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
 -MQ 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o' -MF 'tests/59830eb@@xe_vm@exe/=
xe_xe_vm.c.o.d' -o 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o' -c ../tests/xe/x=
e_vm.c
  ../tests/xe/xe_vm.c: In function =E2=80=98test_mmap_style_bind=E2=80=99:
  ../tests/xe/xe_vm.c:1576:15: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map0 =3D mmap((void *)addr, bo_size, PROT_READ |
                 ^
  ../tests/xe/xe_vm.c:1579:15: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map1 =3D mmap((void *)(addr + bo_size), bo_size, PROT_READ |
                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678935672:step_script
  section_start:1678935672:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678935673:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/38167493):
  [3/315] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/315] Linking target tests/gem_barrier_race.
  [5/315] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
  FAILED: tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@xe_vm@exe -Itests -I../tests=
 -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib =
-I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-=
2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/u=
sr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/inc=
lude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/=
usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe=
 -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -=
D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -W=
declaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogic=
al-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn =
-Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arit=
h -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -=
Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno=
-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wn=
o-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit=
 -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/5=
9830eb@@xe_vm@exe/xe_xe_vm.c.o' -MF 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o.=
d' -o 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o' -c ../tests/xe/xe_vm.c
  ../tests/xe/xe_vm.c: In function =E2=80=98test_mmap_style_bind=E2=80=99:
  ../tests/xe/xe_vm.c:1576:15: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map0 =3D mmap((void *)addr, bo_size, PROT_READ |
                 ^
  ../tests/xe/xe_vm.c:1579:15: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
     map1 =3D mmap((void *)(addr + bo_size), bo_size, PROT_READ |
                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1678935872:step_script
  section_start:1678935872:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678935874:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/831088
