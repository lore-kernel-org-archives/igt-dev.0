Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9923DC0218D
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 22:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E63210E9E9;
	Thu, 30 Jan 2025 22:15:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0E310E9E9;
 Thu, 30 Jan 2025 22:15:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_single_engine_busyn?=
 =?utf-8?q?ess_stats_in_GPUTOP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jan 2025 22:15:03 -0000
Message-ID: <173827530303.2996634.6658075557139178702@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130183909.725791-1-soham.purkait@intel.com>
In-Reply-To: <20250130183909.725791-1-soham.purkait@intel.com>
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

Series: Add single engine busyness stats in GPUTOP (rev2)
URL   : https://patchwork.freedesktop.org/series/143086/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1355457 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/70295794):
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
             ^~~~~~~~~~~~~~~
             igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99; did you mean =E2=80=98perf_event_open=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
     engine->busy.config =3D xe_perf_event_config(card_fd, "engine-active-t=
icks")
                           ^~~~~~~~~~~~~~~~~~~~
                           perf_event_open
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275126:step_script
  section_start:1738275126:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275127:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/70295797):
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
             ^~~~~~~~~~~~~~~
             igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99; did you mean =E2=80=98perf_event_open=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
     engine->busy.config =3D xe_perf_event_config(card_fd, "engine-active-t=
icks")
                           ^~~~~~~~~~~~~~~~~~~~
                           perf_event_open
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275148:step_script
  section_start:1738275148:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275150:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/70295796):
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
             ^~~~~~~~~~~~~~~
             igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99; did you mean =E2=80=98perf_event_open=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
     engine->busy.config =3D xe_perf_event_config(card_fd, "engine-active-t=
icks")
                           ^~~~~~~~~~~~~~~~~~~~
                           perf_event_open
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275152:step_script
  section_start:1738275152:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275153:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/70295798):
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
             ^~~~~~~~~~~~~~~
             igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99; did you mean =E2=80=98perf_event_open=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
     engine->busy.config =3D xe_perf_event_config(card_fd, "engine-active-t=
icks")
                           ^~~~~~~~~~~~~~~~~~~~
                           perf_event_open
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275162:step_script
  section_start:1738275162:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275163:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/70295795):
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
             ^~~~~~~~~~~~~~~
             igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99; did you mean =E2=80=98perf_event_open=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
     engine->busy.config =3D xe_perf_event_config(card_fd, "engine-active-t=
icks")
                           ^~~~~~~~~~~~~~~~~~~~
                           perf_event_open
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275001:step_script
  section_start:1738275001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275001:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/70295789):
  cc -Itools/f9d35d4@@gputop@exe -Itools -I../tools -I../include -I../inclu=
de/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr=
/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -p=
ipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -=
g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast=
 -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlo=
gical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretu=
rn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-a=
rith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunuse=
d -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -=
Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type=
-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=
=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conver=
sion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces =
-Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werr=
or=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builti=
n-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'to=
ols/f9d35d4@@gputop@exe/gputop.c.o' -MF 'tools/f9d35d4@@gputop@exe/gputop.c=
.o.d' -o 'tools/f9d35d4@@gputop@exe/gputop.c.o' -c ../tools/gputop.c
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    430 |  format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(dev=
ice)),
        |           ^~~~~~~~~~~~~~~
        |           igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    678 |   engine->busy.config =3D xe_perf_event_config(card_fd, "engine-a=
ctive-ticks")
        |                         ^~~~~~~~~~~~~~~~~~~~
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275040:step_script
  section_start:1738275040:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275041:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/70295793):
                          ^
  ../tools/gputop.c:638:8: note: initialize the variable 'd' to silence thi=
s warning
          DIR *d;
                ^
                 =3D NULL
  ../tools/gputop.c:651:19: warning: variable 'engines' is uninitialized wh=
en used here [-Wuninitialized]
                  return clean_up(engines);
                                  ^~~~~~~
  ../tools/gputop.c:636:25: note: initialize the variable 'engines' to sile=
nce this warning
          struct engines *engines;
                                 ^
                                  =3D NULL
  2 warnings and 2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1738275049:step_script
  section_start:1738275049:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275050:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/70295792):
  cc -Itools/f9d35d4@@gputop@exe -Itools -I../tools -I../include -I../inclu=
de/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr=
/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inc=
lude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -=
Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include confi=
g.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement=
 -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnest=
ed-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshado=
w -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-un=
initialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address=
-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter =
-Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpli=
cit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-c=
ast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoi=
nter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dt=
rigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D=
_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tools/f9d35d4@@gputop@exe/gputop.=
c.o' -MF 'tools/f9d35d4@@gputop@exe/gputop.c.o.d' -o 'tools/f9d35d4@@gputop=
@exe/gputop.c.o' -c ../tools/gputop.c
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    430 |  format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(dev=
ice)),
        |           ^~~~~~~~~~~~~~~
        |           igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    678 |   engine->busy.config =3D xe_perf_event_config(card_fd, "engine-a=
ctive-ticks")
        |                         ^~~~~~~~~~~~~~~~~~~~
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275032:step_script
  section_start:1738275032:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275033:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/70295790):
  cc -Itools/f9d35d4@@gputop@exe -Itools -I../tools -I../include -I../inclu=
de/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -Ili=
b -I../lib -I../lib/stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/us=
r/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/us=
r/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/=
include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -fdiag=
nostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -=
Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURC=
E=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimpl=
icit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-sty=
le-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototype=
s -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-mis=
sing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -W=
no-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -=
Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-s=
elf -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -=
Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -We=
rror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dw=
rite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=
=3D1 -pthread -MD -MQ 'tools/f9d35d4@@gputop@exe/gputop.c.o' -MF 'tools/f9d=
35d4@@gputop@exe/gputop.c.o.d' -o 'tools/f9d35d4@@gputop@exe/gputop.c.o' -c=
 ../tools/gputop.c
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    430 |  format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(dev=
ice)),
        |           ^~~~~~~~~~~~~~~
        |           igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    678 |   engine->busy.config =3D xe_perf_event_config(card_fd, "engine-a=
ctive-ticks")
        |                         ^~~~~~~~~~~~~~~~~~~~
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275034:step_script
  section_start:1738275034:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275035:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/70295791):
  cc -Itools/tools@@gputop@exe -Itools -I../tools -I../include -I../include=
/drm-uapi -I../include/drm-uapi-experimental -I../include/linux-uapi -Ilib =
-I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/incl=
ude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/i=
nclude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inclu=
de/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pip=
e -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g =
-D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -=
Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogi=
cal-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn=
 -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ari=
th -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused =
-Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wn=
o-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-l=
imits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3D=
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversio=
n -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -We=
rror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'too=
ls/tools@@gputop@exe/gputop.c.o' -MF 'tools/tools@@gputop@exe/gputop.c.o.d'=
 -o 'tools/tools@@gputop@exe/gputop.c.o' -c ../tools/gputop.c
  ../tools/gputop.c: In function =E2=80=98pmu_format_shift=E2=80=99:
  ../tools/gputop.c:430:11: error: implicit declaration of function =E2=80=
=98igt_perf_format=E2=80=99; did you mean =E2=80=98igt_perf_open=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]
    430 |  format =3D igt_perf_format(xe_perf_device(xe, device, sizeof(dev=
ice)),
        |           ^~~~~~~~~~~~~~~
        |           igt_perf_open
  ../tools/gputop.c:430:11: warning: nested extern declaration of =E2=80=98=
igt_perf_format=E2=80=99 [-Wnested-externs]
  ../tools/gputop.c: In function =E2=80=98discover_engines=E2=80=99:
  ../tools/gputop.c:678:25: error: implicit declaration of function =E2=80=
=98xe_perf_event_config=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    678 |   engine->busy.config =3D xe_perf_event_config(card_fd, "engine-a=
ctive-ticks")
        |                         ^~~~~~~~~~~~~~~~~~~~
  ../tools/gputop.c:678:25: warning: nested extern declaration of =E2=80=98=
xe_perf_event_config=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738275023:step_script
  section_start:1738275023:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738275024:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1355457
