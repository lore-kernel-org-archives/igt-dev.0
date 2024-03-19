Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8AACD11BF
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 15:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA55A10FB97;
	Tue, 19 Mar 2024 15:43:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FAE10E324;
 Tue, 19 Mar 2024 15:43:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/drmtest=3A_idle_all?=
 =?utf-8?q?_GPUs_before_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Mar 2024 15:43:21 -0000
Message-ID: <171086300104.903241.2434667316356704278@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319111932.30401-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240319111932.30401-1-kamil.konieczny@linux.intel.com>
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

Series: lib/drmtest: idle all GPUs before test
URL   : https://patchwork.freedesktop.org/series/131321/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1131636 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56492984):
                                                 ^~~
                                                 int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99; did you mean =E2=80=98__gpu_make_idle=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     __multigpu_make_idle_once(fd, idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     __gpu_make_idle
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
   static void __gpu_make_idle(int fd)
               ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862821:step_script
  section_start:1710862821:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862821:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/56492987):
                                                 ^~~
                                                 int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99; did you mean =E2=80=98__gpu_make_idle=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     __multigpu_make_idle_once(fd, idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     __gpu_make_idle
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
   static void __gpu_make_idle(int fd)
               ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862867:step_script
  section_start:1710862867:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862869:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/56492986):
                                                 ^~~
                                                 int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99; did you mean =E2=80=98__gpu_make_idle=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     __multigpu_make_idle_once(fd, idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     __gpu_make_idle
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
   static void __gpu_make_idle(int fd)
               ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862868:step_script
  section_start:1710862868:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862869:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/56492988):
                                                 ^~~
                                                 int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99; did you mean =E2=80=98__gpu_make_idle=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     __multigpu_make_idle_once(fd, idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     __gpu_make_idle
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
   static void __gpu_make_idle(int fd)
               ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862869:step_script
  section_start:1710862869:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862871:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/56492985):
                                                 ^~~
                                                 int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99; did you mean =E2=80=98__gpu_make_idle=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     __multigpu_make_idle_once(fd, idx);
     ^~~~~~~~~~~~~~~~~~~~~~~~~
     __gpu_make_idle
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
   static void __gpu_make_idle(int fd)
               ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862841:step_script
  section_start:1710862841:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862842:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/56492979):
    499 | static void __multigpu_make_idle_once(int fd, inr idx)
        |                                               ^~~
        |                                               int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    601 |   __multigpu_make_idle_once(fd, idx);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
    487 | static void __gpu_make_idle(int fd)
        |             ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862817:step_script
  section_start:1710862817:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862818:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56492983):
  [19/1798] Compiling C object 'lib/76b5a35@@igt-i915_gem_c@sta/i915_gem.c.=
o'.
  [20/1798] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device=
_scan.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1780] Generating version.h with a custom command.
  [2/1780] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
  FAILED: lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o=20
  clang -Ilib/76b5a35@@igt-drmtest_c@sta -Ilib -I../lib -I../include -I../i=
nclude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -=
I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -=
I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/=
usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -X=
clang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missi=
ng-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno=
-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -We=
rror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-sel=
f -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -We=
rror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/shar=
e/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIG=
T_LOG_DOMAIN=3D"drmtest"' -MD -MQ 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c=
.o' -MF 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o.d' -o 'lib/76b5a35@@igt=
-drmtest_c@sta/drmtest.c.o' -c ../lib/drmtest.c
  ../lib/drmtest.c:499:47: error: unknown type name 'inr'; did you mean 'in=
t'?
  static void __multigpu_make_idle_once(int fd, inr idx)
                                                ^~~
                                                int
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1710862819:step_script
  section_start:1710862819:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862819:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/56492982):
    499 | static void __multigpu_make_idle_once(int fd, inr idx)
        |                                               ^~~
        |                                               int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    601 |   __multigpu_make_idle_once(fd, idx);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
    487 | static void __gpu_make_idle(int fd)
        |             ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862806:step_script
  section_start:1710862806:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862807:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56492980):
    499 | static void __multigpu_make_idle_once(int fd, inr idx)
        |                                               ^~~
        |                                               int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    601 |   __multigpu_make_idle_once(fd, idx);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
    487 | static void __gpu_make_idle(int fd)
        |             ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862811:step_script
  section_start:1710862811:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862812:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56492981):
    499 | static void __multigpu_make_idle_once(int fd, inr idx)
        |                                               ^~~
        |                                               int
  ../lib/drmtest.c: In function =E2=80=98__drm_open_driver_another=E2=80=99:
  ../lib/drmtest.c:601:3: error: implicit declaration of function =E2=80=98=
__multigpu_make_idle_once=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    601 |   __multigpu_make_idle_once(fd, idx);
        |   ^~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/drmtest.c:601:3: warning: nested extern declaration of =E2=80=98__=
multigpu_make_idle_once=E2=80=99 [-Wnested-externs]
  At top level:
  ../lib/drmtest.c:487:13: warning: =E2=80=98__gpu_make_idle=E2=80=99 defin=
ed but not used [-Wunused-function]
    487 | static void __gpu_make_idle(int fd)
        |             ^~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1710862806:step_script
  section_start:1710862806:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710862806:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1131636
