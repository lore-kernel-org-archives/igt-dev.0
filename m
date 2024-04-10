Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A536BCD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 08:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2256911323D;
	Wed, 10 Apr 2024 08:05:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C1B11323D;
 Wed, 10 Apr 2024 08:05:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_xe=5Fbo=5Falloc_tes?=
 =?utf-8?q?t?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Apr 2024 08:05:30 -0000
Message-ID: <171273633073.1319548.7731918767728178260@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410071209.481206-1-matthew.brost@intel.com>
In-Reply-To: <20240410071209.481206-1-matthew.brost@intel.com>
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

Series: Add xe_bo_alloc test
URL   : https://patchwork.freedesktop.org/series/132251/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1150423 f=
or the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/57417427):
  ninja: Entering directory `build'
  [1/1176] Generating version.h with a custom command.
  [2/1172] Linking static target lib/libigt-igt_kms_c.a.
  [3/1172] Linking static target lib/libigt-igt_fb_c.a.
  [4/1172] Linking static target lib/libigt-igt_amd_c.a.
  [5/1172] Compiling C object 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioc=
tl.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Il=
ib -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I..=
/lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 =
-I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-1 -I/=
usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/in=
clude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gnueabi=
hf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways=
 -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O=
2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-c=
ast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -=
Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-nor=
eturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointe=
r-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wun=
used -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializer=
s -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-paramet=
er -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dim=
plicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -We=
rror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werr=
or=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwri=
te-strings -fno-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DA=
TADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/i=
gt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35=
@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_=
c@sta/xe_xe_ioctl.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl=
.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:433:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1712735919:step_script
  section_start:1712735919:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1712735920:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/57417429):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1173] Generating version.h with a custom command.
  [2/1169] Linking static target lib/libigt-igt_kms_c.a.
  [3/1169] Linking static target lib/libigt-igt_fb_c.a.
  [4/1169] Compiling C object 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioc=
tl.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib -I=
../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/=
stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/us=
r/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/includ=
e/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libd=
rm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/inclu=
de/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-=
result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/=
local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tes=
ts"' '-DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_io=
ctl_c@sta/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_io=
ctl.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../li=
b/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:433:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1712735912:step_script
  section_start:1712735912:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1712735913:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1150423
