Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1421C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 02:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769EE10E116;
	Wed, 21 Aug 2024 02:04:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D37210E116;
 Wed, 21 Aug 2024 02:04:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/xe=3A_Add_system?=
 =?utf-8?q?=5Fallocator_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Aug 2024 02:04:47 -0000
Message-ID: <172420588743.717172.12755453906384939376@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240821014108.1578139-1-matthew.brost@intel.com>
In-Reply-To: <20240821014108.1578139-1-matthew.brost@intel.com>
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

Series: tests/xe: Add system_allocator test
URL   : https://patchwork.freedesktop.org/series/137545/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1253896 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/62525430):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99; did you mean =E2=80=98MS_ASYNC=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   #define FIVE_SEC  MS_TO_NS(5000)
                     ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    int64_t timeout =3D FIVE_SEC;
                      ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
   #define FIVE_SEC  MS_TO_NS(5000)
                     ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    int64_t timeout =3D FIVE_SEC;
                      ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205555:step_script
  section_start:1724205555:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205556:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/62525433):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99; did you mean =E2=80=98MS_ASYNC=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   #define FIVE_SEC  MS_TO_NS(5000)
                     ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    int64_t timeout =3D FIVE_SEC;
                      ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
   #define FIVE_SEC  MS_TO_NS(5000)
                     ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    int64_t timeout =3D FIVE_SEC;
                      ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205556:step_script
  section_start:1724205556:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205557:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/62525432):
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
  ../lib/xe/xe_ioctl.c:427:7: error: conflicting types for =E2=80=98xe_bo_m=
ap_fixed=E2=80=99
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
         ^~~~~~~~~~~~~~~
  In file included from ../lib/xe/xe_ioctl.c:46:
  ../lib/xe/xe_ioctl.h:84:7: note: previous declaration of =E2=80=98xe_bo_m=
ap_fixed=E2=80=99 was here
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned in=
t addr);
         ^~~~~~~~~~~~~~~
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:433:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205523:step_script
  section_start:1724205523:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205524:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/62525434):
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
  ../lib/xe/xe_ioctl.c:427:7: error: conflicting types for =E2=80=98xe_bo_m=
ap_fixed=E2=80=99
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
         ^~~~~~~~~~~~~~~
  In file included from ../lib/xe/xe_ioctl.c:46:
  ../lib/xe/xe_ioctl.h:84:7: note: previous declaration of =E2=80=98xe_bo_m=
ap_fixed=E2=80=99 was here
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned in=
t addr);
         ^~~~~~~~~~~~~~~
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:433:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205559:step_script
  section_start:1724205559:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205560:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/62525425):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205550:step_script
  section_start:1724205550:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205551:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/62525429):
  ../tests/intel/xe_exec_system_allocator.c:28:22: note: expanded from macr=
o 'QUARTER_SEC'
  #define QUARTER_SEC             MS_TO_NS(250)
                                  ^
  ../tests/intel/xe_exec_system_allocator.c:947:28: error: implicit declara=
tion of function 'MS_TO_NS' is invalid in C99 [-Werror,-Wimplicit-function-=
declaration]
                                         exec_queues[e], FIVE_SEC);
                                                         ^
  ../tests/intel/xe_exec_system_allocator.c:29:19: note: expanded from macr=
o 'FIVE_SEC'
  #define FIVE_SEC                MS_TO_NS(5000)
                                  ^
  ../tests/intel/xe_exec_system_allocator.c:1170:11: warning: implicit conv=
ersion from 'double' to 'unsigned int' changes value from 0.01 to 0 [-Wlite=
ral-conversion]
                                  sleep(.01);
                                  ~~~~~ ^~~
  1 warning and 6 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1724205568:step_script
  section_start:1724205568:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205569:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/62525428):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205542:step_script
  section_start:1724205542:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205543:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/62525426):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205543:step_script
  section_start:1724205543:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205545:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/62525427):
  ../tests/intel/xe_exec_system_allocator.c:29:19: error: implicit declarat=
ion of function =E2=80=98MS_TO_NS=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:29:19: warning: nested extern d=
eclaration of =E2=80=98MS_TO_NS=E2=80=99 [-Wnested-externs]
     29 | #define FIVE_SEC  MS_TO_NS(5000)
        |                   ^~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:149:20: note: in expansion of m=
acro =E2=80=98FIVE_SEC=E2=80=99
    149 |  int64_t timeout =3D FIVE_SEC;
        |                    ^~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1724205546:step_script
  section_start:1724205546:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724205547:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1253896
