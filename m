Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Fri, 07 Jul 2023 02:58:40 -0000
Message-ID: <168869872028.14757.13618486255004908153@emeril.freedesktop.org>
References: <20230707015952.170155-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230707015952.170155-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/amdgpu=3A_add_vcn_decoder_and_encoder_tests_=28rev5=29?=
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

Series: tests/amdgpu: add vcn decoder and encoder tests (rev5)
URL   : https://patchwork.freedesktop.org/series/120292/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/928922 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/45054994):
  [1/631] Generating version.h with a custom command.
  [2/304] Linking target tests/amdgpu/amd_psr.
  [3/304] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itests/amdgpu -I../tests/amdgpu -=
I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I=
../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.=
0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/u=
sr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/inc=
lude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -=
I/usr/include/valgrind -I/usr/include/alsa -I/usr/include -fdiagnostics-col=
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
 -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -MF 'tests/amdgpu/b9f2=
b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_v=
cn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
    mmd_context_clean
    ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
    mmd_context_clean
                     ^
                     ;
  ninja: build stopped: subcommand failed.
  section_end:1688698409:step_script
  section_start:1688698409:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698410:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/45054997):
  [4/266] Linking target tests/amdgpu/amd_uvd_dec.
  [5/266] Linking target tests/amdgpu/amd_psr.
  [6/266] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itest=
s/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../include/=
linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/=
cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include=
 -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/u=
sr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -f=
diagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-p=
ch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_S=
OURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -W=
implicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-form=
at-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold=
-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-proto=
types -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno=
-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-=
limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-poi=
nter-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=
=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werr=
or=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-cal=
loc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -MF '=
tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2b1d@@=
amd_vcn@exe/amd_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
    mmd_context_clean
    ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
    mmd_context_clean
                     ^
                     ;
  ninja: build stopped: subcommand failed.
  section_end:1688698410:step_script
  section_start:1688698410:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698411:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/45054996):
  [3/267] Linking target tests/amdgpu/amd_plane.
  [4/267] Linking target tests/amdgpu/amd_psr.
  [5/267] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Ite=
sts/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../includ=
e/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/includ=
e/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/inc=
lude -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -=
I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau =
-I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/a=
lsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winv=
alid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FOR=
TIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-extern=
s -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstric=
t-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitializ=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wn=
o-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -W=
error=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-t=
o-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -W=
error=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point =
-Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builti=
n-calloc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' =
-MF 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2=
b1d@@amd_vcn@exe/amd_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
    mmd_context_clean
    ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
    mmd_context_clean
                     ^
                     ;
  ninja: build stopped: subcommand failed.
  section_end:1688698402:step_script
  section_start:1688698402:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698404:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/45054998):
  [6/271] Linking target tests/core_hotunplug.
  [7/271] Linking target tests/amdgpu/amd_uvd_dec.
  [8/271] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itests/a=
mdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../include/lin=
ux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/us=
r/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/inc=
lude/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnosti=
cs-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextr=
a -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2=
 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-=
fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attrib=
ute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-de=
finition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wu=
ninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -W=
no-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bo=
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthrea=
d  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -MF 'tests/amdgp=
u/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_vcn@exe=
/amd_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
    mmd_context_clean
    ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
    mmd_context_clean
                     ^
                     ;
  ninja: build stopped: subcommand failed.
  section_end:1688698406:step_script
  section_start:1688698406:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698407:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/45054989):
  [2/299] Linking target tests/amdgpu/amd_plane.
  [3/299] Linking target tests/amdgpu/amd_uvd_dec.
  [4/299] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itests/amdgpu -I../tests/amdgpu -=
I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I=
../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.=
0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/free=
type2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/n=
ouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_O=
FFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOUR=
CE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaratio=
n-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmi=
ssing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-=
prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredund=
ant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbe=
red -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-a=
rith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-=
unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bound=
s -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Wer=
ror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-=
int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs=
 -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -=
MD -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -MF 'tests/amdgpu/b9=
f2b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd=
_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
   1440 |  mmd_context_clean
        |  ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
   1440 |  mmd_context_clean
        |                   ^
        |                   ;
  ninja: build stopped: subcommand failed.
  section_end:1688698409:step_script
  section_start:1688698409:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698410:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/45054993):
  [8/304] Linking target tests/amdgpu/amd_psr.
  [9/304] Linking target tests/amdgpu/amd_uvd_enc.
  [10/304] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.=
o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  clang -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itests/amdgpu -I../tests/amdgp=
u -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib=
 -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib=
-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/f=
reetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arit=
h -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD =
-MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -MF 'tests/amdgpu/b9f2b=
1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vc=
n.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected ';' after expression
          mmd_context_clean
                           ^
                           ;
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: expression result unused [-Wun=
used-value]
          mmd_context_clean
          ^~~~~~~~~~~~~~~~~
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1688698420:step_script
  section_start:1688698420:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698421:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/45054990):
  [3/295] Linking target tests/amdgpu/amd_uvd_dec.
  [4/295] Linking target tests/amdgpu/amd_vce_dec.
  [5/295] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=
'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_vcn@exe -Itests/amdgpu -I../tests/amdgpu -=
I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I=
../lib/stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cai=
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
o-builtin-calloc -pthread -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vc=
n.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdg=
pu/b9f2b1d@@amd_vcn@exe/amd_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
   1440 |  mmd_context_clean
        |  ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
   1440 |  mmd_context_clean
        |                   ^
        |                   ;
  ninja: build stopped: subcommand failed.
  section_end:1688698399:step_script
  section_start:1688698399:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698400:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/45054991):
  [1/625] Generating version.h with a custom command.
  [2/294] Linking target tests/amdgpu/amd_vce_dec.
  [3/294] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_vcn@exe/amd_vc=
n.c.o'.
  FAILED: tests/amdgpu/tests@amdgpu@@amd_vcn@exe/amd_vcn.c.o=20
  cc -Itests/amdgpu/tests@amdgpu@@amd_vcn@exe -Itests/amdgpu -I../tests/amd=
gpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../l=
ib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gl=
ib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include=
/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/lib=
drm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_F=
ILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU=
_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecla=
ration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op=
 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmis=
sing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wr=
edundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-c=
lobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poin=
ter-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits =
-Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-=
bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast=
 -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointe=
r-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrig=
raphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthr=
ead  -MD -MQ 'tests/amdgpu/tests@amdgpu@@amd_vcn@exe/amd_vcn.c.o' -MF 'test=
s/amdgpu/tests@amdgpu@@amd_vcn@exe/amd_vcn.c.o.d' -o 'tests/amdgpu/tests@am=
dgpu@@amd_vcn@exe/amd_vcn.c.o' -c ../tests/amdgpu/amd_vcn.c
  ../tests/amdgpu/amd_vcn.c: In function =E2=80=98__igt_unique____real_main=
1419=E2=80=99:
  ../tests/amdgpu/amd_vcn.c:1440:2: warning: statement with no effect [-Wun=
used-value]
   1440 |  mmd_context_clean
        |  ^~~~~~~~~~~~~~~~~
  ../tests/amdgpu/amd_vcn.c:1440:19: error: expected =E2=80=98;=E2=80=99 be=
fore =E2=80=98igt_describe_f=E2=80=99
   1440 |  mmd_context_clean
        |                   ^
        |                   ;
  ninja: build stopped: subcommand failed.
  section_end:1688698407:step_script
  section_start:1688698407:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688698409:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/928922
