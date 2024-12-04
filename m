Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F1EE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 19:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5503B10E1B9;
	Wed,  4 Dec 2024 19:33:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F1010E1B9;
 Wed,  4 Dec 2024 19:33:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/xe/xe=5Fgt=3A_Repai?=
 =?utf-8?q?r_xe=5Fgt=5Fstats=5Fget=5Fcount_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Dec 2024 19:33:45 -0000
Message-ID: <173334082527.2641299.6147450662522368470@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204154650.13327-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241204154650.13327-1-jonathan.cavitt@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

=3D=3D Series Details =3D=3D

Series: lib/xe/xe_gt: Repair xe_gt_stats_get_count function
URL   : https://patchwork.freedesktop.org/series/142124/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1323511 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/67728241):
  [4/1770] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=
'.
  FAILED: lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=20
  cc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../inc=
lude/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I=
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
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Din=
t-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull=
 -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-poi=
nt -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-bui=
ltin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr=
/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/te=
sts"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_gt_c=
@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o.d' -o =
'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    close(f);
          ^
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
   extern int close (int __fd);
                     ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340513:step_script
  section_start:1733340513:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340514:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/67728244):
  [6/1400] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=
'.
  FAILED: lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I=
../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimenta=
l -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/=
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
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conver=
sion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werr=
or=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builti=
n-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIG=
T_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-=
ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"'  -MD -MQ 'lib/76b5a3=
5@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe=
_xe_gt.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/x=
e/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    close(f);
          ^
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/aarch64-linux-gnu/include/unistd.h:353:23: note: expected =E2=80=98i=
nt=E2=80=99 but argument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98=
struct _IO_FILE *=E2=80=99}
   extern int close (int __fd);
                     ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340534:step_script
  section_start:1733340534:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340537:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/67728243):
  [7/1410] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=
'.
  FAILED: lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib =
-I../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimen=
tal -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/includ=
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
error=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-c=
onversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread =
'-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds=
/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"'  -MD -MQ 'lib/7=
6b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe_gt_c@s=
ta/xe_xe_gt.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../=
lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    close(f);
          ^
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/arm-linux-gnueabihf/include/unistd.h:353:23: note: expected =E2=80=
=98int=E2=80=99 but argument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=
=80=98struct _IO_FILE *=E2=80=99}
   extern int close (int __fd);
                     ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340596:step_script
  section_start:1733340596:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340597:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/67728245):
  [6/1284] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=
'.
  FAILED: lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../=
lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental -=
I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cai=
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
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werro=
r=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dn=
onnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequen=
ce-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -f=
no-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=
=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci=
-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"'  -MD -MQ 'lib/76b5a35@@igt-xe=
_xe_gt_c@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.=
o.d' -o 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    close(f);
          ^
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/mips-linux-gnu/include/unistd.h:353:23: note: expected =E2=80=98int=
=E2=80=99 but argument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98st=
ruct _IO_FILE *=E2=80=99}
   extern int close (int __fd);
                     ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340624:step_script
  section_start:1733340624:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340624:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/67728242):
  [8/417] Compiling C object 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o=20
  cc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../inc=
lude/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I=
../lib/stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -fdiagnostics-color=3Dalways -pipe -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GN=
U_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecl=
aration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-o=
p -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmi=
ssing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -W=
redundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-=
clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poi=
nter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -We=
rror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to=
-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraph=
s -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEF=
ILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-=
tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMA=
IN=3D"xe/xe_gt"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -M=
F 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o.d' -o 'lib/76b5a35@@igt-xe_=
xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    close(f);
          ^
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
   extern int close (int __fd);
                     ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340534:step_script
  section_start:1733340534:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340536:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/67728236):
  cc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../inc=
lude/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I=
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
s -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D=
"/opt/igt/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags=
/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"' -MD -MQ 'lib/76b5a35@@igt-xe_xe_gt=
_c@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o.d' -=
o 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    176 |  close(f);
        |        ^
        |        |
        |        FILE * {aka struct _IO_FILE *}
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
    353 | extern int close (int __fd);
        |                   ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340515:step_script
  section_start:1733340515:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340515:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/67728240):
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/xe/xe_gt.c:178:9: note: uninitialized use occurs here
          return count;
                 ^~~~~
  ../lib/xe/xe_gt.c:169:9: note: remove the condition if it is always true
          while (fgets(tlb_path, sizeof(tlb_path), f)) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 1
  ../lib/xe/xe_gt.c:158:11: note: initialize the variable 'count' to silenc=
e this warning
          int count;
                   ^
                    =3D 0
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1733340518:step_script
  section_start:1733340518:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340518:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/67728239):
  cc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../inc=
lude/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I=
../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.=
0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/free=
type2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind=
 -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvali=
d-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIF=
Y_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2=
 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-f=
ormat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -W=
old-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pr=
ototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -=
Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-me=
mber -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-r=
esult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE6=
4_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tool=
s"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=
=3D"xe/xe_gt"' -MD -MQ 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -MF '=
lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_=
gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    176 |  close(f);
        |        ^
        |        |
        |        FILE * {aka struct _IO_FILE *}
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
    353 | extern int close (int __fd);
        |                   ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340534:step_script
  section_start:1733340534:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340536:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/67728237):
  cc -Ilib/76b5a35@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../inc=
lude/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I=
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
=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -=
pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D=
"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"' -MD -MQ=
 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -MF 'lib/76b5a35@@igt-xe_xe=
_gt_c@sta/xe_xe_gt.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o'=
 -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    176 |  close(f);
        |        ^
        |        |
        |        FILE * {aka struct _IO_FILE *}
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
    353 | extern int close (int __fd);
        |                   ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340534:step_script
  section_start:1733340534:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340536:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/67728238):
  cc -Ilib/lib@@igt-xe_xe_gt_c@sta -Ilib -I../lib -I../include -I../include=
/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -I../l=
ib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
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
error=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint=
-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull =
-Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-poin=
t -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-buil=
tin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/=
local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tes=
ts"' '-DIGT_LOG_DOMAIN=3D"xe/xe_gt"'  -MD -MQ 'lib/lib@@igt-xe_xe_gt_c@sta/=
xe_xe_gt.c.o' -MF 'lib/lib@@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o.d' -o 'lib/lib@=
@igt-xe_xe_gt_c@sta/xe_xe_gt.c.o' -c ../lib/xe/xe_gt.c
  ../lib/xe/xe_gt.c: In function =E2=80=98xe_gt_stats_get_count=E2=80=99:
  ../lib/xe/xe_gt.c:176:8: error: passing argument 1 of =E2=80=98close=E2=
=80=99 makes integer from pointer without a cast [-Werror=3Dint-conversion]
    176 |  close(f);
        |        ^
        |        |
        |        FILE * {aka struct _IO_FILE *}
  In file included from ../lib/igt_core.h:46,
                   from ../lib/xe/xe_gt.c:12:
  /usr/include/unistd.h:353:23: note: expected =E2=80=98int=E2=80=99 but ar=
gument is of type =E2=80=98FILE *=E2=80=99 {aka =E2=80=98struct _IO_FILE *=
=E2=80=99}
    353 | extern int close (int __fd);
        |                   ~~~~^~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1733340513:step_script
  section_start:1733340513:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1733340513:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1323511
