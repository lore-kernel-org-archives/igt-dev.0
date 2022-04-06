Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 06 Apr 2022 18:11:51 -0000
Message-ID: <164926871159.5451.2805683856692871936@emeril.freedesktop.org>
References: <20220406162906.6057-1-swati2.sharma@intel.com>
In-Reply-To: <20220406162906.6057-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?mprovements_in_plane_scaling?=
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

Series: Improvements in plane scaling
URL   : https://patchwork.freedesktop.org/series/102280/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/552205 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/20800140):
  cc -Itests/59830eb@@kms_plane_scaling@exe -Itests -I../tests -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
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
no-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/598=
30eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -MF 'tests/59830eb@@kms_=
plane_scaling@exe/kms_plane_scaling.c.o.d' -o 'tests/59830eb@@kms_plane_sca=
ling@exe/kms_plane_scaling.c.o' -c ../tests/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
        test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
        test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268620:step_script
  section_start:1649268620:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268621:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/20800143):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_plane_scaling@exe -It=
ests -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo=
 -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/u=
sr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/inc=
lude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/in=
clude/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagn=
ostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -W=
extra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
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
ommon -pthread  -MD -MQ 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_sca=
ling.c.o' -MF 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o.d=
' -o 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -c ../tes=
ts/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
        test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
        test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268633:step_script
  section_start:1649268633:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268633:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/20800142):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_plane_scaling@exe -=
Itests -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../=
lib -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include =
-I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr=
/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/us=
r/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -=
fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-=
pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_=
SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -=
Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-for=
mat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wol=
d-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prot=
otypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wn=
o-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type=
-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-poi=
nter-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=
=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werr=
or=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-cal=
loc -fcommon -pthread  -MD -MQ 'tests/59830eb@@kms_plane_scaling@exe/kms_pl=
ane_scaling.c.o' -MF 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scalin=
g.c.o.d' -o 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -c=
 ../tests/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
        test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
        test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268633:step_script
  section_start:1649268633:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268634:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/20800144):
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_plane_scaling@exe -Itest=
s -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -=
I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I=
/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/inc=
lude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/=
mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-co=
lor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -st=
d=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wba=
d-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallt=
hrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -=
Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definit=
ion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninit=
ialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field=
-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-un=
used-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds =
-Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werro=
r=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-in=
t-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -=
Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pt=
hread  -MD -MQ 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o'=
 -MF 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o.d' -o 'tes=
ts/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -c ../tests/kms_pl=
ane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
        test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
        test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268650:step_script
  section_start:1649268650:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268651:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/20800135):
  cc -Itests/59830eb@@kms_plane_scaling@exe -Itests -I../tests -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/va=
lgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -W=
invalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_=
FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wform=
at=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmis=
sing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exte=
rns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstr=
ict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitial=
ized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pac=
ked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmis=
sing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretur=
n-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings=
 -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/5=
9830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -MF 'tests/59830eb@@km=
s_plane_scaling@exe/kms_plane_scaling.c.o.d' -o 'tests/59830eb@@kms_plane_s=
caling@exe/kms_plane_scaling.c.o' -c ../tests/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    785 |      test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, ou=
tput);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
    835 |      test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268610:step_script
  section_start:1649268610:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268613:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/20800139):
  static void test_scaler_with_rotation_pipe(data_t *d,
              ^
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on 'test_scaler_with_modifiers_pipe' is invalid in C99 [-Werror,-Wimplicit-=
function-declaration]
                                          test_scaler_with_modifiers_pipe(&=
data, 0.75 * mode->hdisplay,
                                          ^
  ../tests/kms_plane_scaling.c:835:6: note: did you mean 'test_scaler_with_=
rotation_pipe'?
  ../tests/kms_plane_scaling.c:253:13: note: 'test_scaler_with_rotation_pip=
e' declared here
  static void test_scaler_with_rotation_pipe(data_t *d,
              ^
  ../tests/kms_plane_scaling.c:848:6: error: implicit declaration of functi=
on 'test_scaler_with_modifiers_pipe' is invalid in C99 [-Werror,-Wimplicit-=
function-declaration]
                                          test_scaler_with_modifiers_pipe(&=
data, mode->hdisplay,
                                          ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1649268616:step_script
  section_start:1649268616:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268618:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/20800138):
  cc -Itests/59830eb@@kms_plane_scaling@exe -Itests -I../tests -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib-2.0 -I/=
usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2=
 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdi=
agnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch=
 -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOU=
RCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wim=
plicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format=
-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-s=
tyle-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototy=
pes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-m=
issing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member =
-Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result=
 -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit=
-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces=
 -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Wer=
ror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-built=
in-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@kms=
_plane_scaling@exe/kms_plane_scaling.c.o' -MF 'tests/59830eb@@kms_plane_sca=
ling@exe/kms_plane_scaling.c.o.d' -o 'tests/59830eb@@kms_plane_scaling@exe/=
kms_plane_scaling.c.o' -c ../tests/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    785 |      test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, ou=
tput);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
    835 |      test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268624:step_script
  section_start:1649268624:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268625:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/20800136):
  cc -Itests/59830eb@@kms_plane_scaling@exe -Itests -I../tests -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2=
.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/fre=
etype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/=
nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno=
-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-boun=
ds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -We=
rror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to=
-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraph=
s -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon =
-pthread -MD -MQ 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.=
o' -MF 'tests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o.d' -o 't=
ests/59830eb@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -c ../tests/kms_=
plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    785 |      test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, ou=
tput);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
    835 |      test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268625:step_script
  section_start:1649268625:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268626:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/20800137):
  cc -Itests/tests@@kms_plane_scaling@exe -Itests -I../tests -I../include/d=
rm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. =
-I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/in=
clude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpn=
g16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valg=
rind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FO=
RTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-extern=
s -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstric=
t-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitializ=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packe=
d-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unus=
ed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissi=
ng-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-=
type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -=
fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/te=
sts@@kms_plane_scaling@exe/kms_plane_scaling.c.o' -MF 'tests/tests@@kms_pla=
ne_scaling@exe/kms_plane_scaling.c.o.d' -o 'tests/tests@@kms_plane_scaling@=
exe/kms_plane_scaling.c.o' -c ../tests/kms_plane_scaling.c
  ../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_m=
ain622=E2=80=99:
  ../tests/kms_plane_scaling.c:785:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98=
test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    785 |      test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, ou=
tput);
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
  ../tests/kms_plane_scaling.c:835:6: error: implicit declaration of functi=
on =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=
=98test_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
    835 |      test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        |      test_scaler_with_rotation_pipe
  ../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1649268623:step_script
  section_start:1649268623:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1649268624:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/552205
