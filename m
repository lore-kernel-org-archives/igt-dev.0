Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Tue, 01 Mar 2022 14:11:08 -0000
Message-ID: <164614386875.8602.4772364965341101697@emeril.freedesktop.org>
References: <20220301124728.312967-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20220301124728.312967-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/intel=5Fmmio=3A_Fix_mmapped_resources_not_unmapped_on_fini?=
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

Series: lib/intel_mmio: Fix mmapped resources not unmapped on fini
URL   : https://patchwork.freedesktop.org/series/100882/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/521102 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/19316485):
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-ua=
pi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include=
/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include=
 -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/u=
sr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -I/=
usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.=
h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -=
Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations =
-Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested=
-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow =
-Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-unin=
itialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-comp=
are -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dadd=
ress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share=
/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT=
_LOG_DOMAIN=3D"intel_mmio"'  -MD -MQ 'lib/76b5a35@@igt-intel_mmio_c@sta/int=
el_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'l=
ib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
             mmio_size,
             ^~~~~~~~~
             mmio_bar
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98=
mmio_size=E2=80=99?
    mmio_data->mmio_data->dev =3D NULL;
               ^~~~~~~~~
               mmio_size
  ninja: build stopped: subcommand failed.
  section_end:1646143525:step_script
  section_start:1646143525:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143531:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/19316488):
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib =
-I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/sysca=
lls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib-2=
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
e-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pthread '=
-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/=
gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_mmio"'  -MD -MQ 'lib/=
76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_m=
mio_c@sta/intel_mmio.c.o.d' -o 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmi=
o.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
             mmio_size,
             ^~~~~~~~~
             mmio_bar
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98=
mmio_size=E2=80=99?
    mmio_data->mmio_data->dev =3D NULL;
               ^~~~~~~~~
               mmio_size
  ninja: build stopped: subcommand failed.
  section_end:1646143506:step_script
  section_start:1646143506:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143507:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/19316487):
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ili=
b -I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/sys=
calls -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pt=
hread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/=
builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_mmio"'  -MD -M=
Q 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -MF 'lib/76b5a35@@igt-=
intel_mmio_c@sta/intel_mmio.c.o.d' -o 'lib/76b5a35@@igt-intel_mmio_c@sta/in=
tel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
             mmio_size,
             ^~~~~~~~~
             mmio_bar
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98=
mmio_size=E2=80=99?
    mmio_data->mmio_data->dev =3D NULL;
               ^~~~~~~~~
               mmio_size
  ninja: build stopped: subcommand failed.
  section_end:1646143492:step_script
  section_start:1646143492:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143492:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/19316489):
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I.=
./lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls=
 -I. -I../ -I../lib/stubs/drm -I/usr/include/cairo -I/usr/include/glib-2.0 =
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
 -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DAT=
ADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/ig=
t-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_mmio"'  -MD -MQ 'lib/76b5a35@@=
igt-intel_mmio_c@sta/intel_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta=
/intel_mmio.c.o.d' -o 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c=
 ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
             mmio_size,
             ^~~~~~~~~
             mmio_bar
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98=
mmio_size=E2=80=99?
    mmio_data->mmio_data->dev =3D NULL;
               ^~~~~~~~~
               mmio_size
  ninja: build stopped: subcommand failed.
  section_end:1646143560:step_script
  section_start:1646143560:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143563:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/19316486):
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-ua=
pi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs=
/drm -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 =
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
uiltin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/ig=
t-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LO=
G_DOMAIN=3D"intel_mmio"'  -MD -MQ 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_=
mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'lib/=
76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
             mmio_size,
             ^~~~~~~~~
             mmio_bar
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98=
mmio_size=E2=80=99?
    mmio_data->mmio_data->dev =3D NULL;
               ^~~~~~~~~
               mmio_size
  ninja: build stopped: subcommand failed.
  section_end:1646143490:step_script
  section_start:1646143490:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143490:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/19316480):
  [17/983] Linking static target lib/libigt-ioctl_wrappers_c.a.
  [18/983] Compiling C object 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio=
.c.o'.
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-ua=
pi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include=
/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include=
/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/l=
ibdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-c=
olor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -s=
td=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wb=
ad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fall=
through=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute =
-Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defini=
tion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunini=
tialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fiel=
d-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-c=
ompare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3D=
address -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werr=
or=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3D=
nonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dseque=
nce-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -=
fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/share=
/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT=
_LOG_DOMAIN=3D"intel_mmio"' -MD -MQ 'lib/76b5a35@@igt-intel_mmio_c@sta/inte=
l_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'li=
b/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function)
    162 |           mmio_size,
        |           ^~~~~~~~~
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:11: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99
    188 |  mmio_data->mmio_data->dev =3D NULL;
        |           ^~
  ninja: build stopped: subcommand failed.
  section_end:1646143466:step_script
  section_start:1646143466:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143467:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/19316484):
  [9/979] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [10/979] Linking static target lib/libigt-intel_ctx_c.a.
  [11/979] Linking static target lib/libigt-intel_bufops_c.a.
  [12/979] Compiling C object 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio=
.c.o'.
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  clang -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm=
-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/incl=
ude/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/incl=
ude/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/includ=
e/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xclang -fco=
lor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra =
-std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -=
Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissing-dec=
larations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototype=
s -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls=
 -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-i=
nitializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-comp=
are -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dadd=
ress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share=
/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT=
_LOG_DOMAIN=3D"intel_mmio"' -MD -MQ 'lib/76b5a35@@igt-intel_mmio_c@sta/inte=
l_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'li=
b/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c:162:11: error: use of undeclared identifier 'mmio_siz=
e'
                                        mmio_size,
                                        ^
  ../lib/intel_mmio.c:188:13: error: no member named 'mmio_data' in 'struct=
 intel_mmio_data'
          mmio_data->mmio_data->dev =3D NULL;
          ~~~~~~~~~  ^
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1646143500:step_script
  section_start:1646143500:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143501:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/19316483):
  [14/877] Linking static target lib/libigt-ioctl_wrappers_c.a.
  [15/877] Compiling C object 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio=
.c.o'.
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-ua=
pi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs=
/drm -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/inc=
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
-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-=
tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMA=
IN=3D"intel_mmio"' -MD -MQ 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.=
o' -MF 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'lib/76b5a35=
@@igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function)
    162 |           mmio_size,
        |           ^~~~~~~~~
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:11: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99
    188 |  mmio_data->mmio_data->dev =3D NULL;
        |           ^~
  ninja: build stopped: subcommand failed.
  section_end:1646143476:step_script
  section_start:1646143476:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143477:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/19316481):
  [11/970] Linking static target lib/libigt-intel_ctx_c.a.
  [12/970] Compiling C object 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio=
.c.o'.
  FAILED: lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/76b5a35@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-ua=
pi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs=
/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2=
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
ngs -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_=
DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci=
/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_mmio"' -MD -MQ 'lib/76b5a35=
@@igt-intel_mmio_c@sta/intel_mmio.c.o' -MF 'lib/76b5a35@@igt-intel_mmio_c@s=
ta/intel_mmio.c.o.d' -o 'lib/76b5a35@@igt-intel_mmio_c@sta/intel_mmio.c.o' =
-c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function)
    162 |           mmio_size,
        |           ^~~~~~~~~
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:11: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99
    188 |  mmio_data->mmio_data->dev =3D NULL;
        |           ^~
  ninja: build stopped: subcommand failed.
  section_end:1646143466:step_script
  section_start:1646143466:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143466:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/19316482):
  [16/1004] Linking static target lib/libigt-intel_os_c.a.
  [17/1004] Compiling C object 'lib/lib@@igt-intel_mmio_c@sta/intel_mmio.c.=
o'.
  FAILED: lib/lib@@igt-intel_mmio_c@sta/intel_mmio.c.o=20
  cc -Ilib/lib@@igt-intel_mmio_c@sta -Ilib -I../lib -I../include/drm-uapi -=
I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pix=
man-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdr=
m -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=
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
o-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share=
/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT=
_LOG_DOMAIN=3D"intel_mmio"'  -MD -MQ 'lib/lib@@igt-intel_mmio_c@sta/intel_m=
mio.c.o' -MF 'lib/lib@@igt-intel_mmio_c@sta/intel_mmio.c.o.d' -o 'lib/lib@@=
igt-intel_mmio_c@sta/intel_mmio.c.o' -c ../lib/intel_mmio.c
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
  ../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared=
 (first use in this function)
    162 |           mmio_size,
        |           ^~~~~~~~~
  ../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported =
only once for each function it appears in
  ../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=
=99:
  ../lib/intel_mmio.c:188:11: error: =E2=80=98struct intel_mmio_data=E2=80=
=99 has no member named =E2=80=98mmio_data=E2=80=99
    188 |  mmio_data->mmio_data->dev =3D NULL;
        |           ^~
  ninja: build stopped: subcommand failed.
  section_end:1646143467:step_script
  section_start:1646143467:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1646143467:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/521102
