Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD96C02198
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 03:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B4510E9BC;
	Thu, 13 Feb 2025 03:03:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B08710E9BC;
 Thu, 13 Feb 2025 03:03:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5Bi-g-t=2C1/4=5D_lib/xe=3A_Fix_a_comment_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Feb 2025 03:03:36 -0000
Message-ID: <173941581623.1506415.17720064337367779229@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213021915.264978-1-oak.zeng@intel.com>
In-Reply-To: <20250213021915.264978-1-oak.zeng@intel.com>
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

Series: series starting with [i-g-t,1/4] lib/xe: Fix a comment error
URL   : https://patchwork.freedesktop.org/series/144765/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1363686 f=
or the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/71013698):
  [3/1275] Linking static target lib/libigt-nouveau_cea0b5_c.a.
  [4/1275] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util=
.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-xe_xe_util_c@sta -Ili=
b -I../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experim=
ental -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/incl=
ude/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/i=
nclude -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2=
 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouvea=
u -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include=
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
builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread=
 '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/build=
s/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_util"'  -MD -MQ 'li=
b/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o' -MF 'lib/76b5a35@@igt-xe_xe=
_util_c@sta/xe_xe_util.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_u=
til.c.o' -c ../lib/xe/xe_util.c
  ../lib/xe/xe_util.c: In function =E2=80=98xe_create_buffer=E2=80=99:
  ../lib/xe/xe_util.c:78:15: error: cast from pointer to integer of differe=
nt size [-Werror=3Dpointer-to-int-cast]
    sync->addr =3D (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c: In function =E2=80=98xe_destroy_buffer=E2=80=99:
  ../lib/xe/xe_util.c:103:15: error: cast from pointer to integer of differ=
ent size [-Werror=3Dpointer-to-int-cast]
    sync->addr =3D (uint64_t)buffer->bind_ufence;
                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1739415456:step_script
  section_start:1739415456:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415457:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/71013700):
  [2/1281] Linking static target lib/libigt-igt_kms_c.a.
  [3/1281] Compiling C object 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util=
.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_util_c@sta -Ilib -I.=
./lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental=
 -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/c=
airo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/i=
nclude/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnos=
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
c -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATAD=
IR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-=
ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_util"'  -MD -MQ 'lib/76b5a35@@ig=
t-xe_xe_util_c@sta/xe_xe_util.c.o' -MF 'lib/76b5a35@@igt-xe_xe_util_c@sta/x=
e_xe_util.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_util_c@sta/xe_xe_util.c.o' -c .=
./lib/xe/xe_util.c
  ../lib/xe/xe_util.c: In function =E2=80=98xe_create_buffer=E2=80=99:
  ../lib/xe/xe_util.c:78:15: error: cast from pointer to integer of differe=
nt size [-Werror=3Dpointer-to-int-cast]
    sync->addr =3D (uint64_t)buffer->bind_ufence;
                 ^
  ../lib/xe/xe_util.c: In function =E2=80=98xe_destroy_buffer=E2=80=99:
  ../lib/xe/xe_util.c:103:15: error: cast from pointer to integer of differ=
ent size [-Werror=3Dpointer-to-int-cast]
    sync->addr =3D (uint64_t)buffer->bind_ufence;
                 ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1739415452:step_script
  section_start:1739415452:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415453:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1363686
