Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Tue, 06 Dec 2022 23:45:22 -0000
Message-ID: <167037032251.3371.1252224527583550573@emeril.freedesktop.org>
References: <20221130204526.3182975-1-markyacoub@chromium.org>
In-Reply-To: <20221130204526.3182975-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchamelium?=
 =?utf-8?q?_tests_=28rev4=29?=
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

Series: Chamelium: Split kms_chamelium into multiple kms_chamelium tests (r=
ev4)
URL   : https://patchwork.freedesktop.org/series/111501/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/756452 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/33071502):
  FAILED: tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edi=
d.c.o=20
  cc -Itests/59830eb@@kms_chamelium_edid@exe -Itests -I../tests -I../includ=
e/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-lin=
ux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/=
include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/incl=
ude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind =
-I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FI=
LE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_=
SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclar=
ation-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op =
-Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmiss=
ing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wre=
dundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-cl=
obbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-point=
er-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unus=
ed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissi=
ng-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-=
type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -=
fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/59=
830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -MF 'tests/=
59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o.d' -o 'tes=
ts/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -c ../=
tests/chamelium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=98size=
_t=E2=80=99
   extern int drmModeCreatePropertyBlob(int fd, const void *data, size_t si=
ze,
                                                                  ^~~~~~
  /usr/include/xf86drmMode.h:520:64: note: =E2=80=98size_t=E2=80=99 is defi=
ned in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#inc=
lude <stddef.h>=E2=80=99?
  /usr/include/xf86drmMode.h:44:1:
  +#include <stddef.h>
  =20
  /usr/include/xf86drmMode.h:520:64:
   extern int drmModeCreatePropertyBlob(int fd, const void *data, size_t si=
ze,
                                                                  ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1670369883:step_script
  section_start:1670369883:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369883:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/33071497):
  [4/329] Linking target tests/kms_frontbuffer_tracking.
  [5/329] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chameli=
um_kms_chamelium_edid.c.o'.
  FAILED: tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edi=
d.c.o=20
  cc -Itests/59830eb@@kms_chamelium_edid@exe -Itests -I../tests -I../includ=
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
s -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/=
59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -MF 'test=
s/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o.d' -o 't=
ests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -c .=
./tests/chamelium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=98size=
_t=E2=80=99
    520 | extern int drmModeCreatePropertyBlob(int fd, const void *data, si=
ze_t size,
        |                                                                ^~=
~~~~
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is define=
d in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stddef.h>=E2=80=99?
     43 | #include <drm.h>
    +++ |+#include <stddef.h>
     44 |=20
  ninja: build stopped: subcommand failed.
  section_end:1670369910:step_script
  section_start:1670369910:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369912:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/33071501):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/619] Generating version.h with a custom command.
  [2/331] Linking target lib/libi915_perf.so.1.5.
  [3/331] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/331] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chameli=
um_kms_chamelium_edid.c.o'.
  FAILED: tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edi=
d.c.o=20
  clang -Itests/59830eb@@kms_chamelium_edid@exe -Itests -I../tests -I../inc=
lude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscall=
s -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-=
2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include=
/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/includ=
e/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall=
 -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h =
-D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wf=
ormat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noret=
urn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-=
arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunus=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packe=
d-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unus=
ed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissi=
ng-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-=
type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -=
fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/598=
30eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -MF 'tests/5=
9830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o.d' -o 'test=
s/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -c ../t=
ests/chamelium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name 'size_t'
  extern int drmModeCreatePropertyBlob(int fd, const void *data, size_t siz=
e,
                                                                 ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1670369983:step_script
  section_start:1670369983:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369984:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/33071500):
  [4/235] Linking target tests/kms_frontbuffer_tracking.
  [5/235] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chameli=
um_kms_chamelium_edid.c.o'.
  FAILED: tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edi=
d.c.o=20
  cc -Itests/59830eb@@kms_chamelium_edid@exe -Itests -I../tests -I../includ=
e/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype=
2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member=
 -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resul=
t -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dini=
t-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-brace=
s -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -We=
rror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-buil=
tin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@km=
s_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -MF 'tests/59830eb@@=
kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o.d' -o 'tests/59830e=
b@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -c ../tests/cha=
melium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=98size=
_t=E2=80=99
    520 | extern int drmModeCreatePropertyBlob(int fd, const void *data, si=
ze_t size,
        |                                                                ^~=
~~~~
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is define=
d in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stddef.h>=E2=80=99?
     43 | #include <drm.h>
    +++ |+#include <stddef.h>
     44 |=20
  ninja: build stopped: subcommand failed.
  section_end:1670369891:step_script
  section_start:1670369891:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369892:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/33071498):
  [3/330] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/330] Compiling C object 'tests/59830eb@@kms_chamelium_edid@exe/chameli=
um_kms_chamelium_edid.c.o'.
  FAILED: tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edi=
d.c.o=20
  cc -Itests/59830eb@@kms_chamelium_edid@exe -Itests -I../tests -I../includ=
e/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-=
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
hs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon=
 -pthread -MD -MQ 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_cham=
elium_edid.c.o' -MF 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms_ch=
amelium_edid.c.o.d' -o 'tests/59830eb@@kms_chamelium_edid@exe/chamelium_kms=
_chamelium_edid.c.o' -c ../tests/chamelium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=98size=
_t=E2=80=99
    520 | extern int drmModeCreatePropertyBlob(int fd, const void *data, si=
ze_t size,
        |                                                                ^~=
~~~~
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is define=
d in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stddef.h>=E2=80=99?
     43 | #include <drm.h>
    +++ |+#include <stddef.h>
     44 |=20
  ninja: build stopped: subcommand failed.
  section_end:1670369910:step_script
  section_start:1670369910:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369912:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/33071499):
  [4/336] Linking target tests/kms_frontbuffer_tracking.
  [5/336] Compiling C object 'tests/tests@@kms_chamelium_edid@exe/chamelium=
_kms_chamelium_edid.c.o'.
  FAILED: tests/tests@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.=
c.o=20
  cc -Itests/tests@@kms_chamelium_edid@exe -Itests -I../tests -I../include/=
drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I.=
 -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/i=
nclude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/val=
grind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Wi=
nvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_F=
ORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wforma=
t=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmiss=
ing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exter=
ns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstri=
ct-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitiali=
zed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pack=
ed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unu=
sed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Wer=
ror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmiss=
ing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn=
-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings =
-fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/t=
ests@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -MF 'tests/t=
ests@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o.d' -o 'tests/=
tests@@kms_chamelium_edid@exe/chamelium_kms_chamelium_edid.c.o' -c ../tests=
/chamelium/kms_chamelium_edid.c
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=98size=
_t=E2=80=99
    520 | extern int drmModeCreatePropertyBlob(int fd, const void *data, si=
ze_t size,
        |                                                                ^~=
~~~~
  In file included from ../tests/chamelium/kms_chamelium_edid.c:11:
  /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is define=
d in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98#inclu=
de <stddef.h>=E2=80=99?
     43 | #include <drm.h>
    +++ |+#include <stddef.h>
     44 |=20
  ninja: build stopped: subcommand failed.
  section_end:1670369893:step_script
  section_start:1670369893:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670369894:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/756452
