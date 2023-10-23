Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Date: Mon, 23 Oct 2023 21:23:19 -0000
Message-ID: <169809619904.19838.12871895257000287223@emeril.freedesktop.org>
References: <20231019212301.245282-1-harry.wentland@amd.com>
In-Reply-To: <20231019212301.245282-1-harry.wentland@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?GT_tests_for_the_KMS_Color_Pipeline_API_=28rev2=29?=
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

Series: IGT tests for the KMS Color Pipeline API (rev2)
URL   : https://patchwork.freedesktop.org/series/123448/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1017014 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/50654399):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1632] Generating version.h with a custom command.
  [2/1632] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1632] Linking static target lib/libigt-drmtest_c.a.
  [4/1632] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include =
-I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -=
I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-g=
nu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/incl=
ude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/=
libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/u=
sr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_O=
FFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOUR=
CE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaratio=
n-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmi=
ssing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-=
prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredund=
ant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbe=
red -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-a=
rith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-r=
esult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/=
local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tes=
ts"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"'  -MD -MQ 'lib/76b5a35@@igt-dma=
buf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_sync=
_file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_file_c=
@sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    drmModeColorop *drm_colorop;
    ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096163:step_script
  section_start:1698096163:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096164:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/50654402):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1295] Generating version.h with a custom command.
  [2/1295] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1295] Linking static target lib/libigt-drmtest_c.a.
  [4/1295] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta =
-Ilib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -=
I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2=
.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I=
/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/i=
nclude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gn=
u -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways =
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
e-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DAT=
ADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/ig=
t-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"'  -MD -MQ 'lib/76b=
5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5a35@@ig=
t-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@igt-dmabu=
f_sync_file_c@sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    drmModeColorop *drm_colorop;
    ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096171:step_script
  section_start:1698096171:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096172:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/50654401):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1300] Generating version.h with a custom command.
  [2/1300] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1300] Linking static target lib/libigt-drmtest_c.a.
  [4/1300] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@st=
a -Ilib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-D=
IGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gf=
x-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"'  -MD -MQ '=
lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5=
a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@ig=
t-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    drmModeColorop *drm_colorop;
    ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096175:step_script
  section_start:1698096175:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096176:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/50654403):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1296] Generating version.h with a custom command.
  [2/1296] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1296] Linking static target lib/libigt-drmtest_c.a.
  [4/1296] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Il=
ib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I..=
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
 -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/=
usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags=
/tests"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"'  -MD -MQ 'lib/76b5a35@@igt=
-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_=
sync_file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_fi=
le_c@sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    drmModeColorop *drm_colorop;
    ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096173:step_script
  section_start:1698096173:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096175:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/50654400):
  [30/556] Generating i915-perf-equations with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/530] Generating version.h with a custom command.
  [2/529] Linking static target lib/libigt-drmtest_c.a.
  [3/529] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabu=
f_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include =
-I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -=
I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 =
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr=
/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/inclu=
de/libdrm -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall=
 -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h =
-D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wf=
ormat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -W=
missing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-e=
xterns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -W=
strict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninit=
ialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compar=
e -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddre=
ss -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3D=
int-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnu=
ll -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-p=
oint -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-b=
uiltin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-too=
ls"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=
=3D"dmabuf_sync_file"'  -MD -MQ 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dm=
abuf_sync_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_syn=
c_file.c.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.=
c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    drmModeColorop *drm_colorop;
    ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096165:step_script
  section_start:1698096165:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096166:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/50654394):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1639] Generating version.h with a custom command.
  [2/1639] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1639] Linking static target lib/libigt-drmtest_c.a.
  [4/1639] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include =
-I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -=
I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/inc=
lude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng=
16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgr=
ind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winv=
alid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FOR=
TIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
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
fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/op=
t/igt/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tes=
ts"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"' -MD -MQ 'lib/76b5a35@@igt-dmab=
uf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_sync_=
file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_file_c@=
sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    399 |  drmModeColorop *drm_colorop;
        |  ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096163:step_script
  section_start:1698096163:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096165:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/50654398):
  [4/1637] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  clang -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../inclu=
de -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I=
. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/va=
lgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Wi=
nvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_F=
ORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wforma=
t=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn =
-Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arit=
h -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -=
Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-me=
mber -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-r=
esult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/=
local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tes=
ts"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"' -MD -MQ 'lib/76b5a35@@igt-dmab=
uf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_sync_=
file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_file_c@=
sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/dmabuf_sync_file.c:6:
  In file included from ../lib/igt.h:38:
  ../lib/igt_kms.h:399:2: error: unknown type name 'drmModeColorop'; did yo=
u mean 'drmModeClip'?
          drmModeColorop *drm_colorop;
          ^~~~~~~~~~~~~~
          drmModeClip
  /usr/include/xf86drmMode.h:226:30: note: 'drmModeClip' declared here
  typedef struct drm_clip_rect drmModeClip, *drmModeClipPtr;
                               ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1698096170:step_script
  section_start:1698096170:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096171:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/50654397):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1477] Generating version.h with a custom command.
  [2/1477] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1477] Linking static target lib/libigt-drmtest_c.a.
  [4/1477] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include =
-I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -=
I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/inc=
lude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng=
16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno=
-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -We=
rror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to=
-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -We=
rror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -=
Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin=
-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '=
-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"dma=
buf_sync_file"' -MD -MQ 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_syn=
c_file.c.o' -MF 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c=
.o.d' -o 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -c =
../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    399 |  drmModeColorop *drm_colorop;
        |  ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096163:step_script
  section_start:1698096163:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096165:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/50654395):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1640] Generating version.h with a custom command.
  [2/1640] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1640] Linking static target lib/libigt-drmtest_c.a.
  [4/1640] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmab=
uf_sync_file.c.o'.
  FAILED: lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/76b5a35@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include =
-I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -=
I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 =
-I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freety=
pe2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nou=
veau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFF=
SET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE=
 -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-=
after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmiss=
ing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pr=
ototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbere=
d -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ari=
th -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-un=
used-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds =
-Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werro=
r=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-in=
t-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -=
Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthre=
ad '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/bui=
lds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"' -MD =
-MQ 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib=
/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o.d' -o 'lib/76b5a3=
5@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o' -c ../lib/dmabuf_sync_f=
ile.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    399 |  drmModeColorop *drm_colorop;
        |  ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096165:step_script
  section_start:1698096165:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096166:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/50654396):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1641] Generating version.h with a custom command.
  [2/1641] Compiling C object 'lib/lib@@igt-drmtest_c@sta/drmtest.c.o'.
  [3/1641] Linking static target lib/libigt-drmtest_c.a.
  [4/1641] Compiling C object 'lib/lib@@igt-dmabuf_sync_file_c@sta/dmabuf_s=
ync_file.c.o'.
  FAILED: lib/lib@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o=20
  cc -Ilib/lib@@igt-dmabuf_sync_file_c@sta -Ilib -I../lib -I../include -I..=
/include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../=
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
uiltin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/loc=
al/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"=
' '-DIGT_LOG_DOMAIN=3D"dmabuf_sync_file"'  -MD -MQ 'lib/lib@@igt-dmabuf_syn=
c_file_c@sta/dmabuf_sync_file.c.o' -MF 'lib/lib@@igt-dmabuf_sync_file_c@sta=
/dmabuf_sync_file.c.o.d' -o 'lib/lib@@igt-dmabuf_sync_file_c@sta/dmabuf_syn=
c_file.c.o' -c ../lib/dmabuf_sync_file.c
  In file included from ../lib/igt.h:38,
                   from ../lib/dmabuf_sync_file.c:6:
  ../lib/igt_kms.h:399:2: error: unknown type name =E2=80=98drmModeColorop=
=E2=80=99
    399 |  drmModeColorop *drm_colorop;
        |  ^~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1698096166:step_script
  section_start:1698096166:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1698096167:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1017014
