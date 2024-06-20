Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B6C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 04:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1C710E1CB;
	Thu, 20 Jun 2024 04:03:55 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FC810E155;
 Thu, 20 Jun 2024 04:03:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5B1/2=5D_tests/xe=3A_Add_system=5Fallocator_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 04:03:54 -0000
Message-ID: <171885623428.127199.8751776704298345526@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620035057.3609916-1-matthew.brost@intel.com>
In-Reply-To: <20240620035057.3609916-1-matthew.brost@intel.com>
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

Series: series starting with [1/2] tests/xe: Add system_allocator test
URL   : https://patchwork.freedesktop.org/series/135084/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1205657 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60114453):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856182:step_script
  section_start:1718856182:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856183:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60114455):
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
  section_end:1718856143:step_script
  section_start:1718856143:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856144:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/60114457):
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
  section_end:1718856144:step_script
  section_start:1718856144:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856146:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/60114448):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856166:step_script
  section_start:1718856166:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856167:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60114452):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856189:step_script
  section_start:1718856189:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856190:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/60114451):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856171:step_script
  section_start:1718856171:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856171:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60114449):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856173:step_script
  section_start:1718856173:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856173:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60114450):
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature docu=
mentation is missing
  Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega fea=
ture documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentatio=
n is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature docum=
entation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feat=
ure documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature doc=
umentation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documen=
tation is missing
  Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega featur=
e documentation is missing
  Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature docume=
ntation is missing
  Warning: Missing documentation for igt@xe_exec_system_allocator@fault-ben=
chmark
  Please refer: docs/test_documentation.md for more details
  ninja: build stopped: subcommand failed.
  section_end:1718856191:step_script
  section_start:1718856191:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718856193:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1205657
