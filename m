Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Oct 2021 20:51:04 -0000
Message-ID: <163467666462.5185.3547187153445333343@emeril.freedesktop.org>
References: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_k?=
 =?utf-8?q?ms=3A_Run_tiled_display_tests_on_any_set_of_connectors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: kms: Run tiled display tests on any set of connectors
URL   : https://patchwork.freedesktop.org/series/96027/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/427490 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/14926441):
  [1/758] Generating version.h with a custom command.
  [2/676] Linking target tests/kms_properties.
  [3/676] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tile=
d_display.c.o'.
  FAILED: tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  cc -Itests/59830eb@@kms_tiled_display@exe -Itests -I../tests -I../include=
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
30eb@@kms_tiled_display@exe/kms_tiled_display.c.o' -MF 'tests/59830eb@@kms_=
tiled_display@exe/kms_tiled_display.c.o.d' -o 'tests/59830eb@@kms_tiled_dis=
play@exe/kms_tiled_display.c.o' -c ../tests/kms_tiled_display.c
  ../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_m=
ain575=E2=80=99:
  ../tests/kms_tiled_display.c:622:30: error: incompatible type for argumen=
t 1 of =E2=80=98chamelium_reset_state=E2=80=99
      chamelium_reset_state(data.display, data.chamelium,
                            ~~~~^~~~~~~~
  In file included from ../lib/igt.h:46,
                   from ../tests/kms_tiled_display.c:39:
  ../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
   chamelium_reset_state(igt_display_t *display,
                         ~~~~~~~~~~~~~~~^~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1634676574:step_script
  section_start:1634676574:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676575:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/14926436):
  [4/677] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tile=
d_display.c.o'.
  FAILED: tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  cc -Itests/59830eb@@kms_tiled_display@exe -Itests -I../tests -I../include=
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
9830eb@@kms_tiled_display@exe/kms_tiled_display.c.o' -MF 'tests/59830eb@@km=
s_tiled_display@exe/kms_tiled_display.c.o.d' -o 'tests/59830eb@@kms_tiled_d=
isplay@exe/kms_tiled_display.c.o' -c ../tests/kms_tiled_display.c
  ../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_m=
ain575=E2=80=99:
  ../tests/kms_tiled_display.c:622:30: error: incompatible type for argumen=
t 1 of =E2=80=98chamelium_reset_state=E2=80=99
    622 |    chamelium_reset_state(data.display, data.chamelium,
        |                          ~~~~^~~~~~~~
        |                              |
        |                              igt_display_t {aka struct igt_displa=
y}
  In file included from ../lib/igt.h:46,
                   from ../tests/kms_tiled_display.c:39:
  ../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
    136 | chamelium_reset_state(igt_display_t *display,
        |                       ~~~~~~~~~~~~~~~^~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1634676574:step_script
  section_start:1634676574:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676576:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/14926440):
  [1/758] Generating version.h with a custom command.
  [2/674] Linking target tests/kms_sequence.
  [3/674] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tile=
d_display.c.o'.
  FAILED: tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  clang -Itests/59830eb@@kms_tiled_display@exe -Itests -I../tests -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include=
/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -=
D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wfo=
rmat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretu=
rn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-a=
rith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunuse=
d -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed=
-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unuse=
d-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werro=
r=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissin=
g-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-t=
ype -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -f=
no-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/5983=
0eb@@kms_tiled_display@exe/kms_tiled_display.c.o' -MF 'tests/59830eb@@kms_t=
iled_display@exe/kms_tiled_display.c.o.d' -o 'tests/59830eb@@kms_tiled_disp=
lay@exe/kms_tiled_display.c.o' -c ../tests/kms_tiled_display.c
  ../tests/kms_tiled_display.c:622:26: error: passing 'igt_display_t' (aka =
'struct igt_display') to parameter of incompatible type 'igt_display_t *' (=
aka 'struct igt_display *'); take the address with &
                          chamelium_reset_state(data.display, data.chameliu=
m,
                                                ^~~~~~~~~~~~
                                                &
  ../lib/igt_chamelium.h:136:38: note: passing argument to parameter 'displ=
ay' here
  chamelium_reset_state(igt_display_t *display,
                                       ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1634676582:step_script
  section_start:1634676582:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676583:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/14926439):
  FAILED: tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  cc -Itests/59830eb@@kms_tiled_display@exe -Itests -I../tests -I../include=
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
_tiled_display@exe/kms_tiled_display.c.o' -MF 'tests/59830eb@@kms_tiled_dis=
play@exe/kms_tiled_display.c.o.d' -o 'tests/59830eb@@kms_tiled_display@exe/=
kms_tiled_display.c.o' -c ../tests/kms_tiled_display.c
  ../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_m=
ain575=E2=80=99:
  ../tests/kms_tiled_display.c:622:30: error: incompatible type for argumen=
t 1 of =E2=80=98chamelium_reset_state=E2=80=99
    622 |    chamelium_reset_state(data.display, data.chamelium,
        |                          ~~~~^~~~~~~~
        |                              |
        |                              igt_display_t {aka struct igt_displa=
y}
  In file included from ../lib/igt.h:46,
                   from ../tests/kms_tiled_display.c:39:
  ../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
    136 | chamelium_reset_state(igt_display_t *display,
        |                       ~~~~~~~~~~~~~~~^~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1634676564:step_script
  section_start:1634676564:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676565:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/14926437):
  [3/673] Compiling C object 'tests/59830eb@@kms_tiled_display@exe/kms_tile=
d_display.c.o'.
  FAILED: tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  cc -Itests/59830eb@@kms_tiled_display@exe -Itests -I../tests -I../include=
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
-pthread -MD -MQ 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.=
o' -MF 'tests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o.d' -o 't=
ests/59830eb@@kms_tiled_display@exe/kms_tiled_display.c.o' -c ../tests/kms_=
tiled_display.c
  ../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_m=
ain575=E2=80=99:
  ../tests/kms_tiled_display.c:622:30: error: incompatible type for argumen=
t 1 of =E2=80=98chamelium_reset_state=E2=80=99
    622 |    chamelium_reset_state(data.display, data.chamelium,
        |                          ~~~~^~~~~~~~
        |                              |
        |                              igt_display_t {aka struct igt_displa=
y}
  In file included from ../lib/igt.h:46,
                   from ../tests/kms_tiled_display.c:39:
  ../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
    136 | chamelium_reset_state(igt_display_t *display,
        |                       ~~~~~~~~~~~~~~~^~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1634676575:step_script
  section_start:1634676575:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676576:cleanup_file_variables
  ERROR: Job failed: exit code 1

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/14926438):
  [3/673] Compiling C object 'tests/tests@@kms_tiled_display@exe/kms_tiled_=
display.c.o'.
  FAILED: tests/tests@@kms_tiled_display@exe/kms_tiled_display.c.o=20
  cc -Itests/tests@@kms_tiled_display@exe -Itests -I../tests -I../include/d=
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
sts@@kms_tiled_display@exe/kms_tiled_display.c.o' -MF 'tests/tests@@kms_til=
ed_display@exe/kms_tiled_display.c.o.d' -o 'tests/tests@@kms_tiled_display@=
exe/kms_tiled_display.c.o' -c ../tests/kms_tiled_display.c
  ../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_m=
ain575=E2=80=99:
  ../tests/kms_tiled_display.c:622:30: error: incompatible type for argumen=
t 1 of =E2=80=98chamelium_reset_state=E2=80=99
    622 |    chamelium_reset_state(data.display, data.chamelium,
        |                          ~~~~^~~~~~~~
        |                              |
        |                              igt_display_t {aka struct igt_displa=
y}
  In file included from ../lib/igt.h:46,
                   from ../tests/kms_tiled_display.c:39:
  ../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
    136 | chamelium_reset_state(igt_display_t *display,
        |                       ~~~~~~~~~~~~~~~^~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1634676576:step_script
  section_start:1634676576:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634676577:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/427490
