Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0603DCF3964
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 02:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D33010E2C5;
	Fri, 20 Sep 2024 02:12:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3075710E02C;
 Fri, 20 Sep 2024 02:12:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fwriteback?=
 =?utf-8?q?=3A_Add_clone_mode_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 02:12:17 -0000
Message-ID: <172679833718.1048260.15273340167416539162@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
In-Reply-To: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
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

Series: tests/kms_writeback: Add clone mode subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/137933/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1274747 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/63900651):
  [3/1168] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.=
so.1.5.symbols'.
  [4/1168] Linking target tests/core_hotunplug.
  [5/1168] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1168] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  cc -Itests/59830eb@@kms_writeback@exe -Itests -I../tests -I../include -I.=
./include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sy=
scalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x8=
6_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid=
 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/=
usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/v=
algrind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pi=
pe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g=
 -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast =
-Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlog=
ical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused=
 -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -W=
no-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_=
LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms_writeback@exe/=
kms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o.=
d' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -c ../tests/kms_=
writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99; did you mean =E2=80=98igt_output_=
name=E2=80=99? [-Werror=3Dimplicit-function-declaration]
        || igt_output_clone_valid(display.drm_fd, output, nonwb_output))
           ^~~~~~~~~~~~~~~~~~~~~~
           igt_output_name
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798286:step_script
  section_start:1726798286:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798287:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63900654):
  [2/850] Linking target lib/libi915_perf.so.1.5.
  [3/850] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/850] Linking target tests/core_hotunplug.
  [5/850] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writebac=
k.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_writeback@exe -Itests=
 -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include=
/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpn=
g16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarc=
h64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-col=
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
ltin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms=
_writeback@exe/kms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@exe/kms=
_writeback.c.o.d' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -=
c ../tests/kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99; did you mean =E2=80=98igt_output_=
name=E2=80=99? [-Werror=3Dimplicit-function-declaration]
        || igt_output_clone_valid(display.drm_fd, output, nonwb_output))
           ^~~~~~~~~~~~~~~~~~~~~~
           igt_output_name
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798307:step_script
  section_start:1726798307:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798307:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63900653):
  [2/855] Linking target lib/libi915_perf.so.1.5.
  [3/855] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/855] Linking target tests/core_hotunplug.
  [5/855] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writebac=
k.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_writeback@exe -Ites=
ts -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -I=
lib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/=
include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/inc=
lude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/=
arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnosti=
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
no-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830e=
b@@kms_writeback@exe/kms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@e=
xe/kms_writeback.c.o.d' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.=
c.o' -c ../tests/kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99; did you mean =E2=80=98igt_output_=
name=E2=80=99? [-Werror=3Dimplicit-function-declaration]
        || igt_output_clone_valid(display.drm_fd, output, nonwb_output))
           ^~~~~~~~~~~~~~~~~~~~~~
           igt_output_name
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798287:step_script
  section_start:1726798287:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798288:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/63900655):
  [2/850] Linking target lib/libi915_perf.so.1.5.
  [3/850] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/850] Linking target tests/core_hotunplug.
  [5/850] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writebac=
k.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_writeback@exe -Itests -I=
../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -=
I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/inclu=
de/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixma=
n-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I=
/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux=
-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-param=
eter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3D=
implicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-poin=
ter-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=
=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werr=
or=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-cal=
loc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms_writeba=
ck@exe/kms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o.d' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -c ../tes=
ts/kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99; did you mean =E2=80=98igt_output_=
name=E2=80=99? [-Werror=3Dimplicit-function-declaration]
        || igt_output_clone_valid(display.drm_fd, output, nonwb_output))
           ^~~~~~~~~~~~~~~~~~~~~~
           igt_output_name
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798295:step_script
  section_start:1726798295:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798296:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/63900646):
  [3/1168] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.=
so.1.5.symbols'.
  [4/1168] Linking target tests/core_hotunplug.
  [5/1168] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1168] Generating kms_vblank.testlist with a meson_exe.py custom comman=
d.
  [7/1168] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  cc -Itests/59830eb@@kms_writeback@exe -Itests -I../tests -I../include -I.=
./include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sy=
scalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/=
glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/i=
nclude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64=
 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include con=
fig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-stateme=
nt -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarati=
ons -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wne=
sted-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wsha=
dow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-=
uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addre=
ss-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramete=
r -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimp=
licit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer=
-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dp=
ointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_writeback@=
exe/kms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@exe/kms_writeback.=
c.o.d' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -c ../tests/=
kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    644 |      || igt_output_clone_valid(display.drm_fd, output, nonwb_outp=
ut))
        |         ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798279:step_script
  section_start:1726798279:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798280:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/63900650):
  [1/1338] Generating version.h with a custom command.
  [2/1172] Linking target lib/libi915_perf.so.1.5.
  [3/1172] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.=
so.1.5.symbols'.
  [4/1172] Linking target tests/core_hotunplug.
  [5/1172] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1172] Generating kms_vblank.testlist with a meson_exe.py custom comman=
d.
  [7/1172] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  clang -Itests/59830eb@@kms_writeback@exe -Itests -I../tests -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib=
64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr=
/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/us=
r/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D=
64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include c=
onfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-state=
ment -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-=
of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_=
LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_writeback@exe/k=
ms_writeback.c.o' -MF 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o.d=
' -o 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -c ../tests/kms_w=
riteback.c
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function '=
igt_output_clone_valid' is invalid in C99 [-Werror,-Wimplicit-function-decl=
aration]
                                          || igt_output_clone_valid(display=
.drm_fd, output, nonwb_output))
                                             ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1726798301:step_script
  section_start:1726798301:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798302:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/63900649):
  [2/1025] Linking target lib/libi915_perf.so.1.5.
  [3/1025] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.=
so.1.5.symbols'.
  [4/1025] Linking target tests/core_hotunplug.
  [5/1025] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1025] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  cc -Itests/59830eb@@kms_writeback@exe -Itests -I../tests -I../include -I.=
./include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sy=
scalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/=
glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-=
color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -=
std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -W=
bad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fal=
lthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute=
 -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defin=
ition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunin=
itialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fie=
ld-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-=
compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 =
-pthread -MD -MQ 'tests/59830eb@@kms_writeback@exe/kms_writeback.c.o' -MF '=
tests/59830eb@@kms_writeback@exe/kms_writeback.c.o.d' -o 'tests/59830eb@@km=
s_writeback@exe/kms_writeback.c.o' -c ../tests/kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    644 |      || igt_output_clone_valid(display.drm_fd, output, nonwb_outp=
ut))
        |         ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798285:step_script
  section_start:1726798285:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798286:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/63900647):
  [4/1167] Linking target tests/core_hotunplug.
  [5/1167] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1167] Generating kms_vblank.testlist with a meson_exe.py custom comman=
d.
  [7/1167] Generating kms_vrr.testlist with a meson_exe.py custom command.
  [8/1167] Compiling C object 'tests/59830eb@@kms_writeback@exe/kms_writeba=
ck.c.o'.
  FAILED: tests/59830eb@@kms_writeback@exe/kms_writeback.c.o=20
  cc -Itests/59830eb@@kms_writeback@exe -Itests -I../tests -I../include -I.=
./include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sy=
scalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/inclu=
de/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/in=
clude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/includ=
e/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe=
 -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -=
D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -W=
declaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogic=
al-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn =
-Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arit=
h -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -=
Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno=
-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-li=
mits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Da=
rray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion=
 -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Wer=
ror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'test=
s/59830eb@@kms_writeback@exe/kms_writeback.c.o' -MF 'tests/59830eb@@kms_wri=
teback@exe/kms_writeback.c.o.d' -o 'tests/59830eb@@kms_writeback@exe/kms_wr=
iteback.c.o' -c ../tests/kms_writeback.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    644 |      || igt_output_clone_valid(display.drm_fd, output, nonwb_outp=
ut))
        |         ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798291:step_script
  section_start:1726798291:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798292:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/63900648):
  [2/1164] Linking target lib/libi915_perf.so.1.5.
  [3/1164] Generating symbol file 'lib/lib@@i915_perf@sha/libi915_perf.so.1=
.5.symbols'.
  [4/1164] Linking target tests/core_hotunplug.
  [5/1164] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1164] Compiling C object 'tests/tests@@kms_writeback@exe/kms_writeback=
.c.o'.
  FAILED: tests/tests@@kms_writeback@exe/kms_writeback.c.o=20
  cc -Itests/tests@@kms_writeback@exe -Itests -I../tests -I../include -I../=
include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysc=
alls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/gl=
ib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/inc=
lude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -=
Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include confi=
g.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement=
 -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnest=
ed-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshado=
w -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-un=
initialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address=
-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter =
-Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpli=
cit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-c=
ast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoi=
nter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dt=
rigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D=
_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/tests@@kms_writeback@exe/k=
ms_writeback.c.o' -MF 'tests/tests@@kms_writeback@exe/kms_writeback.c.o.d' =
-o 'tests/tests@@kms_writeback@exe/kms_writeback.c.o' -c ../tests/kms_write=
back.c
  ../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main5=
57=E2=80=99:
  ../tests/kms_writeback.c:644:9: error: implicit declaration of function =
=E2=80=98igt_output_clone_valid=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    644 |      || igt_output_clone_valid(display.drm_fd, output, nonwb_outp=
ut))
        |         ^~~~~~~~~~~~~~~~~~~~~~
  ../tests/kms_writeback.c:644:9: warning: nested extern declaration of =E2=
=80=98igt_output_clone_valid=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726798279:step_script
  section_start:1726798279:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726798281:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1274747
