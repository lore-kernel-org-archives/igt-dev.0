Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223EC02198
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 02:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF77B10E9BC;
	Thu, 13 Feb 2025 02:58:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC5710E0C2;
 Thu, 13 Feb 2025 02:58:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Xe=3A_Add_tests_for_PXP?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Feb 2025 02:58:28 -0000
Message-ID: <173941550811.1508100.11993597312473691142@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
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

Series: Xe: Add tests for PXP (rev3)
URL   : https://patchwork.freedesktop.org/series/142450/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1363685 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/71013675):
   #1 [killpg+0x40]
   #2 [gsignal+0x10b]
   #3 [abort+0x121]
   #4 [<unknown>+0x121]
   #5 [__assert_fail+0x42]
   #6 [internal_assert+0xe5]
   #7 [igt_skip+0x169]
   #8 [__igt_skip_check+0x1b5]
   #9 [termination_tests+0x41e]
   #10 [__igt_unique____real_main1097+0x2f6]
   #11 [main+0x27]
   #12 [__libc_start_main+0xeb]
   #13 [_start+0x2a]
  ninja: build stopped: subcommand failed.
  section_end:1739415407:step_script
  section_start:1739415407:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415407:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/71013678):
  [2/406] Linking target tests/xe_pat.
  [3/406] Linking target tests/xe_oa.
  [4/406] Linking target tests/xe_pm_residency.
  [5/406] Linking target tests/xe_pm.
  [6/406] Compiling C object 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o'.
  FAILED: tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@xe_pxp@exe -Itests -I../t=
ests -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental =
-I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I=
/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/gli=
b-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/fr=
eetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm=
/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/in=
clude/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wal=
l -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h=
 -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -W=
format=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -=
Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-=
externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -=
Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-unini=
tialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compa=
re -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddr=
ess -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthrea=
d  -MD -MQ 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o' -MF 'tests/59830eb@=
@xe_pxp@exe/intel_xe_pxp.c.o.d' -o 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.=
c.o' -c ../tests/intel/xe_pxp.c
  ../tests/intel/xe_pxp.c: In function =E2=80=98termination_tests=E2=80=99:
  ../tests/intel/xe_pxp.c:1065:53: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
     fw_handle =3D igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
                                                       ^~~~~~~~
                                                       STA_RONLY
  ../tests/intel/xe_pxp.c:1065:53: note: each undeclared identifier is repo=
rted only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1739415363:step_script
  section_start:1739415363:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415364:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/71013677):
  ninja: Entering directory `build'
  [1/746] Generating version.h with a custom command.
  [2/406] Linking target tests/xe_pat.
  [3/406] Linking target tests/xe_oa.
  [4/406] Compiling C object 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o'.
  FAILED: tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@xe_pxp@exe -Itests -I..=
/tests -I../include -I../include/drm-uapi -I../include/drm-uapi-experimenta=
l -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ =
-I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/includ=
e/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/li=
bdrm/nouveau -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/=
usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D6=
4 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include co=
nfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statem=
ent -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarat=
ions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wn=
ested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wsh=
adow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe=
-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign=
-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 =
-pthread  -MD -MQ 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o' -MF 'tests/5=
9830eb@@xe_pxp@exe/intel_xe_pxp.c.o.d' -o 'tests/59830eb@@xe_pxp@exe/intel_=
xe_pxp.c.o' -c ../tests/intel/xe_pxp.c
  ../tests/intel/xe_pxp.c: In function =E2=80=98termination_tests=E2=80=99:
  ../tests/intel/xe_pxp.c:1065:53: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
     fw_handle =3D igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
                                                       ^~~~~~~~
                                                       STA_RONLY
  ../tests/intel/xe_pxp.c:1065:53: note: each undeclared identifier is repo=
rted only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1739415400:step_script
  section_start:1739415400:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415401:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/71013679):
  ninja: Entering directory `build'
  [1/743] Generating version.h with a custom command.
  [2/401] Linking target tests/xe_oa.
  [3/401] Linking target tests/xe_pm.
  [4/401] Compiling C object 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o'.
  FAILED: tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@xe_pxp@exe -Itests -I../test=
s -I../include -I../include/drm-uapi -I../include/drm-uapi-experimental -I.=
./include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/us=
r/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype=
2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouve=
au -I/usr/include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/als=
a -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winval=
id-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTI=
FY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D=
2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-=
format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -=
Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-p=
rototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized =
-Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-t=
ype-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werr=
or=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conv=
ersion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-brace=
s -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -We=
rror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-buil=
tin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ =
'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o' -MF 'tests/59830eb@@xe_pxp@exe=
/intel_xe_pxp.c.o.d' -o 'tests/59830eb@@xe_pxp@exe/intel_xe_pxp.c.o' -c ../=
tests/intel/xe_pxp.c
  ../tests/intel/xe_pxp.c: In function =E2=80=98termination_tests=E2=80=99:
  ../tests/intel/xe_pxp.c:1065:53: error: =E2=80=98O_RDONLY=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98STA_RONLY=E2=80=99?
     fw_handle =3D igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
                                                       ^~~~~~~~
                                                       STA_RONLY
  ../tests/intel/xe_pxp.c:1065:53: note: each undeclared identifier is repo=
rted only once for each function it appears in
  ninja: build stopped: subcommand failed.
  section_end:1739415396:step_script
  section_start:1739415396:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415397:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/71013670):
   #1 [killpg+0x40]
   #2 [gsignal+0x145]
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [internal_assert+0xe5]
   #7 [igt_skip+0x16a]
   #8 [__igt_skip_check+0x1bb]
   #9 [termination_tests+0x3c8]
   #10 [__igt_unique____real_main1097+0x246]
   #11 [main+0x23]
   #12 [__libc_start_main+0xf3]
   #13 [_start+0x2e]
  ninja: build stopped: subcommand failed.
  section_end:1739415376:step_script
  section_start:1739415376:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415377:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/71013674):
   #0 [killpg+0x40]
   #1 [gsignal+0x145]
   #2 [abort+0x12b]
   #3 [__assert_fail_base.cold+0xf]
   #4 [__assert_fail+0x46]
   #5 [internal_assert+0xe0]
   #6 [igt_skip+0x150]
   #7 [__igt_skip_check+0x127]
   #8 [termination_tests+0x6ee]
   #9 [__igt_unique____real_main1097+0x9c4]
   #10 [main+0x29]
   #11 [__libc_start_main+0xf3]
   #12 [_start+0x2e]
  ninja: build stopped: subcommand failed.
  section_end:1739415424:step_script
  section_start:1739415424:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415425:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/71013673):
   #1 [killpg+0x40]
   #2 [gsignal+0x145]
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [internal_assert+0xe5]
   #7 [igt_skip+0x16a]
   #8 [__igt_skip_check+0x1bb]
   #9 [termination_tests+0x3c8]
   #10 [__igt_unique____real_main1097+0x246]
   #11 [main+0x23]
   #12 [__libc_start_main+0xf3]
   #13 [_start+0x2e]
  ninja: build stopped: subcommand failed.
  section_end:1739415409:step_script
  section_start:1739415409:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415410:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/71013671):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1104] Generating version.h with a custom command.
  [2/446] Linking target tests/xe_oa.
  [3/446] Generating xe_oa.testlist with a meson_exe.py custom command.
  [4/446] Generating xe_pxp.testlist with a meson_exe.py custom command.
  FAILED: tests/xe_pxp.testlist=20
  /usr/bin/meson --internal exe --capture tests/xe_pxp.testlist -- /builds/=
gfx-ci/igt-ci-tags/build/tests/xe_pxp --show-testlist
  skipping is allowed only in fixtures, subtests or igt_simple_main
  please refer to lib/igt_core documentation
  xe_pxp: ../lib/igt_core.c:450: internal_assert: Assertion `0' failed.
  Received signal SIGABRT.
  Stack trace:=20
  ninja: build stopped: subcommand failed.
  section_end:1739415363:step_script
  section_start:1739415363:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415364:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/71013672):
   #1 [killpg+0x40]
   #2 [gsignal+0x145]
   #3 [abort+0x12b]
   #4 [__assert_fail_base.cold+0xf]
   #5 [__assert_fail+0x46]
   #6 [internal_assert+0xe5]
   #7 [igt_skip+0x16a]
   #8 [__igt_skip_check+0x1bb]
   #9 [termination_tests+0x3c8]
   #10 [__igt_unique____real_main1097+0x246]
   #11 [main+0x23]
   #12 [__libc_start_main+0xf3]
   #13 [_start+0x2e]
  ninja: build stopped: subcommand failed.
  section_end:1739415360:step_script
  section_start:1739415360:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1739415360:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1363685
