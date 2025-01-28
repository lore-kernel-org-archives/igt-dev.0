Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA005C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 13:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AB710E28E;
	Tue, 28 Jan 2025 13:34:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41CE10E28E;
 Tue, 28 Jan 2025 13:34:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_manual_hibernate_te?=
 =?utf-8?q?st_to_kms=5Fccs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jan 2025 13:34:23 -0000
Message-ID: <173807126392.1941082.128897694570444731@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
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

Series: Add manual hibernate test to kms_ccs
URL   : https://patchwork.freedesktop.org/series/144028/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1353743 f=
or the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/70107688):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I../=
tests -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental=
 -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/gl=
ib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/f=
reetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/i=
nclude/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.=
h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -=
Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations =
-Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested=
-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow =
-Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-unin=
itialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-comp=
are -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dadd=
ress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthrea=
d  -MD -MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830e=
b@@kms_ccs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_km=
s_ccs.c.o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98check_hibernation_support=
=E2=80=99:
  ../tests/intel/kms_ccs.c:289:7: error: implicit declaration of function =
=E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werror=3Dim=
plicit-function-declaration]
    fd =3D open("/sys/power/state", O_RDONLY);
         ^~~~
         popen
  ../tests/intel/kms_ccs.c:289:7: warning: nested extern declaration of =E2=
=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:289:32: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
    fd =3D open("/sys/power/state", O_RDONLY);
                                  ^~~~~~~~
                                  STA_RONLY
  ../tests/intel/kms_ccs.c:289:32: note: each undeclared identifier is repo=
rted only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738070796:step_script
  section_start:1738070796:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738070797:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/70107687):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I.=
./tests -I../include -I../include/drm-uapi -I../include/drm-uapi-experiment=
al -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../=
 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabih=
f/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/inclu=
de/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/l=
ibdrm/nouveau -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I=
/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D=
64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include c=
onfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-state=
ment -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declara=
tions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -W=
nested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Ws=
hadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-mayb=
e-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sig=
n-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 =
-pthread  -MD -MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests=
/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/i=
ntel_kms_ccs.c.o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98check_hibernation_support=
=E2=80=99:
  ../tests/intel/kms_ccs.c:289:7: error: implicit declaration of function =
=E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werror=3Dim=
plicit-function-declaration]
    fd =3D open("/sys/power/state", O_RDONLY);
         ^~~~
         popen
  ../tests/intel/kms_ccs.c:289:7: warning: nested extern declaration of =E2=
=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:289:32: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
    fd =3D open("/sys/power/state", O_RDONLY);
                                  ^~~~~~~~
                                  STA_RONLY
  ../tests/intel/kms_ccs.c:289:32: note: each undeclared identifier is repo=
rted only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738070805:step_script
  section_start:1738070805:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738070805:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/70107689):
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_ccs@exe -Itests -I../tes=
ts -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental -I=
../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0=
/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetyp=
e2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouv=
eau -I/usr/include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/al=
sa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORT=
IFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
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
uiltin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -=
MQ 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.o' -MF 'tests/59830eb@@kms_c=
cs@exe/intel_kms_ccs.c.o.d' -o 'tests/59830eb@@kms_ccs@exe/intel_kms_ccs.c.=
o' -c ../tests/intel/kms_ccs.c
  ../tests/intel/kms_ccs.c: In function =E2=80=98check_hibernation_support=
=E2=80=99:
  ../tests/intel/kms_ccs.c:289:7: error: implicit declaration of function =
=E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Werror=3Dim=
plicit-function-declaration]
    fd =3D open("/sys/power/state", O_RDONLY);
         ^~~~
         popen
  ../tests/intel/kms_ccs.c:289:7: warning: nested extern declaration of =E2=
=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/intel/kms_ccs.c:289:32: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
    fd =3D open("/sys/power/state", O_RDONLY);
                                  ^~~~~~~~
                                  STA_RONLY
  ../tests/intel/kms_ccs.c:289:32: note: each undeclared identifier is repo=
rted only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738070804:step_script
  section_start:1738070804:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738070805:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1353743
