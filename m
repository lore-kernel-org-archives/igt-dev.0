Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA0C27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 19:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0110ECF8;
	Fri,  7 Jun 2024 19:05:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2D10ECEA;
 Fri,  7 Jun 2024 19:05:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/xe=3A_Use_synchrono?=
 =?utf-8?q?us_gt_resets_when_needed_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 19:05:56 -0000
Message-ID: <171778715674.28075.6827368056226293904@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
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

Series: lib/xe: Use synchronous gt resets when needed (rev2)
URL   : https://patchwork.freedesktop.org/series/134509/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194121 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/59520987):
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  cc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib -I../lib -I../include -I../=
include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ =
-I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/gl=
ib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/f=
reetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/in=
clude/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET=
_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -i=
nclude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-aft=
er-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing=
-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-proto=
types -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-d=
ecls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -=
Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith =
-Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result=
 -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit=
-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain=
 -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -=
Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOU=
RCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '=
-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/=
xe_ioctl"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -M=
F 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o.d' -o 'lib/76b5a35@@i=
gt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_force_gt_reset_sync=E2=80=
=99:
  ../lib/xe/xe_ioctl.c:553:56: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98gnu_dev_minor=E2=80=99
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                                          ^
                                                          )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                 ~^
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                      ~^
  ninja: build stopped: subcommand failed.
  section_end:1717607378:step_script
  section_start:1717607378:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607380:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/59520990):
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib=
 -I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../l=
ib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/=
include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/includ=
e/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/=
usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe=
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
RGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-=
gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_=
DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_=
ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o.d' -o 'l=
ib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_force_gt_reset_sync=E2=80=
=99:
  ../lib/xe/xe_ioctl.c:553:56: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98gnu_dev_minor=E2=80=99
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                                          ^
                                                          )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                 ~^
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                      ~^
  ninja: build stopped: subcommand failed.
  section_end:1717607383:step_script
  section_start:1717607383:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607384:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/59520989):
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
plicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointe=
r-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3D=
pointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/sha=
re/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DI=
GT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta=
/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o.d=
' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../lib/xe/xe_i=
octl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_force_gt_reset_sync=E2=80=
=99:
  ../lib/xe/xe_ioctl.c:553:56: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98gnu_dev_minor=E2=80=99
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                                          ^
                                                          )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                 ~^
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                      ~^
  ninja: build stopped: subcommand failed.
  section_end:1717607378:step_script
  section_start:1717607378:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607380:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/59520991):
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
=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE6=
4_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tool=
s"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=
=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.=
c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o.d' -o 'lib/76b=
5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_force_gt_reset_sync=E2=80=
=99:
  ../lib/xe/xe_ioctl.c:553:56: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98gnu_dev_minor=E2=80=99
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                                          ^
                                                          )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                 ~^
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                      ~^
  ninja: build stopped: subcommand failed.
  section_end:1717607366:step_script
  section_start:1717607366:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607368:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/59520988):
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  cc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib -I../lib -I../include -I../=
include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ =
-I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/us=
r/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/incl=
ude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/li=
bdrm -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FO=
RTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
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
/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'li=
b/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_=
xe_ioctl_c@sta/xe_xe_ioctl.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe=
_xe_ioctl.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_force_gt_reset_sync=E2=80=
=99:
  ../lib/xe/xe_ioctl.c:553:56: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98gnu_dev_minor=E2=80=99
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                                          ^
                                                          )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                 ~^
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
      "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
                                      ~^
  ninja: build stopped: subcommand failed.
  section_end:1717607374:step_script
  section_start:1717607374:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607375:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/59520982):
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                                        ^
        |                                                        )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                               ~^
        |                                |
        |                                int
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                    ~^
        |                                     |
        |                                     int
  ninja: build stopped: subcommand failed.
  section_end:1717607361:step_script
  section_start:1717607361:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607362:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/59520986):
  ../lib/xe/xe_ioctl.c:554:4: error: expected ')'
                   minor(st.st_rdev), gt);
                   ^
  /usr/include/sys/sysmacros.h:61:20: note: expanded from macro 'minor'
  #define minor(dev) gnu_dev_minor (dev)
                     ^
  ../lib/xe/xe_ioctl.c:552:2: note: to match this '('
          snprintf(reset_string, sizeof(reset_string),
          ^
  /usr/include/bits/stdio2.h:72:28: note: expanded from macro 'snprintf'
    __builtin___snprintf_chk (str, len, __USE_FORTIFY_LEVEL - 1, __bos (str=
), \
                             ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1717607384:step_script
  section_start:1717607384:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607384:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/59520985):
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                                        ^
        |                                                        )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                               ~^
        |                                |
        |                                int
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                    ~^
        |                                     |
        |                                     int
  ninja: build stopped: subcommand failed.
  section_end:1717607360:step_script
  section_start:1717607360:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607363:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/59520983):
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                                        ^
        |                                                        )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                               ~^
        |                                |
        |                                int
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                    ~^
        |                                     |
        |                                     int
  ninja: build stopped: subcommand failed.
  section_end:1717607378:step_script
  section_start:1717607378:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607380:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/59520984):
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                                        ^
        |                                                        )
  ../lib/xe/xe_ioctl.c:553:32: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                               ~^
        |                                |
        |                                int
  ../lib/xe/xe_ioctl.c:553:37: warning: format =E2=80=98%d=E2=80=99 expects=
 a matching =E2=80=98int=E2=80=99 argument [-Wformat=3D]
    553 |    "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
        |                                    ~^
        |                                     |
        |                                     int
  ninja: build stopped: subcommand failed.
  section_end:1717607379:step_script
  section_start:1717607379:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717607380:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1194121
