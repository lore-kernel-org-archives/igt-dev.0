Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mastan Katragadda" <mastanx.katragadda@intel.com>
Date: Wed, 09 Mar 2022 05:02:12 -0000
Message-ID: <164680213235.14946.17283534662733093678@emeril.freedesktop.org>
References: <20220309044837.2747689-1-mastanx.katragadda@intel.com>
In-Reply-To: <20220309044837.2747689-1-mastanx.katragadda@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?gt/gem=5Fmmap=5Foffset=3A_Adding_subtest_oob=5Fread?=
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

Series: igt/gem_mmap_offset: Adding subtest oob_read
URL   : https://patchwork.freedesktop.org/series/101187/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/527126 fo=
r the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/19555335):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@gem_mmap_offset@exe -Ites=
ts -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib =
-I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -=
I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr=
/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/inclu=
de/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/incl=
ude/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnos=
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
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fc=
ommon -pthread  -MD -MQ 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_o=
ffset.c.o' -MF 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o=
.d' -o 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o' -c ../=
tests/i915/gem_mmap_offset.c
  ../tests/i915/gem_mmap_offset.c: In function =E2=80=98test_oob_read=E2=80=
=99:
  ../tests/i915/gem_mmap_offset.c:312:10: error: implicit declaration of fu=
nction =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
            ^~~~
            popen
  ../tests/i915/gem_mmap_offset.c:312:10: warning: nested extern declaratio=
n of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/i915/gem_mmap_offset.c:312:33: error: =E2=80=98O_RDWR=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98DRM_RDWR=E2=
=80=99?
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
                                   ^~~~~~
                                   DRM_RDWR
  ../tests/i915/gem_mmap_offset.c:312:33: note: each undeclared identifier =
is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1646801984:step_script
  section_start:1646801984:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646801985:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/19555334):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@gem_mmap_offset@exe -It=
ests -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo=
 -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-l=
imits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3D=
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointe=
r-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3D=
pointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -fcommon -pthread  -MD -MQ 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_m=
map_offset.c.o' -MF 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offse=
t.c.o.d' -o 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o' -=
c ../tests/i915/gem_mmap_offset.c
  ../tests/i915/gem_mmap_offset.c: In function =E2=80=98test_oob_read=E2=80=
=99:
  ../tests/i915/gem_mmap_offset.c:312:10: error: implicit declaration of fu=
nction =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
            ^~~~
            popen
  ../tests/i915/gem_mmap_offset.c:312:10: warning: nested extern declaratio=
n of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/i915/gem_mmap_offset.c:312:33: error: =E2=80=98O_RDWR=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98DRM_RDWR=E2=
=80=99?
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
                                   ^~~~~~
                                   DRM_RDWR
  ../tests/i915/gem_mmap_offset.c:312:33: note: each undeclared identifier =
is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1646801985:step_script
  section_start:1646801985:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646801986:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/19555336):
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@gem_mmap_offset@exe -Itests =
-I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I.=
./lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/u=
sr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/inclu=
de/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mi=
ps-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-colo=
r=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
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
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pth=
read  -MD -MQ 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o'=
 -MF 'tests/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o.d' -o 'te=
sts/59830eb@@gem_mmap_offset@exe/i915_gem_mmap_offset.c.o' -c ../tests/i915=
/gem_mmap_offset.c
  ../tests/i915/gem_mmap_offset.c: In function =E2=80=98test_oob_read=E2=80=
=99:
  ../tests/i915/gem_mmap_offset.c:312:10: error: implicit declaration of fu=
nction =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
            ^~~~
            popen
  ../tests/i915/gem_mmap_offset.c:312:10: warning: nested extern declaratio=
n of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/i915/gem_mmap_offset.c:312:33: error: =E2=80=98O_RDWR=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98DRM_RDWR=E2=
=80=99?
    memfd =3D open("/proc/self/mem", O_RDWR, 0);
                                   ^~~~~~
                                   DRM_RDWR
  ../tests/i915/gem_mmap_offset.c:312:33: note: each undeclared identifier =
is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1646801992:step_script
  section_start:1646801992:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646801993:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/527126
