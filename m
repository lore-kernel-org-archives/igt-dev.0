Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Thu, 24 Aug 2023 17:45:44 -0000
Message-ID: <169289914447.13342.3374050101940804639@emeril.freedesktop.org>
References: <20230824161504.154365-1-aurabindo.pillai@amd.com>
In-Reply-To: <20230824161504.154365-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/3=5D_tests/amdgpu/amd=5Fmall=3A_Add_cr?=
 =?utf-8?q?c_check?=
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

Series: series starting with [1/3] tests/amdgpu/amd_mall: Add crc check
URL   : https://patchwork.freedesktop.org/series/122852/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/969821 fo=
r the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/47999493):
  [2/1397] Linking static target lib/libigt-igt_kms_c.a.
  [3/1397] Linking static target lib/libigt-igt_fb_c.a.
  [4/1397] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
  FAILED: lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o=20
  cc -Ilib/76b5a35@@igt-igt_amd_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/u=
sr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr=
/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdia=
gnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch =
-Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOUR=
CE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimp=
licit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-=
attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-st=
yle-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototyp=
es -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-mi=
ssing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -=
Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result =
-Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-=
self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werr=
or=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builti=
n-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/shar=
e/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIG=
T_LOG_DOMAIN=3D"igt_amd"' -MD -MQ 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c=
.o' -MF 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o.d' -o 'lib/76b5a35@@igt=
-igt_amd_c@sta/igt_amd.c.o' -c ../lib/igt_amd.c
  ../lib/igt_amd.c: In function =E2=80=98igt_amd_get_mall_status=E2=80=99:
  ../lib/igt_amd.c:1198:10: error: =E2=80=98return=E2=80=99 with a value, i=
n function returning void [-Werror=3Dreturn-type]
   1198 |   return false;
        |          ^~~~~
  ../lib/igt_amd.c:1189:6: note: declared here
   1189 | void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *ena=
bled)
        |      ^~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692898951:step_script
  section_start:1692898951:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692898951:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/47999497):
  ninja: Entering directory `build'
  [1/1425] Generating version.h with a custom command.
  [2/1421] Linking static target lib/libigt-igt_kms_c.a.
  [3/1421] Linking static target lib/libigt-igt_fb_c.a.
  [4/1421] Linking static target lib/libigt-igt_vmwgfx_c.a.
  [5/1421] Linking static target lib/libigt-igt_edid_c.a.
  [6/1421] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
  FAILED: lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o=20
  clang -Ilib/76b5a35@@igt-igt_amd_c@sta -Ilib -I../lib -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -=
I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/=
usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -X=
clang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missi=
ng-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno=
-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -We=
rror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-sel=
f -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -We=
rror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/shar=
e/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIG=
T_LOG_DOMAIN=3D"igt_amd"' -MD -MQ 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c=
.o' -MF 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o.d' -o 'lib/76b5a35@@igt=
-igt_amd_c@sta/igt_amd.c.o' -c ../lib/igt_amd.c
  ../lib/igt_amd.c:1198:3: error: void function 'igt_amd_get_mall_status' s=
hould not return a value [-Wreturn-type]
                  return false;
                  ^      ~~~~~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1692898960:step_script
  section_start:1692898960:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692898960:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/47999496):
  [2/1245] Linking static target lib/libigt-igt_kms_c.a.
  [3/1245] Linking static target lib/libigt-igt_fb_c.a.
  [4/1245] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
  FAILED: lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o=20
  cc -Ilib/76b5a35@@igt-igt_amd_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/u=
sr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr=
/include/libdrm -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D=
_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wd=
eclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogica=
l-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-=
pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-lim=
its -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Dar=
ray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-=
cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpo=
inter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3D=
trigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -=
fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRC=
DIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_amd"' -M=
D -MQ 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o' -MF 'lib/76b5a35@@igt-ig=
t_amd_c@sta/igt_amd.c.o.d' -o 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o' =
-c ../lib/igt_amd.c
  ../lib/igt_amd.c: In function =E2=80=98igt_amd_get_mall_status=E2=80=99:
  ../lib/igt_amd.c:1198:10: error: =E2=80=98return=E2=80=99 with a value, i=
n function returning void [-Werror=3Dreturn-type]
   1198 |   return false;
        |          ^~~~~
  ../lib/igt_amd.c:1189:6: note: declared here
   1189 | void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *ena=
bled)
        |      ^~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692898951:step_script
  section_start:1692898951:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692898952:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/47999494):
  [2/1395] Linking static target lib/libigt-igt_kms_c.a.
  [3/1395] Linking static target lib/libigt-igt_fb_c.a.
  [4/1395] Compiling C object 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o'.
  FAILED: lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o=20
  cc -Ilib/76b5a35@@igt-igt_amd_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I..=
/lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/u=
sr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=
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
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-D=
IGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gf=
x-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_amd"' -MD -MQ 'lib/76b5a3=
5@@igt-igt_amd_c@sta/igt_amd.c.o' -MF 'lib/76b5a35@@igt-igt_amd_c@sta/igt_a=
md.c.o.d' -o 'lib/76b5a35@@igt-igt_amd_c@sta/igt_amd.c.o' -c ../lib/igt_amd=
.c
  ../lib/igt_amd.c: In function =E2=80=98igt_amd_get_mall_status=E2=80=99:
  ../lib/igt_amd.c:1198:10: error: =E2=80=98return=E2=80=99 with a value, i=
n function returning void [-Werror=3Dreturn-type]
   1198 |   return false;
        |          ^~~~~
  ../lib/igt_amd.c:1189:6: note: declared here
   1189 | void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *ena=
bled)
        |      ^~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692898951:step_script
  section_start:1692898951:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692898959:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/47999495):
  [2/1407] Linking static target lib/libigt-igt_kms_c.a.
  [3/1407] Linking static target lib/libigt-igt_fb_c.a.
  [4/1407] Compiling C object 'lib/lib@@igt-igt_amd_c@sta/igt_amd.c.o'.
  FAILED: lib/lib@@igt-igt_amd_c@sta/igt_amd.c.o=20
  cc -Ilib/lib@@igt-igt_amd_c@sta -Ilib -I../lib -I../include -I../include/=
drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/i=
nclude/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/i=
nclude/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/inc=
lude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnos=
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
malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/shar=
e/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIG=
T_LOG_DOMAIN=3D"igt_amd"'  -MD -MQ 'lib/lib@@igt-igt_amd_c@sta/igt_amd.c.o'=
 -MF 'lib/lib@@igt-igt_amd_c@sta/igt_amd.c.o.d' -o 'lib/lib@@igt-igt_amd_c@=
sta/igt_amd.c.o' -c ../lib/igt_amd.c
  ../lib/igt_amd.c: In function =E2=80=98igt_amd_get_mall_status=E2=80=99:
  ../lib/igt_amd.c:1198:10: error: =E2=80=98return=E2=80=99 with a value, i=
n function returning void [-Werror=3Dreturn-type]
   1198 |   return false;
        |          ^~~~~
  ../lib/igt_amd.c:1189:6: note: declared here
   1189 | void igt_amd_get_mall_status(int drm_fd, u32 *supported, u32 *ena=
bled)
        |      ^~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1692898960:step_script
  section_start:1692898960:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692898961:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/969821
