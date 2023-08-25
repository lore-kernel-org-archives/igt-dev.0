Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Fri, 25 Aug 2023 14:14:25 -0000
Message-ID: <169297286558.10953.2651923792144075850@emeril.freedesktop.org>
References: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?_tool_to_demonstrate_use_of_netlink_sockets_to_read_RAS_error_c?=
 =?utf-8?q?ounters_=28rev2=29?=
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

Series: A tool to demonstrate use of netlink sockets to read RAS error coun=
ters (rev2)
URL   : https://patchwork.freedesktop.org/series/118438/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970674 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/48050591):
  [1512/1633] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.=
o'.
  [1513/1633] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg_de=
code.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/813] Generating version.h with a custom command.
  [2/122] Linking target tools/intel_vbt_decode.
  [3/122] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../incl=
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
 -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tools/f9d35d4@@=
drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o.d' -o =
'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
   #include <netlink/cli/utils.h>
            ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972582:step_script
  section_start:1692972582:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972583:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/48050594):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/755] Generating version.h with a custom command.
  [2/75] Linking target tools/intel_vbt_decode.
  [3/75] Linking target tools/intel_reg.
  [4/75] Linking target tools/intel_gpu_top.
  [5/75] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itools/f9d35d4@@drm_ras@exe -Itools -I../=
tools -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I..=
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
'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/dr=
m_ras.c.o.d' -o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ra=
s.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
   #include <netlink/cli/utils.h>
            ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972609:step_script
  section_start:1692972609:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972611:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/48050593):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/755] Generating version.h with a custom command.
  [2/73] Linking target tools/intel_gpu_top.
  [3/73] Linking target tools/intel_reg.
  [4/73] Linking target tools/i915-perf/i915-perf-configs.
  [5/73] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itools/f9d35d4@@drm_ras@exe -Itools -I.=
./tools -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I=
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
 -MQ 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@e=
xe/drm_ras.c.o.d' -o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/d=
rm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
   #include <netlink/cli/utils.h>
            ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972598:step_script
  section_start:1692972598:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972598:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/48050595):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/753] Generating version.h with a custom command.
  [2/71] Linking target tools/intel_reg.
  [3/71] Linking target tools/intel_gpu_top.
  [4/71] Linking target tools/msm_dp_compliance.
  [5/71] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itools/f9d35d4@@drm_ras@exe -Itools -I../too=
ls -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
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
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tools/f=
9d35d4@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.=
o.d' -o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
   #include <netlink/cli/utils.h>
            ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972614:step_script
  section_start:1692972614:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972615:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/48050592):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/115] Generating version.h with a custom command.
  [2/22] Linking target lib/libi915_perf.so.1.5.
  [3/22] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.so=
.1.5.symbols'.
  [4/22] Linking target tools/intel_gpu_top.
  [5/22] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 =
-I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr=
/include/libdrm -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64=
 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include con=
fig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-stateme=
nt -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarati=
ons -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wne=
sted-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wsha=
dow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-=
uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-=
compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=
=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dse=
quence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mallo=
c -fno-builtin-calloc -pthread  -MD -MQ 'tools/f9d35d4@@drm_ras@exe/drm_ras=
.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o.d' -o 'tools/f9d35d4@@drm=
_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
   #include <netlink/cli/utils.h>
            ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972548:step_script
  section_start:1692972548:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972549:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/48050586):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/805] Generating version.h with a custom command.
  [2/112] Linking target tools/intel_reg.
  [3/112] Linking target tools/intel_gpu_top.
  [4/112] Linking target tools/msm_dp_compliance.
  [5/112] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../incl=
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
ngs -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tools/f9d35d4=
@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o.d' -=
o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
     11 | #include <netlink/cli/utils.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972563:step_script
  section_start:1692972563:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972564:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/48050590):
  [1525/1633] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gp=
u_top.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/804] Generating version.h with a custom command.
  [2/110] Linking target tools/intel_gpu_top.
  [3/110] Linking target tools/i915-perf/i915-perf-recorder.
  [4/110] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  clang -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysca=
lls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/gli=
b-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inclu=
de/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/incl=
ude/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.=
h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -=
Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-nor=
eturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointe=
r-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wun=
used -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pac=
ked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmis=
sing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretur=
n-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings=
 -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tools/f9d35d4@@d=
rm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o.d' -o '=
tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: 'netlink/cli/utils.h' file not fou=
nd
  #include <netlink/cli/utils.h>
           ^~~~~~~~~~~~~~~~~~~~~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1692972607:step_script
  section_start:1692972607:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972608:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/48050589):
  ninja: Entering directory `build'
  [1/725] Generating version.h with a custom command.
  [2/74] Linking target tools/intel_reg.
  [3/74] Linking target tools/intel_gpu_top.
  [4/74] Linking target tools/msm_dp_compliance.
  [5/74] Linking target tools/i915-perf/i915-perf-configs.
  [6/74] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../incl=
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
o-builtin-calloc -pthread -MD -MQ 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' =
-MF 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o.d' -o 'tools/f9d35d4@@drm_ras@e=
xe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
     11 | #include <netlink/cli/utils.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972578:step_script
  section_start:1692972578:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972580:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/48050587):
  [1520/1633] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gp=
u_top.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/808] Generating version.h with a custom command.
  [2/115] Linking target tools/intel_reg.
  [3/115] Linking target tools/intel_gpu_top.
  [4/115] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../tools -I../include -I../incl=
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
ad -MD -MQ 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm=
_ras@exe/drm_ras.c.o.d' -o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../t=
ools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
     11 | #include <netlink/cli/utils.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972578:step_script
  section_start:1692972578:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972580:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/48050588):
  [1525/1633] Compiling C object 'tools/tools@@intel_gpu_top@exe/intel_gpu_=
top.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/803] Generating version.h with a custom command.
  [2/110] Linking target tools/intel_gpu_top.
  [3/110] Linking target tools/intel_reg.
  [4/110] Compiling C object 'tools/tools@@drm_ras@exe/drm_ras.c.o'.
  FAILED: tools/tools@@drm_ras@exe/drm_ras.c.o=20
  cc -Itools/tools@@drm_ras@exe -Itools -I../tools -I../include -I../includ=
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
s -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tools/tools@@d=
rm_ras@exe/drm_ras.c.o' -MF 'tools/tools@@drm_ras@exe/drm_ras.c.o.d' -o 'to=
ols/tools@@drm_ras@exe/drm_ras.c.o' -c ../tools/drm_ras.c
  ../tools/drm_ras.c:11:10: fatal error: netlink/cli/utils.h: No such file =
or directory
     11 | #include <netlink/cli/utils.h>
        |          ^~~~~~~~~~~~~~~~~~~~~
  compilation terminated.
  ninja: build stopped: subcommand failed.
  section_end:1692972579:step_script
  section_start:1692972579:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692972580:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/970674
