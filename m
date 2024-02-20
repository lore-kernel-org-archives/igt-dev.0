Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7CAC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 17:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753C410E5C4;
	Tue, 20 Feb 2024 17:20:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7C910E5C4;
 Tue, 20 Feb 2024 17:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/amdgpu/amd=5Fmult?=
 =?utf-8?q?idisplay=5Fmodeset=3A_Run_mode_set_and_display_enable_for_multidi?=
 =?utf-8?q?splays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Feb 2024 17:20:29 -0000
Message-ID: <170844962930.125002.17348667684503621612@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220164323.63411-1-hersenxs.wu@amd.com>
In-Reply-To: <20240220164323.63411-1-hersenxs.wu@amd.com>
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

Series: tests/amdgpu/amd_multidisplay_modeset: Run mode set and display ena=
ble for multidisplays
URL   : https://patchwork.freedesktop.org/series/130136/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1108239 f=
or the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/55267008):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_multidisplay_m=
odeset@exe -Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-u=
api -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I..=
/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/includ=
e/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/li=
bdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/us=
r/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 =
-Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include conf=
ig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statemen=
t -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaratio=
ns -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnes=
ted-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshad=
ow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-u=
ninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-c=
ompare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3D=
address -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werr=
or=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3D=
nonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dseque=
nce-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -=
fno-builtin-calloc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_multidispla=
y_modeset@exe/amd_multidisplay_modeset.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_=
multidisplay_modeset@exe/amd_multidisplay_modeset.c.o.d' -o 'tests/amdgpu/b=
9f2b1d@@amd_multidisplay_modeset@exe/amd_multidisplay_modeset.c.o' -c ../te=
sts/amdgpu/amd_multidisplay_modeset.c
  ../tests/amdgpu/amd_multidisplay_modeset.c: In function =E2=80=98dpcd_rea=
d_byte=E2=80=99:
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: error: implicit declara=
tion of function =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
     fd =3D open(path, O_RDONLY);
          ^~~~
          popen
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: warning: nested extern =
declaration of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: error: =E2=80=98O_RDON=
LY=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98=
STA_RONLY=E2=80=99?
     fd =3D open(path, O_RDONLY);
                     ^~~~~~~~
                     STA_RONLY
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: note: each undeclared =
identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1708449378:step_script
  section_start:1708449378:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708449379:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/55267007):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/amdgpu/b9f2b1d@@amd_multidisplay=
_modeset@exe -Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm=
-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I=
../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnuea=
bihf/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/in=
clude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/includ=
e/libdrm/nouveau -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind=
 -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-decl=
arations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes=
 -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls =
-Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-m=
aybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-=
sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Wer=
ror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self=
 -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Wer=
ror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_mul=
tidisplay_modeset@exe/amd_multidisplay_modeset.c.o' -MF 'tests/amdgpu/b9f2b=
1d@@amd_multidisplay_modeset@exe/amd_multidisplay_modeset.c.o.d' -o 'tests/=
amdgpu/b9f2b1d@@amd_multidisplay_modeset@exe/amd_multidisplay_modeset.c.o' =
-c ../tests/amdgpu/amd_multidisplay_modeset.c
  ../tests/amdgpu/amd_multidisplay_modeset.c: In function =E2=80=98dpcd_rea=
d_byte=E2=80=99:
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: error: implicit declara=
tion of function =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
     fd =3D open(path, O_RDONLY);
          ^~~~
          popen
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: warning: nested extern =
declaration of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: error: =E2=80=98O_RDON=
LY=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98=
STA_RONLY=E2=80=99?
     fd =3D open(path, O_RDONLY);
                     ^~~~~~~~
                     STA_RONLY
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: note: each undeclared =
identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1708449370:step_script
  section_start:1708449370:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708449370:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/55267009):
  /usr/bin/mips-linux-gnu-gcc -Itests/amdgpu/b9f2b1d@@amd_multidisplay_mode=
set@exe -Itests/amdgpu -I../tests/amdgpu -I../include -I../include/drm-uapi=
 -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-=
2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/free=
type2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/n=
ouveau -I/usr/include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include=
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
to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -=
Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point=
 -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-built=
in-calloc -pthread  -MD -MQ 'tests/amdgpu/b9f2b1d@@amd_multidisplay_modeset=
@exe/amd_multidisplay_modeset.c.o' -MF 'tests/amdgpu/b9f2b1d@@amd_multidisp=
lay_modeset@exe/amd_multidisplay_modeset.c.o.d' -o 'tests/amdgpu/b9f2b1d@@a=
md_multidisplay_modeset@exe/amd_multidisplay_modeset.c.o' -c ../tests/amdgp=
u/amd_multidisplay_modeset.c
  ../tests/amdgpu/amd_multidisplay_modeset.c: In function =E2=80=98dpcd_rea=
d_byte=E2=80=99:
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: error: implicit declara=
tion of function =E2=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
     fd =3D open(path, O_RDONLY);
          ^~~~
          popen
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:8: warning: nested extern =
declaration of =E2=80=98open=E2=80=99 [-Wnested-externs]
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: error: =E2=80=98O_RDON=
LY=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98=
STA_RONLY=E2=80=99?
     fd =3D open(path, O_RDONLY);
                     ^~~~~~~~
                     STA_RONLY
  ../tests/amdgpu/amd_multidisplay_modeset.c:100:19: note: each undeclared =
identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1708449386:step_script
  section_start:1708449386:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708449387:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1108239
