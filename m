Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 21 Jun 2022 12:11:44 -0000
Message-ID: <165581350460.13648.10989767333177475779@emeril.freedesktop.org>
References: <20220621103001.184373-1-matthew.auld@intel.com>
In-Reply-To: <20220621103001.184373-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?mall_BAR_uapi_bits_=28rev2=29?=
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

Series: small BAR uapi bits (rev2)
URL   : https://patchwork.freedesktop.org/series/104368/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/618118 fo=
r the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/24347108):
  ninja: Entering directory `build'
  [1/511] Generating version.h with a custom command.
  [2/224] Linking target tests/gem_exec_schedule.
  [3/224] Linking target tests/gem_userptr_blits.
  [4/224] Linking target tests/i915_pm_rpm.
  [5/224] Compiling C object 'tests/59830eb@@i915_query@exe/i915_i915_query=
.c.o'.
  FAILED: tests/59830eb@@i915_query@exe/i915_i915_query.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@i915_query@exe -Itests =
-I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I.=
./lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/u=
sr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/=
include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/includ=
e/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/inclu=
de/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagno=
stics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -We=
xtra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
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
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fc=
ommon -pthread  -MD -MQ 'tests/59830eb@@i915_query@exe/i915_i915_query.c.o'=
 -MF 'tests/59830eb@@i915_query@exe/i915_i915_query.c.o.d' -o 'tests/59830e=
b@@i915_query@exe/i915_i915_query.c.o' -c ../tests/i915/i915_query.c
  ../tests/i915/i915_query.c: In function =E2=80=98fill_unallocated=E2=80=
=99:
  ../tests/i915/i915_query.c:790:12: error: cast to pointer from integer of=
 different size [-Werror=3Dint-to-pointer-cast]
    regions =3D (struct drm_i915_query_memory_regions *)item->data_ptr;
              ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1655813267:step_script
  section_start:1655813267:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1655813267:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/24347110):
  [825/1117] Compiling C object 'tests/59830eb@@i915_pm_rpm@exe/i915_i915_p=
m_rpm.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/551] Generating version.h with a custom command.
  [2/294] Linking target tests/gem_userptr_blits.
  [3/294] Compiling C object 'tests/59830eb@@i915_query@exe/i915_i915_query=
.c.o'.
  FAILED: tests/59830eb@@i915_query@exe/i915_i915_query.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@i915_query@exe -Itests -I../=
tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib=
/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pi=
xman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16=
 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-li=
nux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Da=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread =
 -MD -MQ 'tests/59830eb@@i915_query@exe/i915_i915_query.c.o' -MF 'tests/598=
30eb@@i915_query@exe/i915_i915_query.c.o.d' -o 'tests/59830eb@@i915_query@e=
xe/i915_i915_query.c.o' -c ../tests/i915/i915_query.c
  ../tests/i915/i915_query.c: In function =E2=80=98fill_unallocated=E2=80=
=99:
  ../tests/i915/i915_query.c:790:12: error: cast to pointer from integer of=
 different size [-Werror=3Dint-to-pointer-cast]
    regions =3D (struct drm_i915_query_memory_regions *)item->data_ptr;
              ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1655813315:step_script
  section_start:1655813315:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1655813316:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/618118
