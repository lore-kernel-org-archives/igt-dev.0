Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Jan 2022 17:41:35 -0000
Message-ID: <164304609518.1340.13535730264226042769@emeril.freedesktop.org>
References: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/i915=5Fhangman_=3A_Skips_test_for_RCS/CCS_on_DG2?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/i915/i915_hangman : Skips test for RCS/CCS on DG2
URL   : https://patchwork.freedesktop.org/series/99259/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/491555 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/17996837):
  [1/603] Generating version.h with a custom command.
  [2/358] Linking target tests/kms_fbcon_fbt.
  [3/358] Linking target tests/gem_userptr_blits.
  [4/358] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  cc -Itests/59830eb@@i915_hangman@exe -Itests -I../tests -I../include/drm-=
uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.=
./ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/includ=
e/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/li=
bdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr=
/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFF=
SET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE=
 -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-=
after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmiss=
ing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pr=
ototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbere=
d -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ari=
th -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-res=
ult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Di=
nit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-bra=
ces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -=
Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-bu=
iltin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/59830eb@=
@i915_hangman@exe/i915_i915_hangman.c.o' -MF 'tests/59830eb@@i915_hangman@e=
xe/i915_i915_hangman.c.o.d' -o 'tests/59830eb@@i915_hangman@exe/i915_i915_h=
angman.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
      if (IS_DG2(intel_get_drm_devid(device)) &&
          ^~~~~~
          IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045951:step_script
  section_start:1643045951:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045953:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/17996840):
  ninja: Entering directory `build'
  [1/543] Generating version.h with a custom command.
  [2/298] Linking target tests/gem_userptr_blits.
  [3/298] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@i915_hangman@exe -Itests =
-I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I.=
./lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/u=
sr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/in=
clude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include=
/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostic=
s-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra=
 -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 =
-Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-f=
allthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribu=
te -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-def=
inition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wun=
initialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-f=
ield-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wn=
o-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bou=
nds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -W=
error=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-t=
o-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigrap=
hs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon=
 -pthread  -MD -MQ 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o' =
-MF 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o.d' -o 'tests/598=
30eb@@i915_hangman@exe/i915_i915_hangman.c.o' -c ../tests/i915/i915_hangman=
.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
      if (IS_DG2(intel_get_drm_devid(device)) &&
          ^~~~~~
          IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045956:step_script
  section_start:1643045956:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045959:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/17996839):
  ninja: Entering directory `build'
  [1/547] Generating version.h with a custom command.
  [2/304] Linking target tests/gem_userptr_blits.
  [3/304] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@i915_hangman@exe -Itest=
s -I../tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -=
I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I=
/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/us=
r/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/inc=
lude/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiag=
nostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -=
Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURC=
E=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpl=
icit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-sty=
le-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototype=
s -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-mis=
sing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limi=
ts -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darr=
ay-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-c=
ast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoi=
nter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dt=
rigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -f=
common -pthread  -MD -MQ 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman=
.c.o' -MF 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o.d' -o 'tes=
ts/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o' -c ../tests/i915/i915_h=
angman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
      if (IS_DG2(intel_get_drm_devid(device)) &&
          ^~~~~~
          IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045957:step_script
  section_start:1643045957:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045960:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/17996841):
  ninja: Entering directory `build'
  [1/546] Generating version.h with a custom command.
  [2/301] Linking target tests/gem_userptr_blits.
  [3/301] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@i915_hangman@exe -Itests -I.=
./tests -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../l=
ib/stubs/syscalls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/=
include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/=
pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng=
16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-=
linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
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
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pth=
read  -MD -MQ 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o' -MF '=
tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o.d' -o 'tests/59830eb@=
@i915_hangman@exe/i915_i915_hangman.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
      if (IS_DG2(intel_get_drm_devid(device)) &&
          ^~~~~~
          IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045967:step_script
  section_start:1643045967:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045971:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/17996832):
  ninja: Entering directory `build'
  [1/612] Generating version.h with a custom command.
  [2/368] Linking target tests/gem_userptr_blits.
  [3/368] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  cc -Itests/59830eb@@i915_hangman@exe -Itests -I../tests -I../include/drm-=
uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.=
./ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/inclu=
de -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16=
 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrin=
d -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winval=
id-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTI=
FY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D=
2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-=
format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -=
Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-p=
rototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized =
-Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-m=
ember -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-=
result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830=
eb@@i915_hangman@exe/i915_i915_hangman.c.o' -MF 'tests/59830eb@@i915_hangma=
n@exe/i915_i915_hangman.c.o.d' -o 'tests/59830eb@@i915_hangman@exe/i915_i91=
5_hangman.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
    448 |    if (IS_DG2(intel_get_drm_devid(device)) &&
        |        ^~~~~~
        |        IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045903:step_script
  section_start:1643045903:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045905:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/17996836):
  [5/376] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  clang -Itests/59830eb@@i915_hangman@exe -Itests -I../tests -I../include/d=
rm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. =
-I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/in=
clude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpn=
g16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valg=
rind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winv=
alid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FOR=
TIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-mem=
ber -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-re=
sult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3D=
init-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@=
@i915_hangman@exe/i915_i915_hangman.c.o' -MF 'tests/59830eb@@i915_hangman@e=
xe/i915_i915_hangman.c.o.d' -o 'tests/59830eb@@i915_hangman@exe/i915_i915_h=
angman.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on 'IS_DG2' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          if (IS_DG2(intel_get_drm_devid(device)) &&
                              ^
  ../tests/i915/i915_hangman.c:472:8: error: implicit declaration of functi=
on 'IS_DG2' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          if (IS_DG2(intel_get_drm_devid(device)) &&
                              ^
  ../tests/i915/i915_hangman.c:495:8: error: implicit declaration of functi=
on 'IS_DG2' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                          if (IS_DG2(intel_get_drm_devid(device)) &&
                              ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1643045970:step_script
  section_start:1643045970:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045974:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/17996835):
  ninja: Entering directory `build'
  [1/513] Generating version.h with a custom command.
  [2/272] Linking target tests/gem_userptr_blits.
  [3/272] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  cc -Itests/59830eb@@i915_hangman@exe -Itests -I../tests -I../include/drm-=
uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.=
./ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/l=
ib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/u=
sr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnos=
tics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wex=
tra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpli=
cit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-miss=
ing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wn=
o-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -W=
error=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-se=
lf -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -W=
error=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@i915_h=
angman@exe/i915_i915_hangman.c.o' -MF 'tests/59830eb@@i915_hangman@exe/i915=
_i915_hangman.c.o.d' -o 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.=
c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
    448 |    if (IS_DG2(intel_get_drm_devid(device)) &&
        |        ^~~~~~
        |        IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045949:step_script
  section_start:1643045949:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045952:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/17996833):
  ninja: Entering directory `build'
  [1/615] Generating version.h with a custom command.
  [2/371] Linking target tests/gem_userptr_blits.
  [3/371] Compiling C object 'tests/59830eb@@i915_hangman@exe/i915_i915_han=
gman.c.o'.
  FAILED: tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o=20
  cc -Itests/59830eb@@i915_hangman@exe -Itests -I../tests -I../include/drm-=
uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.=
./ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype=
2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouve=
au -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSE=
T_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -=
include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-af=
ter-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissin=
g-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prot=
otypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-=
decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered =
-Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith=
 -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unus=
ed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -W=
error=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pth=
read -MD -MQ 'tests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o' -MF 't=
ests/59830eb@@i915_hangman@exe/i915_i915_hangman.c.o.d' -o 'tests/59830eb@@=
i915_hangman@exe/i915_i915_hangman.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
    448 |    if (IS_DG2(intel_get_drm_devid(device)) &&
        |        ^~~~~~
        |        IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045904:step_script
  section_start:1643045904:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045906:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/17996834):
  ninja: Entering directory `build'
  [1/611] Generating version.h with a custom command.
  [2/363] Linking target tests/gem_userptr_blits.
  [3/363] Compiling C object 'tests/tests@@i915_hangman@exe/i915_i915_hangm=
an.c.o'.
  FAILED: tests/tests@@i915_hangman@exe/i915_i915_hangman.c.o=20
  cc -Itests/tests@@i915_hangman@exe -Itests -I../tests -I../include/drm-ua=
pi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../=
 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include=
 -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -=
I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind =
-fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid=
-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY=
_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 =
-Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wo=
ld-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pro=
totypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-mem=
ber -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-re=
sult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3D=
init-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/tests@@=
i915_hangman@exe/i915_i915_hangman.c.o' -MF 'tests/tests@@i915_hangman@exe/=
i915_i915_hangman.c.o.d' -o 'tests/tests@@i915_hangman@exe/i915_i915_hangma=
n.c.o' -c ../tests/i915/i915_hangman.c
  ../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
  ../tests/i915/i915_hangman.c:448:8: error: implicit declaration of functi=
on =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
    448 |    if (IS_DG2(intel_get_drm_devid(device)) &&
        |        ^~~~~~
        |        IS_DG1
  ../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of=
 =E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1643045906:step_script
  section_start:1643045906:cleanup_file_variables
  Cleaning up file based variables
  section_end:1643045908:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/491555
