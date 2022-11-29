Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack@kde.org>
Date: Tue, 29 Nov 2022 19:42:56 -0000
Message-ID: <166975097690.23271.14273954963516761065@emeril.freedesktop.org>
References: <20221129172718.151773-1-zack@kde.org>
In-Reply-To: <20221129172718.151773-1-zack@kde.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_vmwgfx_support?=
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

Series: Add vmwgfx support
URL   : https://patchwork.freedesktop.org/series/111441/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/750879 fo=
r the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/32669378):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/972] Generating version.h with a custom command.
  [2/968] Linking static target lib/libigt-igt_kms_c.a.
  [3/968] Linking static target lib/libigt-igt_fb_c.a.
  [4/968] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.=
c.o'.
  FAILED: lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-igt_vmwgfx_c@sta -Ili=
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
builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_vmwgfx"'  -MD -M=
Q 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o' -MF 'lib/76b5a35@@igt-=
igt_vmwgfx_c@sta/igt_vmwgfx.c.o.d' -o 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/ig=
t_vmwgfx.c.o' -c ../lib/igt_vmwgfx.c
  ../lib/igt_vmwgfx.c: In function =E2=80=98vmw_format_get_caps=E2=80=99:
  ../lib/igt_vmwgfx.c:1342:31: error: cast from pointer to integer of diffe=
rent size [-Werror=3Dpointer-to-int-cast]
    vmw_ioctl_get_3d_cap(drm_fd, (uint64)cap_buffer, size);
                                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669750626:step_script
  section_start:1669750626:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669750628:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/32669380):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/974] Generating version.h with a custom command.
  [2/970] Linking static target lib/libigt-igt_kms_c.a.
  [3/970] Linking static target lib/libigt-igt_fb_c.a.
  [4/970] Compiling C object 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.=
c.o'.
  FAILED: lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-igt_vmwgfx_c@sta -Ilib -I.=
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
t-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_vmwgfx"'  -MD -MQ 'lib/76b5a35@@=
igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o' -MF 'lib/76b5a35@@igt-igt_vmwgfx_c@sta=
/igt_vmwgfx.c.o.d' -o 'lib/76b5a35@@igt-igt_vmwgfx_c@sta/igt_vmwgfx.c.o' -c=
 ../lib/igt_vmwgfx.c
  ../lib/igt_vmwgfx.c: In function =E2=80=98vmw_format_get_caps=E2=80=99:
  ../lib/igt_vmwgfx.c:1342:31: error: cast from pointer to integer of diffe=
rent size [-Werror=3Dpointer-to-int-cast]
    vmw_ioctl_get_3d_cap(drm_fd, (uint64)cap_buffer, size);
                                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1669750634:step_script
  section_start:1669750634:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669750635:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/750879
