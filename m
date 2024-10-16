Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB064D20695
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 03:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7805D10E2D0;
	Wed, 16 Oct 2024 03:36:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020510E2CC;
 Wed, 16 Oct 2024 03:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/xe=3A_Add_system?=
 =?utf-8?q?=5Fallocator_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Oct 2024 03:36:34 -0000
Message-ID: <172904979483.1271726.11803917428909343582@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016030405.539152-1-matthew.brost@intel.com>
In-Reply-To: <20241016030405.539152-1-matthew.brost@intel.com>
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

Series: tests/xe: Add system_allocator test (rev3)
URL   : https://patchwork.freedesktop.org/series/137545/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1290998 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/65130862):
  [1/1131] Generating version.h with a custom command.
  [2/526] Linking target tests/xe_exec_reset.
  [3/526] Generating xe_exec_queue_property.testlist with a meson_exe.py cu=
stom command.
  [4/526] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [5/526] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  cc -Itests/59830eb@@xe_exec_system_allocator@exe -Itests -I../tests -I../=
include -I../include/drm-uapi -I../include/drm-uapi-experimental -I../inclu=
de/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/inclu=
de/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/inclu=
de -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -=
I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -=
Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include confi=
g.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement=
 -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnest=
ed-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshado=
w -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-un=
initialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-co=
mpare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Da=
ddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werro=
r=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthre=
ad  -MD -MQ 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_syst=
em_allocator.c.o' -MF 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe=
_exec_system_allocator.c.o.d' -o 'tests/59830eb@@xe_exec_system_allocator@e=
xe/intel_xe_exec_system_allocator.c.o' -c ../tests/intel/xe_exec_system_all=
ocator.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98DONTUNMAP=E2=80=99?
        remap_flags |=3D MREMAP_DONTUNMAP;
                       ^~~~~~~~~~~~~~~~
                       DONTUNMAP
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049704:step_script
  section_start:1729049704:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049705:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/65130865):
  ninja: Entering directory `build'
  [1/753] Generating version.h with a custom command.
  [2/431] Linking target tests/xe_exec_reset.
  [3/431] Linking target tests/xe_exec_sip.
  [4/431] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@xe_exec_system_allocator@=
exe -Itests -I../tests -I../include -I../include/drm-uapi -I../include/drm-=
uapi-experimental -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sys=
calls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aar=
ch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid=
 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/=
usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/include/=
valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFF=
SET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE=
 -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-=
after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmiss=
ing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pr=
ototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbere=
d -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ari=
th -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-res=
ult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Di=
nit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dm=
ain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cas=
t -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werro=
r=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SO=
URCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@xe_exec_system_allocator@exe/int=
el_xe_exec_system_allocator.c.o' -MF 'tests/59830eb@@xe_exec_system_allocat=
or@exe/intel_xe_exec_system_allocator.c.o.d' -o 'tests/59830eb@@xe_exec_sys=
tem_allocator@exe/intel_xe_exec_system_allocator.c.o' -c ../tests/intel/xe_=
exec_system_allocator.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98DONTUNMAP=E2=80=99?
        remap_flags |=3D MREMAP_DONTUNMAP;
                       ^~~~~~~~~~~~~~~~
                       DONTUNMAP
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049676:step_script
  section_start:1729049676:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049677:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/65130864):
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Il=
ib -I../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experi=
mental -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/inc=
lude/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype=
2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouve=
au -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/includ=
e/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -W=
invalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_=
FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wform=
at=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmis=
sing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exte=
rns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstr=
ict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitial=
ized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -=
Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress =
-Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint=
-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-=
braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-typ=
e -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno=
-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthrea=
d '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/buil=
ds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ '=
lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-x=
e_xe_ioctl_c@sta/xe_xe_ioctl.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/=
xe_xe_ioctl.c.o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c:439:7: error: conflicting types for =E2=80=98xe_bo_m=
ap_fixed=E2=80=99
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
         ^~~~~~~~~~~~~~~
  In file included from ../lib/xe/xe_ioctl.c:46:
  ../lib/xe/xe_ioctl.h:89:7: note: previous declaration of =E2=80=98xe_bo_m=
ap_fixed=E2=80=99 was here
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned in=
t addr);
         ^~~~~~~~~~~~~~~
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:445:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1729049656:step_script
  section_start:1729049656:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049657:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/65130866):
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib -I=
../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimenta=
l -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/=
cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagno=
stics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -We=
xtra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
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
ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"'  -MD -MQ 'lib/76b5a35@@i=
gt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@s=
ta/xe_xe_ioctl.c.o.d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.=
o' -c ../lib/xe/xe_ioctl.c
  ../lib/xe/xe_ioctl.c:439:7: error: conflicting types for =E2=80=98xe_bo_m=
ap_fixed=E2=80=99
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
         ^~~~~~~~~~~~~~~
  In file included from ../lib/xe/xe_ioctl.c:46:
  ../lib/xe/xe_ioctl.h:89:7: note: previous declaration of =E2=80=98xe_bo_m=
ap_fixed=E2=80=99 was here
   void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned in=
t addr);
         ^~~~~~~~~~~~~~~
  ../lib/xe/xe_ioctl.c: In function =E2=80=98xe_bo_map_fixed=E2=80=99:
  ../lib/xe/xe_ioctl.c:445:13: error: cast to pointer from integer of diffe=
rent size [-Werror=3Dint-to-pointer-cast]
    map =3D mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd=
, mmo);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1729049653:step_script
  section_start:1729049653:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049654:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/65130857):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1134] Generating version.h with a custom command.
  [2/528] Linking target tests/xe_exec_reset.
  [3/528] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [4/528] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  cc -Itests/59830eb@@xe_exec_system_allocator@exe -Itests -I../tests -I../=
include -I../include/drm-uapi -I../include/drm-uapi-experimental -I../inclu=
de/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/inclu=
de/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/inclu=
de/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include=
/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics=
-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra =
-std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -=
Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fa=
llthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribut=
e -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defi=
nition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuni=
nitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fi=
eld-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign=
-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 =
-pthread -MD -MQ 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec=
_system_allocator.c.o' -MF 'tests/59830eb@@xe_exec_system_allocator@exe/int=
el_xe_exec_system_allocator.c.o.d' -o 'tests/59830eb@@xe_exec_system_alloca=
tor@exe/intel_xe_exec_system_allocator.c.o' -c ../tests/intel/xe_exec_syste=
m_allocator.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function)
   1146 |      remap_flags |=3D MREMAP_DONTUNMAP;
        |                     ^~~~~~~~~~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049666:step_script
  section_start:1729049666:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049666:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/65130861):
  [2/526] Generating xe_exec_queue_property.testlist with a meson_exe.py cu=
stom command.
  [3/526] Linking target tests/xe_exec_reset.
  [4/526] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [5/526] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  clang -Itests/59830eb@@xe_exec_system_allocator@exe -Itests -I../tests -I=
../include -I../include/drm-uapi -I../include/drm-uapi-experimental -I../in=
clude/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/in=
clude/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/in=
clude/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/incl=
ude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xclang -f=
color-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextr=
a -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2=
 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissing-d=
eclarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototy=
pes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-dec=
ls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field=
-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-co=
mpare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Da=
ddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werro=
r=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthre=
ad -MD -MQ 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_syste=
m_allocator.c.o' -MF 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_=
exec_system_allocator.c.o.d' -o 'tests/59830eb@@xe_exec_system_allocator@ex=
e/intel_xe_exec_system_allocator.c.o' -c ../tests/intel/xe_exec_system_allo=
cator.c
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: use of undeclar=
ed identifier 'MREMAP_DONTUNMAP'
                                          remap_flags |=3D MREMAP_DONTUNMAP;
                                                         ^
  ../tests/intel/xe_exec_system_allocator.c:1427:11: warning: implicit conv=
ersion from 'double' to 'unsigned int' changes value from 0.01 to 0 [-Wlite=
ral-conversion]
                                  sleep(.01);
                                  ~~~~~ ^~~
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1729049683:step_script
  section_start:1729049683:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049684:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/65130860):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1004] Generating version.h with a custom command.
  [2/405] Linking target tests/xe_exec_reset.
  [3/405] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [4/405] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  cc -Itests/59830eb@@xe_exec_system_allocator@exe -Itests -I../tests -I../=
include -I../include/drm-uapi -I../include/drm-uapi-experimental -I../inclu=
de/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/inclu=
de/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/inclu=
de/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include=
/libdrm -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno=
-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-boun=
ds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@=
@xe_exec_system_allocator@exe/intel_xe_exec_system_allocator.c.o' -MF 'test=
s/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_allocator.c.o.=
d' -o 'tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_all=
ocator.c.o' -c ../tests/intel/xe_exec_system_allocator.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function)
   1146 |      remap_flags |=3D MREMAP_DONTUNMAP;
        |                     ^~~~~~~~~~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049703:step_script
  section_start:1729049703:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049703:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/65130858):
  ninja: Entering directory `build'
  [1/1135] Generating version.h with a custom command.
  [2/530] Linking target tests/xe_exec_reset.
  [3/530] Generating xe_exec_queue_property.testlist with a meson_exe.py cu=
stom command.
  [4/530] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [5/530] Compiling C object 'tests/59830eb@@xe_exec_system_allocator@exe/i=
ntel_xe_exec_system_allocator.c.o'.
  FAILED: tests/59830eb@@xe_exec_system_allocator@exe/intel_xe_exec_system_=
allocator.c.o=20
  cc -Itests/59830eb@@xe_exec_system_allocator@exe -Itests -I../tests -I../=
include -I../include/drm-uapi -I../include/drm-uapi-experimental -I../inclu=
de/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I../lib/stu=
bs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib=
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
ARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@xe_exec_system_alloc=
ator@exe/intel_xe_exec_system_allocator.c.o' -MF 'tests/59830eb@@xe_exec_sy=
stem_allocator@exe/intel_xe_exec_system_allocator.c.o.d' -o 'tests/59830eb@=
@xe_exec_system_allocator@exe/intel_xe_exec_system_allocator.c.o' -c ../tes=
ts/intel/xe_exec_system_allocator.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function)
   1146 |      remap_flags |=3D MREMAP_DONTUNMAP;
        |                     ^~~~~~~~~~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049666:step_script
  section_start:1729049666:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049667:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/65130859):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1134] Generating version.h with a custom command.
  [2/528] Linking target tests/xe_exec_reset.
  [3/528] Generating xe_exec_reset.testlist with a meson_exe.py custom comm=
and.
  [4/528] Compiling C object 'tests/tests@@xe_exec_system_allocator@exe/int=
el_xe_exec_system_allocator.c.o'.
  FAILED: tests/tests@@xe_exec_system_allocator@exe/intel_xe_exec_system_al=
locator.c.o=20
  cc -Itests/tests@@xe_exec_system_allocator@exe -Itests -I../tests -I../in=
clude -I../include/drm-uapi -I../include/drm-uapi-experimental -I../include=
/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include=
/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include=
/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/l=
ibdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-c=
olor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -s=
td=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wb=
ad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fall=
through=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute =
-Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defini=
tion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunini=
tialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-fiel=
d-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-c=
ompare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3D=
address -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werr=
or=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthr=
ead  -MD -MQ 'tests/tests@@xe_exec_system_allocator@exe/intel_xe_exec_syste=
m_allocator.c.o' -MF 'tests/tests@@xe_exec_system_allocator@exe/intel_xe_ex=
ec_system_allocator.c.o.d' -o 'tests/tests@@xe_exec_system_allocator@exe/in=
tel_xe_exec_system_allocator.c.o' -c ../tests/intel/xe_exec_system_allocato=
r.c
  ../tests/intel/xe_exec_system_allocator.c: In function =E2=80=98test_exec=
=E2=80=99:
  ../tests/intel/xe_exec_system_allocator.c:1146:21: error: =E2=80=98MREMAP=
_DONTUNMAP=E2=80=99 undeclared (first use in this function)
   1146 |      remap_flags |=3D MREMAP_DONTUNMAP;
        |                     ^~~~~~~~~~~~~~~~
  ../tests/intel/xe_exec_system_allocator.c:1146:21: note: each undeclared =
identifier is reported only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1729049685:step_script
  section_start:1729049685:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729049685:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1290998
