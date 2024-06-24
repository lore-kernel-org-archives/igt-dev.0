Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA9C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 13:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6B410E423;
	Mon, 24 Jun 2024 13:10:39 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FD410E423;
 Mon, 24 Jun 2024 13:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Early_Transport_Support?=
 =?utf-8?q?_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jun 2024 13:10:37 -0000
Message-ID: <171923463798.153309.3080774962363687503@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624091943.1583273-1-jeevan.b@intel.com>
In-Reply-To: <20240624091943.1583273-1-jeevan.b@intel.com>
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

Series: Early Transport Support (rev4)
URL   : https://patchwork.freedesktop.org/series/133804/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1208838 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60276856):
  [3/1581] Linking static target lib/libigt-igt_fb_c.a.
  [4/1581] Linking static target lib/libigt-igt_kmod_c.a.
  [5/1581] Linking static target lib/libigt-igt_v3d_c.a.
  [6/1581] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freet=
ype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/no=
uveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/includ=
e/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BIT=
S=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inclu=
de config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-s=
tatement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-dec=
larations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototype=
s -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls=
 -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-=
maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno=
-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -We=
rror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-sel=
f -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -We=
rror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werr=
or=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwri=
te-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D=
1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_=
SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_psr"'=
  -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a35@@ig=
t-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c=
.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
       strstr(line, "[0x04]"))
                              ^
                              ;
    case PR_MODE:
    ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234556:step_script
  section_start:1719234556:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234557:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60276859):
  [5/1203] Linking static target lib/libigt-igt_v3d_c.a.
  [6/1203] Linking static target lib/libigt-igt_kmod_c.a.
  [7/1203] Linking static target lib/libigt-igt_ktap_c.a.
  [8/1203] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I.=
./lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/s=
tubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr=
/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/incl=
ude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/li=
bdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/=
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
rror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -We=
rror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to=
-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraph=
s -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEF=
ILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-=
tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMA=
IN=3D"igt_psr"'  -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -MF '=
lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_=
c@sta/igt_psr.c.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
       strstr(line, "[0x04]"))
                              ^
                              ;
    case PR_MODE:
    ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234547:step_script
  section_start:1719234547:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234547:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60276858):
  [4/1216] Linking static target lib/libigt-igt_core_c.a.
  [5/1216] Linking static target lib/libigt-igt_pm_c.a.
  [6/1216] Linking static target lib/libigt-igt_kmod_c.a.
  [7/1216] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -=
I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib=
/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/u=
sr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-1 -I/usr/=
include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/includ=
e/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gnueabihf -=
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
it -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_=
LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/ig=
t-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LO=
G_DOMAIN=3D"igt_psr"'  -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'=
 -MF 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-ig=
t_psr_c@sta/igt_psr.c.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
       strstr(line, "[0x04]"))
                              ^
                              ;
    case PR_MODE:
    ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234548:step_script
  section_start:1719234548:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234549:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/60276860):
  [4/1203] Linking static target lib/libigt-igt_core_c.a.
  [5/1203] Linking static target lib/libigt-igt_kmod_c.a.
  [6/1203] Linking static target lib/libigt-igt_v3d_c.a.
  [7/1203] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../l=
ib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/stub=
s/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uu=
id -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -=
I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/include/v=
algrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFS=
ET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE =
-include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-a=
fter-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissi=
ng-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pro=
totypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant=
-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered=
 -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arit=
h -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resu=
lt -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Din=
it-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOU=
RCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '=
-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt=
_psr"'  -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a=
35@@igt-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt=
_psr.c.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
       strstr(line, "[0x04]"))
                              ^
                              ;
    case PR_MODE:
    ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234558:step_script
  section_start:1719234558:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234560:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/60276857):
  [2/356] Linking static target lib/libigt-igt_kms_c.a.
  [3/356] Linking static target lib/libigt-igt_fb_c.a.
  [4/356] Linking static target lib/libigt-igt_core_c.a.
  [5/356] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I..=
/lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvali=
d-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIF=
Y_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2=
 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-f=
ormat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -W=
old-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pr=
ototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -=
Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-ty=
pe-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werro=
r=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conve=
rsion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces=
 -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Wer=
ror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-built=
in-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DI=
GT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx=
-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_psr"'  -MD -MQ 'lib/76b5a3=
5@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a35@@igt-igt_psr_c@sta/igt_p=
sr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -c ../lib/igt_psr=
.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
       strstr(line, "[0x04]"))
                              ^
                              ;
    case PR_MODE:
    ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234537:step_script
  section_start:1719234537:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234538:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/60276851):
  [4/1592] Linking static target lib/libigt-igt_pm_c.a.
  [5/1592] Linking static target lib/libigt-igt_kmod_c.a.
  [6/1592] Linking static target lib/libigt-igt_vmwgfx_c.a.
  [7/1592] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../incl=
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
self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain =
-Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -W=
error=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3D=
write-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=
=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/share/igt-gpu-tools"' '-DIGT=
_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_psr"=
' -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a35@@ig=
t-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c=
.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
    288 |     strstr(line, "[0x04]"))
        |                            ^
        |                            ;
    289 |  case PR_MODE:
        |  ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234538:step_script
  section_start:1719234538:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234539:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60276855):
  [2/1597] Linking static target lib/libigt-igt_fb_c.a.
  [3/1597] Linking static target lib/libigt-igt_kms_c.a.
  [4/1597] Linking static target lib/libigt-igt_kmod_c.a.
  [5/1597] Linking static target lib/libigt-igt_v3d_c.a.
  [6/1597] Linking static target lib/libigt-igt_vmwgfx_c.a.
  [7/1597] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  clang -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../i=
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
f -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -We=
rror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werr=
or=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwri=
te-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D=
1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_=
SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_psr"'=
 -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a35@@igt=
-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.=
o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c:288:28: error: expected ';' after return statement
                           strstr(line, "[0x04]"))
                                                  ^
                                                  ;
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1719234567:step_script
  section_start:1719234567:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234568:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/60276854):
  [5/1429] Linking static target lib/libigt-igt_pm_c.a.
  [6/1429] Linking static target lib/libigt-igt_kmod_c.a.
  [7/1429] Linking static target lib/libigt-igt_vmwgfx_c.a.
  [8/1429] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../incl=
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
ray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion =
-Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werr=
or=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3D=
sequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mal=
loc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DAT=
ADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/ig=
t-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_psr"' -MD -MQ 'lib/76b5a35@@igt-=
igt_psr_c@sta/igt_psr.c.o' -MF 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o.=
d' -o 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
    288 |     strstr(line, "[0x04]"))
        |                            ^
        |                            ;
    289 |  case PR_MODE:
        |  ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234561:step_script
  section_start:1719234561:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234562:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60276852):
  [4/1589] Linking static target lib/libigt-igt_pm_c.a.
  [5/1589] Linking static target lib/libigt-igt_kmod_c.a.
  [6/1589] Linking static target lib/libigt-igt_vmwgfx_c.a.
  [7/1589] Compiling C object 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/76b5a35@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../incl=
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
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-p=
ointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werr=
or=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -We=
rror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-c=
alloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local=
/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' =
'-DIGT_LOG_DOMAIN=3D"igt_psr"' -MD -MQ 'lib/76b5a35@@igt-igt_psr_c@sta/igt_=
psr.c.o' -MF 'lib/76b5a35@@igt-igt_psr_c@sta/igt_psr.c.o.d' -o 'lib/76b5a35=
@@igt-igt_psr_c@sta/igt_psr.c.o' -c ../lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
    288 |     strstr(line, "[0x04]"))
        |                            ^
        |                            ;
    289 |  case PR_MODE:
        |  ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234552:step_script
  section_start:1719234552:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234558:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60276853):
  [4/1603] Linking static target lib/libigt-igt_fb_c.a.
  [5/1603] Linking static target lib/libigt-igt_core_c.a.
  [6/1603] Linking static target lib/libigt-igt_pm_c.a.
  [7/1603] Compiling C object 'lib/lib@@igt-igt_psr_c@sta/igt_psr.c.o'.
  FAILED: lib/lib@@igt-igt_psr_c@sta/igt_psr.c.o=20
  cc -Ilib/lib@@igt-igt_psr_c@sta -Ilib -I../lib -I../include -I../include/=
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
lf -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -W=
error=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Wer=
ror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwr=
ite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=
=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DI=
GT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_ps=
r"'  -MD -MQ 'lib/lib@@igt-igt_psr_c@sta/igt_psr.c.o' -MF 'lib/lib@@igt-igt=
_psr_c@sta/igt_psr.c.o.d' -o 'lib/lib@@igt-igt_psr_c@sta/igt_psr.c.o' -c ..=
/lib/igt_psr.c
  ../lib/igt_psr.c: In function =E2=80=98psr_sink_support=E2=80=99:
  ../lib/igt_psr.c:288:28: error: expected =E2=80=98;=E2=80=99 before =E2=
=80=98case=E2=80=99
    288 |     strstr(line, "[0x04]"))
        |                            ^
        |                            ;
    289 |  case PR_MODE:
        |  ~~~~                      =20
  ninja: build stopped: subcommand failed.
  section_end:1719234562:step_script
  section_start:1719234562:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719234563:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1208838
