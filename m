Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA06CC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 05:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3851D10E44B;
	Thu, 25 Jul 2024 05:26:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBA610E44B;
 Thu, 25 Jul 2024 05:26:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5B1/2=5D_lib/amdgpu=3A_refactor_deadlock_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jul 2024 05:26:19 -0000
Message-ID: <172188517917.364460.10321391982670735970@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725034014.521855-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240725034014.521855-1-vitaly.prosyak@amd.com>
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

Series: series starting with [1/2] lib/amdgpu: refactor deadlock tests
URL   : https://patchwork.freedesktop.org/series/136473/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1232373 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/61484263):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1030] Generating version.h with a custom command.
  [2/325] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd=
_queue_reset.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o=20
  cc -Itests/amdgpu/b9f2b1d@@amd_queue_reset@exe -Itests/amdgpu -I../tests/=
amdgpu -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I.=
./lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include=
/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixma=
n-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I=
/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/x86_64-lin=
ux-gnu -I/usr/include/valgrind -I/usr/include/alsa -I/usr/include -fdiagnos=
tics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wex=
tra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpli=
cit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-miss=
ing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limit=
s -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darra=
y-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -W=
error=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=
=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dse=
quence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mallo=
c -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/am=
dgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -MF 'tests/amdgpu/b9=
f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o.d' -o 'tests/amdgpu/b9f2b1d@=
@amd_queue_reset@exe/amd_queue_reset.c.o' -c ../tests/amdgpu/amd_queue_rese=
t.c
  ../tests/amdgpu/amd_queue_reset.c: In function =E2=80=98run_monitor_child=
=E2=80=99:
  ../tests/amdgpu/amd_queue_reset.c:480:8: error: implicit declaration of f=
unction =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=
=98amdgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    ret =3D amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          amdgpu_cs_query_reset_state
  ../tests/amdgpu/amd_queue_reset.c:480:8: warning: nested extern declarati=
on of =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1721884910:step_script
  section_start:1721884910:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721884911:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61484266):
  ninja: Entering directory `build'
  [1/673] Generating version.h with a custom command.
  [2/290] Linking target tests/amdgpu/amd_vcn.
  [3/290] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd=
_queue_reset.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_queue_reset@ex=
e -Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../=
include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/=
include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0=
/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetyp=
e2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouv=
eau -I/usr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include=
/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Wi=
nvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_F=
ORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wforma=
t=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmiss=
ing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exter=
ns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstri=
ct-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitiali=
zed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -W=
no-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -=
Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-=
conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-b=
races -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type=
 -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-=
builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD =
-MQ 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -MF 'te=
sts/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o.d' -o 'tests/am=
dgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -c ../tests/amdgpu/a=
md_queue_reset.c
  ../tests/amdgpu/amd_queue_reset.c: In function =E2=80=98run_monitor_child=
=E2=80=99:
  ../tests/amdgpu/amd_queue_reset.c:480:8: error: implicit declaration of f=
unction =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=
=98amdgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    ret =3D amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          amdgpu_cs_query_reset_state
  ../tests/amdgpu/amd_queue_reset.c:480:8: warning: nested extern declarati=
on of =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1721884905:step_script
  section_start:1721884905:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721884906:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61484265):
  ninja: Entering directory `build'
  [1/670] Generating version.h with a custom command.
  [2/282] Linking target tests/amdgpu/amd_vcn.
  [3/282] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd=
_queue_reset.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/amdgpu/b9f2b1d@@amd_queue_reset@=
exe -Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I.=
./include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/us=
r/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib=
-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/fre=
etype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/=
nouveau -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/i=
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
d  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' =
-MF 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o.d' -o 't=
ests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -c ../tests/a=
mdgpu/amd_queue_reset.c
  ../tests/amdgpu/amd_queue_reset.c: In function =E2=80=98run_monitor_child=
=E2=80=99:
  ../tests/amdgpu/amd_queue_reset.c:480:8: error: implicit declaration of f=
unction =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=
=98amdgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    ret =3D amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          amdgpu_cs_query_reset_state
  ../tests/amdgpu/amd_queue_reset.c:480:8: warning: nested extern declarati=
on of =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1721884910:step_script
  section_start:1721884910:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721884912:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/61484267):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/669] Generating version.h with a custom command.
  [2/278] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd=
_queue_reset.c.o'.
  FAILED: tests/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_queue_reset@exe -=
Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi -I../inc=
lude/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/inc=
lude/cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/inclu=
de -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-l=
imits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3D=
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversio=
n -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -We=
rror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tes=
ts/amdgpu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -MF 'tests/amdg=
pu/b9f2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o.d' -o 'tests/amdgpu/b9f=
2b1d@@amd_queue_reset@exe/amd_queue_reset.c.o' -c ../tests/amdgpu/amd_queue=
_reset.c
  ../tests/amdgpu/amd_queue_reset.c: In function =E2=80=98run_monitor_child=
=E2=80=99:
  ../tests/amdgpu/amd_queue_reset.c:480:8: error: implicit declaration of f=
unction =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99; did you mean =E2=80=
=98amdgpu_cs_query_reset_state=E2=80=99? [-Werror=3Dimplicit-function-decla=
ration]
    ret =3D amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          amdgpu_cs_query_reset_state
  ../tests/amdgpu/amd_queue_reset.c:480:8: warning: nested extern declarati=
on of =E2=80=98amdgpu_cs_query_reset_state2=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1721884911:step_script
  section_start:1721884911:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721884912:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1232373
