Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CC2C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 17:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F417E10E084;
	Thu,  1 Aug 2024 17:07:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B3B10E084;
 Thu,  1 Aug 2024 17:07:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fsysfs?=
 =?utf-8?q?=5Fpreempt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 17:07:44 -0000
Message-ID: <172253206474.488689.6267412500650481580@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in=
 xe (rev5)
URL   : https://patchwork.freedesktop.org/series/136449/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1238765 f=
or the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61791006):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@xe_sysfs_preempt_timeout@=
exe -Itests -I../tests -I../include -I../include/drm-uapi -I../include/linu=
x-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cair=
o -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/i=
nclude/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiag=
nostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -=
Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURC=
E=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpl=
icit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-sty=
le-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototype=
s -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-mis=
sing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limi=
ts -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darr=
ay-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -=
Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werro=
r=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Ds=
equence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mall=
oc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/5=
9830eb@@xe_sysfs_preempt_timeout@exe/intel_xe_sysfs_preempt_timeout.c.o' -M=
F 'tests/59830eb@@xe_sysfs_preempt_timeout@exe/intel_xe_sysfs_preempt_timeo=
ut.c.o.d' -o 'tests/59830eb@@xe_sysfs_preempt_timeout@exe/intel_xe_sysfs_pr=
eempt_timeout.c.o' -c ../tests/intel/xe_sysfs_preempt_timeout.c
  ../tests/intel/xe_sysfs_preempt_timeout.c: In function =E2=80=98__igt_uni=
que____real_main173=E2=80=99:
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: error: implicit declara=
tion of function =E2=80=98openat=E2=80=99; did you mean =E2=80=98popen=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: warning: nested extern =
declaration of =E2=80=98openat=E2=80=99 [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: error: =E2=80=98O_RDONL=
Y=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98S=
TA_RONLY=E2=80=99?
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: note: each undeclared i=
dentifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722531876:step_script
  section_start:1722531876:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722531876:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61791005):
                                                                ^
  ../tests/intel/xe_sysfs_preempt_timeout.c: In function =E2=80=98__igt_uni=
que____real_main173=E2=80=99:
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: error: implicit declara=
tion of function =E2=80=98openat=E2=80=99; did you mean =E2=80=98popen=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: warning: nested extern =
declaration of =E2=80=98openat=E2=80=99 [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: error: =E2=80=98O_RDONL=
Y=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98S=
TA_RONLY=E2=80=99?
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: note: each undeclared i=
dentifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722531872:step_script
  section_start:1722531872:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722531873:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/61791007):
                                                                ^
  ../tests/intel/xe_sysfs_preempt_timeout.c: In function =E2=80=98__igt_uni=
que____real_main173=E2=80=99:
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: error: implicit declara=
tion of function =E2=80=98openat=E2=80=99; did you mean =E2=80=98popen=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:19: warning: nested extern =
declaration of =E2=80=98openat=E2=80=99 [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: error: =E2=80=98O_RDONL=
Y=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98S=
TA_RONLY=E2=80=99?
        engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:205:44: note: each undeclared i=
dentifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722531888:step_script
  section_start:1722531888:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722531889:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1238765
