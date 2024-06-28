Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56697C30658
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 21:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1736210E1C1;
	Fri, 28 Jun 2024 21:44:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA04710E1C1;
 Fri, 28 Jun 2024 21:44:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Intel_Xe_OA_IGT_lib_and?=
 =?utf-8?q?_tools_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jun 2024 21:44:34 -0000
Message-ID: <171961107482.186685.9931805101279682394@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
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

Series: Intel Xe OA IGT lib and tools (rev2)
URL   : https://patchwork.freedesktop.org/series/135451/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1213077 f=
or the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60509148):
  [45/1073] Linking target lib/libi915_perf.so.1.5.
  [46/1073] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf=
.so.1.5.symbols'.
  [47/1073] Compiling C object 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o'.
  FAILED: lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@xe_oa@sha -Ilib -I../lib =
-I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/s=
yscalls -I. -I../ -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D=
64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include c=
onfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-state=
ment -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declara=
tions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -W=
nested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Ws=
hadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-mayb=
e-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sig=
n-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 =
-fPIC  -MD -MQ 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o' -MF 'lib/76b5a35@@xe_o=
a@sha/xe_xe_oa.c.o.d' -o 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o' -c ../lib/xe=
/xe_oa.c
  ../lib/xe/xe_oa.c: In function =E2=80=98load_metric_set_config=E2=80=99:
  ../lib/xe/xe_oa.c:682:9: error: cast to pointer from integer of different=
 size [-Werror=3Dint-to-pointer-cast]
    regs =3D (u8 *)config.regs_ptr;
           ^
  ../lib/xe/xe_oa.c:695:7: error: cast to pointer from integer of different=
 size [-Werror=3Dint-to-pointer-cast]
    free((void *)config.regs_ptr);
         ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1719610644:step_script
  section_start:1719610644:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719610644:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/60509150):
  [56/1073] Linking target lib/libi915_perf.so.1.5.
  [57/1073] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf=
.so.1.5.symbols'.
  [58/1073] Compiling C object 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o'.
  FAILED: lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@xe_oa@sha -Ilib -I../lib -I../=
include -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscal=
ls -I. -I../ -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -W=
all -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config=
.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement =
-Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations=
 -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wneste=
d-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow=
 -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uni=
nitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-com=
pare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dad=
dress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC  =
-MD -MQ 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o' -MF 'lib/76b5a35@@xe_oa@sha/x=
e_xe_oa.c.o.d' -o 'lib/76b5a35@@xe_oa@sha/xe_xe_oa.c.o' -c ../lib/xe/xe_oa.c
  ../lib/xe/xe_oa.c: In function =E2=80=98load_metric_set_config=E2=80=99:
  ../lib/xe/xe_oa.c:682:9: error: cast to pointer from integer of different=
 size [-Werror=3Dint-to-pointer-cast]
    regs =3D (u8 *)config.regs_ptr;
           ^
  ../lib/xe/xe_oa.c:695:7: error: cast to pointer from integer of different=
 size [-Werror=3Dint-to-pointer-cast]
    free((void *)config.regs_ptr);
         ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1719610650:step_script
  section_start:1719610650:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719610651:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1213077
