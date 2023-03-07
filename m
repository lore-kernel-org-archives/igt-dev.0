Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Stolarek" <karolina.stolarek@intel.com>
Date: Tue, 07 Mar 2023 15:41:45 -0000
Message-ID: <167820370522.31450.14954414909607547038@emeril.freedesktop.org>
References: <cover.1678197486.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678197486.git.karolina.stolarek@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_U?=
 =?utf-8?q?pdate_gem=5Fblits_for_newer_generations?=
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

Series: Update gem_blits for newer generations
URL   : https://patchwork.freedesktop.org/series/114776/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/823970 fo=
r the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/37626145):
  [1/1107] Generating version.h with a custom command.
  [2/1105] Linking static target lib/libigt-i915_intel_decode_c.a.
  [3/1105] Linking static target lib/libigt-instdone_c.a.
  [4/1105] Linking static target lib/libigt-intel_allocator_c.a.
  [5/1105] Linking static target lib/libigt-intel_allocator_simple_c.a.
  [6/1105] Linking static target lib/libigt-amdgpu_amd_cp_dma_c.a.
  [7/1105] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/int=
el_batchbuffer.c.o'.
  FAILED: lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_batchbuffer_c@sta=
 -Ilib -I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stub=
s/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include=
/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdr=
m -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/inc=
lude/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FIL=
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
no-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr=
/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/te=
sts"' '-DIGT_LOG_DOMAIN=3D"intel_batchbuffer"'  -MD -MQ 'lib/76b5a35@@igt-i=
ntel_batchbuffer_c@sta/intel_batchbuffer.c.o' -MF 'lib/76b5a35@@igt-intel_b=
atchbuffer_c@sta/intel_batchbuffer.c.o.d' -o 'lib/76b5a35@@igt-intel_batchb=
uffer_c@sta/intel_batchbuffer.c.o' -c ../lib/intel_batchbuffer.c
  ../lib/intel_batchbuffer.c:40:10: fatal error: intel_bufmgr.h: No such fi=
le or directory
   #include "intel_bufmgr.h"
            ^~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1678203266:step_script
  section_start:1678203266:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678203269:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/37626144):
  [2/1105] Linking static target lib/libigt-i915_intel_decode_c.a.
  [3/1105] Linking static target lib/libigt-intel_allocator_c.a.
  [4/1105] Linking static target lib/libigt-instdone_c.a.
  [5/1105] Linking static target lib/libigt-intel_allocator_msgchannel_c.a.
  [6/1105] Linking static target lib/libigt-intel_allocator_reloc_c.a.
  [7/1105] Linking static target lib/libigt-intel_allocator_simple_c.a.
  [8/1105] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/int=
el_batchbuffer.c.o'.
  FAILED: lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-intel_batchbuffer_c@s=
ta -Ilib -I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/st=
ubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inc=
lude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/l=
ibdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gnueabihf -I/u=
sr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D=
_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wd=
eclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogica=
l-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-=
pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno=
-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=
=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci=
-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_batchbuffer"'  -MD -MQ 'lib/76b5a3=
5@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o' -MF 'lib/76b5a35@@igt=
-intel_batchbuffer_c@sta/intel_batchbuffer.c.o.d' -o 'lib/76b5a35@@igt-inte=
l_batchbuffer_c@sta/intel_batchbuffer.c.o' -c ../lib/intel_batchbuffer.c
  ../lib/intel_batchbuffer.c:40:10: fatal error: intel_bufmgr.h: No such fi=
le or directory
   #include "intel_bufmgr.h"
            ^~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1678203260:step_script
  section_start:1678203260:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678203260:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/37626146):
  [2/1106] Linking static target lib/libigt-i915_intel_decode_c.a.
  [3/1106] Linking static target lib/libigt-intel_allocator_c.a.
  [4/1106] Linking static target lib/libigt-instdone_c.a.
  [5/1106] Linking static target lib/libigt-intel_allocator_msgchannel_c.a.
  [6/1106] Linking static target lib/libigt-intel_allocator_reloc_c.a.
  [7/1106] Linking static target lib/libigt-intel_allocator_simple_c.a.
  [8/1106] Compiling C object 'lib/76b5a35@@igt-intel_batchbuffer_c@sta/int=
el_batchbuffer.c.o'.
  FAILED: lib/76b5a35@@igt-intel_batchbuffer_c@sta/intel_batchbuffer.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_batchbuffer_c@sta -I=
lib -I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/m=
ips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid =
-I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/u=
sr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/include/valg=
rind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_=
BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -in=
clude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-afte=
r-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-=
declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-protot=
ypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-de=
cls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -W=
no-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -=
Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result =
-Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-=
self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werr=
or=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builti=
n-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/sh=
are/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-D=
IGT_LOG_DOMAIN=3D"intel_batchbuffer"'  -MD -MQ 'lib/76b5a35@@igt-intel_batc=
hbuffer_c@sta/intel_batchbuffer.c.o' -MF 'lib/76b5a35@@igt-intel_batchbuffe=
r_c@sta/intel_batchbuffer.c.o.d' -o 'lib/76b5a35@@igt-intel_batchbuffer_c@s=
ta/intel_batchbuffer.c.o' -c ../lib/intel_batchbuffer.c
  ../lib/intel_batchbuffer.c:40:10: fatal error: intel_bufmgr.h: No such fi=
le or directory
   #include "intel_bufmgr.h"
            ^~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1678203263:step_script
  section_start:1678203263:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1678203264:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/823970
