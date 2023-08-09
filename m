Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 09 Aug 2023 05:15:42 -0000
Message-ID: <169155814259.10296.7693212577083705948@emeril.freedesktop.org>
References: <20230809045740.275175-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230809045740.275175-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fplane=5Fcursor=3A_Handle_invalid_pipe_in_big_joiner_?=
 =?utf-8?b?KHJldjMp?=
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

Series: tests/kms_plane_cursor: Handle invalid pipe in big joiner (rev3)
URL   : https://patchwork.freedesktop.org/series/119890/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/956223 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/46969274):
  [11/1044] Generating kms_plane.testlist with a meson_exe.py custom comman=
d.
  [12/1044] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_pla=
ne_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  cc -Itests/59830eb@@kms_plane_cursor@exe -Itests -I../tests -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib=
/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/u=
uid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm =
-I/usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/includ=
e/valgrind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways =
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
59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tests/59830eb@@kms=
_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/59830eb@@kms_plane_curs=
or@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
    igt_display_t *display =3D &data->display;
                   ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
       igt_display_reset(display);
                         ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557965:step_script
  section_start:1691557965:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557965:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/46969277):
  [7/981] Generating kms_plane.testlist with a meson_exe.py custom command.
  [8/981] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane=
_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_plane_cursor@exe -Ite=
sts -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -=
Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr=
/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/incl=
ude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/li=
bpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/a=
arch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-=
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
-MD -MQ 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tes=
ts/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/59830eb@=
@kms_plane_cursor@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
    igt_display_t *display =3D &data->display;
                   ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
       igt_display_reset(display);
                         ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557944:step_script
  section_start:1691557944:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557944:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/46969276):
  [9/989] Generating kms_plane.testlist with a meson_exe.py custom command.
  [10/989] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plan=
e_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_plane_cursor@exe -I=
tests -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi=
 -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/u=
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
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pt=
hread  -MD -MQ 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -=
MF 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/5=
9830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cu=
rsor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
    igt_display_t *display =3D &data->display;
                   ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
       igt_display_reset(display);
                         ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557964:step_script
  section_start:1691557964:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557965:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/46969278):
  [7/990] Generating kms_lease.testlist with a meson_exe.py custom command.
  [8/990] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane=
_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_plane_cursor@exe -Itests=
 -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ =
'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tests/59830=
eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/59830eb@@kms_pla=
ne_cursor@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
    igt_display_t *display =3D &data->display;
                   ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
       igt_display_reset(display);
                         ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557975:step_script
  section_start:1691557975:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557976:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/46969269):
  [9/1046] Generating kms_plane_alpha_blend.testlist with a meson_exe.py cu=
stom command.
  [10/1046] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_pla=
ne_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  cc -Itests/59830eb@@kms_plane_cursor@exe -Itests -I../tests -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib=
64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr=
/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/us=
r/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-decl=
arations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes=
 -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls =
-Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-m=
aybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-=
address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-par=
ameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmai=
n -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast =
-Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ '=
tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tests/59830e=
b@@kms_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/59830eb@@kms_plan=
e_cursor@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
     74 |  igt_display_t *display =3D &data->display;
        |                 ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
    308 |     igt_display_reset(display);
        |                       ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557960:step_script
  section_start:1691557960:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557960:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/46969273):
  [4/1045] Linking target tests/core_hotunplug.
  [5/1045] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1045] Generating kms_plane.testlist with a meson_exe.py custom command.
  [7/1045] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plan=
e_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  clang -Itests/59830eb@@kms_plane_cursor@exe -Itests -I../tests -I../inclu=
de -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/st=
ubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition=
 -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitial=
ized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addre=
ss-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramete=
r -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimp=
licit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Wer=
ror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werro=
r=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrit=
e-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/5=
9830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tests/59830eb@@kms_=
plane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/59830eb@@kms_plane_curso=
r@exe/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable 'display' [-W=
unused-variable]
          igt_display_t *display =3D &data->display;
                         ^
  ../tests/kms_plane_cursor.c:308:23: error: use of undeclared identifier '=
display'
                                  igt_display_reset(display);
                                                    ^
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1691557961:step_script
  section_start:1691557961:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557962:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/46969272):
  [9/925] Generating kms_plane.testlist with a meson_exe.py custom command.
  [10/925] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plan=
e_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  cc -Itests/59830eb@@kms_plane_cursor@exe -Itests -I../tests -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib=
64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr=
/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnosti=
cs-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextr=
a -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2=
 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-=
fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attrib=
ute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-de=
finition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wu=
ninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-si=
gn-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werro=
r=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -=
Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werro=
r=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Ds=
equence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mall=
oc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@kms_plane_cursor@ex=
e/kms_plane_cursor.c.o' -MF 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_=
cursor.c.o.d' -o 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'=
 -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
     74 |  igt_display_t *display =3D &data->display;
        |                 ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
    308 |     igt_display_reset(display);
        |                       ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557960:step_script
  section_start:1691557960:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557960:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/46969270):
  [8/1043] Generating kms_plane.testlist with a meson_exe.py custom command.
  [9/1043] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plan=
e_cursor.c.o'.
  FAILED: tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  cc -Itests/59830eb@@kms_plane_cursor@exe -Itests -I../tests -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr=
/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -p=
ipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -=
g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast=
 -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlo=
gical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretu=
rn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-a=
rith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunuse=
d -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -=
Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type=
-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-poi=
nter-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=
=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werr=
or=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-cal=
loc -pthread -MD -MQ 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.=
c.o' -MF 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o.d' -o 't=
ests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -c ../tests/kms_pl=
ane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
     74 |  igt_display_t *display =3D &data->display;
        |                 ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
    308 |     igt_display_reset(display);
        |                       ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557961:step_script
  section_start:1691557961:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557961:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/46969271):
  [6/1043] Generating kms_plane.testlist with a meson_exe.py custom command.
  [7/1043] Compiling C object 'tests/tests@@kms_plane_cursor@exe/kms_plane_=
cursor.c.o'.
  FAILED: tests/tests@@kms_plane_cursor@exe/kms_plane_cursor.c.o=20
  cc -Itests/tests@@kms_plane_cursor@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D6=
4 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include co=
nfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statem=
ent -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarat=
ions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wn=
ested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wsh=
adow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe=
-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addr=
ess-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramet=
er -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dim=
plicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -We=
rror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werr=
or=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwri=
te-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests=
/tests@@kms_plane_cursor@exe/kms_plane_cursor.c.o' -MF 'tests/tests@@kms_pl=
ane_cursor@exe/kms_plane_cursor.c.o.d' -o 'tests/tests@@kms_plane_cursor@ex=
e/kms_plane_cursor.c.o' -c ../tests/kms_plane_cursor.c
  ../tests/kms_plane_cursor.c: In function =E2=80=98test_init=E2=80=99:
  ../tests/kms_plane_cursor.c:74:17: warning: unused variable =E2=80=98disp=
lay=E2=80=99 [-Wunused-variable]
     74 |  igt_display_t *display =3D &data->display;
        |                 ^~~~~~~
  ../tests/kms_plane_cursor.c: In function =E2=80=98__igt_unique____real_ma=
in261=E2=80=99:
  ../tests/kms_plane_cursor.c:308:23: error: =E2=80=98display=E2=80=99 unde=
clared (first use in this function)
    308 |     igt_display_reset(display);
        |                       ^~~~~~~
  ../tests/kms_plane_cursor.c:308:23: note: each undeclared identifier is r=
eported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1691557967:step_script
  section_start:1691557967:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1691557968:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/956223
