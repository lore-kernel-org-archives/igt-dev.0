Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 03 Nov 2023 16:25:03 -0000
Message-ID: <169902870333.29107.8617505651259334238@emeril.freedesktop.org>
References: <20231103144359.7-1-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_u?=
 =?utf-8?q?API_Alignment_-_take_2?=
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

Series: uAPI Alignment - take 2
URL   : https://patchwork.freedesktop.org/series/125956/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1025841 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/51161468):
  cc -Itests/59830eb@@kms_ccs@exe -Itests -I../tests -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-l=
inux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/us=
r/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/in=
clude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrin=
d -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_=
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
 -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/59830eb@@=
kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms_ccs@exe/intel_kms_cc=
s.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -c ../tests/inte=
l/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
       xe_bo_create_flags(data->drm_fd, 0, fb.size,
       ^~~~~~~~~~~~~~~~~~
       xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
            visible_vram_if_possible(data->drm_fd, 0));
            ^~~~~~~~~~~~~~~~~~~~~~~~
            any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028600:step_script
  section_start:1699028600:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028601:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/51161471):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I../=
tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
/lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/=
glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixma=
n-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I=
/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-li=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ =
'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms_ccs@=
exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' =
-c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
       xe_bo_create_flags(data->drm_fd, 0, fb.size,
       ^~~~~~~~~~~~~~~~~~
       xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
            visible_vram_if_possible(data->drm_fd, 0));
            ^~~~~~~~~~~~~~~~~~~~~~~~
            any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028608:step_script
  section_start:1699028608:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028609:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/51161470):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I.=
./tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I=
../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/includ=
e/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/p=
ixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng1=
6 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-li=
nux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-col=
or=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
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
 -MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms=
_ccs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.=
c.o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
       xe_bo_create_flags(data->drm_fd, 0, fb.size,
       ^~~~~~~~~~~~~~~~~~
       xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
            visible_vram_if_possible(data->drm_fd, 0));
            ^~~~~~~~~~~~~~~~~~~~~~~~
            any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028610:step_script
  section_start:1699028610:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028610:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/51161472):
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I../tes=
ts -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I=
/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/i=
nclude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -=
I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pi=
pe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g=
 -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast =
-Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlog=
ical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused=
 -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -W=
no-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/5=
9830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms_ccs@exe/inte=
l_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -c ../te=
sts/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
       xe_bo_create_flags(data->drm_fd, 0, fb.size,
       ^~~~~~~~~~~~~~~~~~
       xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
            visible_vram_if_possible(data->drm_fd, 0));
            ^~~~~~~~~~~~~~~~~~~~~~~~
            any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028614:step_script
  section_start:1699028614:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028614:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/51161463):
  cc -Itests/59830eb@@kms_ccs@exe -Itests -I../tests -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include=
/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall=
 -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h =
-D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wf=
ormat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -W=
missing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-e=
xterns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -W=
strict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninit=
ialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-=
packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno=
-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb=
@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms_ccs@exe/intel_kms_=
ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -c ../tests/in=
tel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    437 |     xe_bo_create_flags(data->drm_fd, 0, fb.size,
        |     ^~~~~~~~~~~~~~~~~~
        |     xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    438 |          visible_vram_if_possible(data->drm_fd, 0));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~
        |          any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028594:step_script
  section_start:1699028594:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028595:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/51161467):
                                  ^
  ../tests/intel/kms_ccs.c:437:5: note: did you mean 'xe_bo_create'?
  ../lib/xe/xe_ioctl.h:69:10: note: 'xe_bo_create' declared here
  uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placem=
ent,
           ^
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
'visible_vram_if_possible' is invalid in C99 [-Werror,-Wimplicit-function-d=
eclaration]
                                                     visible_vram_if_possib=
le(data->drm_fd, 0));
                                                     ^
  ../tests/intel/kms_ccs.c:438:10: note: did you mean 'any_vram_if_possible=
'?
  ../lib/xe/xe_query.h:78:10: note: 'any_vram_if_possible' declared here
  uint64_t any_vram_if_possible(int fd);
           ^
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1699028624:step_script
  section_start:1699028624:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028625:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/51161466):
  cc -Itests/59830eb@@kms_ccs@exe -Itests -I../tests -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
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
o-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs=
.c.o' -MF 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830e=
b@@kms_ccs@exe/intel_kms_ccs.c.o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    437 |     xe_bo_create_flags(data->drm_fd, 0, fb.size,
        |     ^~~~~~~~~~~~~~~~~~
        |     xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    438 |          visible_vram_if_possible(data->drm_fd, 0));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~
        |          any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028595:step_script
  section_start:1699028595:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028596:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/51161464):
  cc -Itests/59830eb@@kms_ccs@exe -Itests -I../tests -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libd=
rm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FI=
LE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_=
SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclar=
ation-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op =
-Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmiss=
ing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wre=
dundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-cl=
obbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-point=
er-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -=
Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-b=
ounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast =
-Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer=
-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigr=
aphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthre=
ad -MD -MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830e=
b@@kms_ccs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_km=
s_ccs.c.o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    437 |     xe_bo_create_flags(data->drm_fd, 0, fb.size,
        |     ^~~~~~~~~~~~~~~~~~
        |     xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    438 |          visible_vram_if_possible(data->drm_fd, 0));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~
        |          any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028598:step_script
  section_start:1699028598:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028599:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/51161465):
  cc -Itests/tests@@kms_ccs@exe -Itests -I../tests -I../include -I../includ=
e/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0=
/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/li=
bpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/v=
algrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -=
Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D=
_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wfor=
mat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmi=
ssing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-ext=
erns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wst=
rict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitia=
lized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pa=
cked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-u=
nused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -W=
error=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/tests@@k=
ms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/tests@@kms_ccs@exe/intel_kms_ccs.c=
.o.d' -o 'tests/tests@@kms_ccs@exe/intel_kms_ccs.c.o' -c ../tests/intel/kms=
_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98test_bad_ccs_plane=E2=80=
=99:
  ../tests/intel/kms_ccs.c:437:5: error: implicit declaration of function =
=E2=80=98xe_bo_create_flags=E2=80=99; did you mean =E2=80=98xe_bo_create=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    437 |     xe_bo_create_flags(data->drm_fd, 0, fb.size,
        |     ^~~~~~~~~~~~~~~~~~
        |     xe_bo_create
  ../tests/intel/kms_ccs.c:437:5: warning: nested extern declaration of =E2=
=80=98xe_bo_create_flags=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:438:10: error: implicit declaration of function =
=E2=80=98visible_vram_if_possible=E2=80=99; did you mean =E2=80=98any_vram_=
if_possible=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    438 |          visible_vram_if_possible(data->drm_fd, 0));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~
        |          any_vram_if_possible
  ../tests/intel/kms_ccs.c:438:10: warning: nested extern declaration of =
=E2=80=98visible_vram_if_possible=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1699028596:step_script
  section_start:1699028596:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1699028597:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1025841
