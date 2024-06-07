Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AE6C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 22:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F14B10E0BF;
	Fri,  7 Jun 2024 22:13:01 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ACC10E094;
 Fri,  7 Jun 2024 22:13:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fdirtyfb=3A_?=
 =?utf-8?q?few_fbc_related_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 22:13:00 -0000
Message-ID: <171779838046.28978.6444501927907288983@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
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

Series: tests/kms_dirtyfb: few fbc related updates
URL   : https://patchwork.freedesktop.org/series/134620/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1196494 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/59646339):
  [2/607] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [3/607] Generating kms_big_joiner.testlist with a meson_exe.py custom com=
mand.
  [4/607] Generating kms_big_fb.testlist with a meson_exe.py custom command.
  [5/607] Linking target tests/kms_cdclk.
  [6/607] Generating kms_cdclk.testlist with a meson_exe.py custom command.
  [7/607] Generating kms_busy.testlist with a meson_exe.py custom command.
  [8/607] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  cc -Itests/59830eb@@kms_dirtyfb@exe -Itests -I../tests -I../include -I../=
include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysc=
alls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_=
64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -=
I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/us=
r/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/val=
grind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe=
 -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -=
D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -W=
declaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogic=
al-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn =
-Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arit=
h -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -=
Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno=
-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wn=
o-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit=
 -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast=
 -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointe=
r-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrig=
raphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LA=
RGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms_dirtyfb@exe/inte=
l_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.=
o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ../tests/=
intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
     drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
     ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798079:step_script
  section_start:1717798079:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798080:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/59646342):
  [951/1424] Compiling C object 'tests/59830eb@@kms_dsc@exe/intel_kms_dsc.c=
.o'.
  [952/1424] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_busy=
.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/752] Generating version.h with a custom command.
  [2/474] Linking target tests/kms_big_fb.
  [3/474] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_dirtyfb@exe -Itests -=
I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib =
-I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/incl=
ude/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/p=
ixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng1=
6 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch6=
4-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
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
_dirtyfb@exe/intel_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@exe/int=
el_kms_dirtyfb.c.o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.=
c.o' -c ../tests/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
     drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
     ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798075:step_script
  section_start:1717798075:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798077:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/59646341):
  [949/1424] Linking target tests/kms_cdclk.
  [950/1424] Compiling C object 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c=
.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/754] Generating version.h with a custom command.
  [2/476] Linking target tests/kms_big_joiner.
  [3/476] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_dirtyfb@exe -Itests=
 -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/inclu=
de/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/ar=
m-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics=
-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra =
-std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -=
Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fa=
llthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribut=
e -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defi=
nition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuni=
nitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fi=
eld-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno=
-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-boun=
ds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb=
@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@ex=
e/intel_kms_dirtyfb.c.o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dir=
tyfb.c.o' -c ../tests/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
     drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
     ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798075:step_script
  section_start:1717798075:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798076:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/59646343):
  [3/476] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/476] Linking target tests/core_hotunplug.
  [5/476] Linking target tests/gem_barrier_race.
  [6/476] Linking target tests/perf.
  [7/476] Linking target tests/kms_ccs.
  [8/476] Linking target tests/kms_busy.
  [9/476] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_dirtyfb@exe -Itests -I..=
/tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I.=
./lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include=
/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-=
1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/u=
sr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-g=
nu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways=
 -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O=
2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-c=
ast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -=
Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-nor=
eturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointe=
r-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wun=
used -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializer=
s -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-paramet=
er -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dim=
plicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointe=
r-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3D=
pointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms_dirtyfb@e=
xe/intel_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dir=
tyfb.c.o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ..=
/tests/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
     drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
     ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798086:step_script
  section_start:1717798086:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798087:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/59646334):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1129] Generating version.h with a custom command.
  [2/604] Generating kms_big_fb.testlist with a meson_exe.py custom command.
  [3/604] Generating kms_busy.testlist with a meson_exe.py custom command.
  [4/604] Generating kms_ccs.testlist with a meson_exe.py custom command.
  [5/604] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  cc -Itests/59830eb@@kms_dirtyfb@exe -Itests -I../tests -I../include -I../=
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
_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_dirtyfb@exe/in=
tel_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.=
c.o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ../test=
s/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
    105 |   drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
        |   ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798082:step_script
  section_start:1717798082:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798083:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/59646338):
  [6/604] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  clang -Itests/59830eb@@kms_dirtyfb@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64=
 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include con=
fig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-stateme=
nt -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing=
-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpo=
inter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized =
-Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of=
-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wn=
o-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit=
 -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast=
 -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointe=
r-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrig=
raphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LA=
RGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_dirtyfb@exe/intel=
_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=
.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ../tests/i=
ntel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c:105:3: error: expected expression
                  drmModeModeInfo *mode =3D igt_output_get_mode(data->outpu=
t);
                  ^
  ../tests/intel/kms_dirtyfb.c:111:13: error: use of undeclared identifier =
'mode'
                                                        mode->hdisplay,
                                                        ^
  ../tests/intel/kms_dirtyfb.c:112:13: error: use of undeclared identifier =
'mode'
                                                        mode->vdisplay);
                                                        ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1717798096:step_script
  section_start:1717798096:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798097:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/59646337):
  ninja: Entering directory `build'
  [1/999] Generating version.h with a custom command.
  [2/484] Generating kms_big_fb.testlist with a meson_exe.py custom command.
  [3/484] Generating kms_busy.testlist with a meson_exe.py custom command.
  [4/484] Linking target tests/kms_ccs.
  [5/484] Generating kms_ccs.testlist with a meson_exe.py custom command.
  [6/484] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  cc -Itests/59830eb@@kms_dirtyfb@exe -Itests -I../tests -I../include -I../=
include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysc=
alls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/gl=
ib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-co=
lor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -st=
d=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wba=
d-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallt=
hrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -=
Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definit=
ion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninit=
ialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field=
-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-co=
mpare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Da=
ddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werro=
r=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthre=
ad -MD -MQ 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -MF 'test=
s/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o.d' -o 'tests/59830eb@@kms_=
dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ../tests/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
    105 |   drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
        |   ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798088:step_script
  section_start:1717798088:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798089:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/59646335):
  [3/611] Generating kms_big_fb.testlist with a meson_exe.py custom command.
  [4/611] Generating kms_big_joiner.testlist with a meson_exe.py custom com=
mand.
  [5/611] Linking target tests/kms_busy.
  [6/611] Generating kms_busy.testlist with a meson_exe.py custom command.
  [7/611] Linking target tests/kms_ccs.
  [8/611] Generating kms_ccs.testlist with a meson_exe.py custom command.
  [9/611] Compiling C object 'tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirt=
yfb.c.o'.
  FAILED: tests/59830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  cc -Itests/59830eb@@kms_dirtyfb@exe -Itests -I../tests -I../include -I../=
include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sysc=
alls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include=
/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/incl=
ude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/=
libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -=
D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_=
GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wde=
claration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical=
-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -W=
missing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith =
-Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wn=
o-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-p=
ointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limi=
ts -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darr=
ay-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -=
Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werro=
r=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Ds=
equence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mall=
oc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59=
830eb@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -MF 'tests/59830eb@@kms_dirty=
fb@exe/intel_kms_dirtyfb.c.o.d' -o 'tests/59830eb@@kms_dirtyfb@exe/intel_km=
s_dirtyfb.c.o' -c ../tests/intel/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
    105 |   drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
        |   ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798090:step_script
  section_start:1717798090:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798092:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/59646336):
  [3/610] Linking target tests/kms_big_fb.
  [4/610] Generating kms_big_fb.testlist with a meson_exe.py custom command.
  [5/610] Generating kms_big_joiner.testlist with a meson_exe.py custom com=
mand.
  [6/610] Generating kms_busy.testlist with a meson_exe.py custom command.
  [7/610] Linking target tests/kms_ccs.
  [8/610] Generating kms_ccs.testlist with a meson_exe.py custom command.
  [9/610] Compiling C object 'tests/tests@@kms_dirtyfb@exe/intel_kms_dirtyf=
b.c.o'.
  FAILED: tests/tests@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o=20
  cc -Itests/tests@@kms_dirtyfb@exe -Itests -I../tests -I../include -I../in=
clude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscal=
ls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib=
-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/includ=
e/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/inclu=
de/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.=
h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -=
Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations =
-Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested=
-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow =
-Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-unin=
itialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-o=
f-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -W=
no-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplici=
t -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cas=
t -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoint=
er-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtri=
graphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_L=
ARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/tests@@kms_dirtyfb@exe/intel=
_kms_dirtyfb.c.o' -MF 'tests/tests@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o.d=
' -o 'tests/tests@@kms_dirtyfb@exe/intel_kms_dirtyfb.c.o' -c ../tests/intel=
/kms_dirtyfb.c
  ../tests/intel/kms_dirtyfb.c: In function =E2=80=98check_support=E2=80=99:
  ../tests/intel/kms_dirtyfb.c:105:3: error: a label can only be part of a =
statement and a declaration is not a statement
    105 |   drmModeModeInfo *mode =3D igt_output_get_mode(data->output);
        |   ^~~~~~~~~~~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1717798082:step_script
  section_start:1717798082:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717798083:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1196494
