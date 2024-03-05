Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3BC54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 18:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496CA10E2EC;
	Tue,  5 Mar 2024 18:55:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE07110FF22;
 Tue,  5 Mar 2024 18:55:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_revamp_big_joiner_test_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 18:55:23 -0000
Message-ID: <170966492384.524258.13374822096057511952@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305163607.688251-1-kunal1.joshi@intel.com>
In-Reply-To: <20240305163607.688251-1-kunal1.joshi@intel.com>
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

Series: revamp big joiner test (rev4)
URL   : https://patchwork.freedesktop.org/series/130572/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1120239 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/55893490):
  [1182/1787] Linking target tests/sysfs_timeslice_duration.
  [1183/1787] Generating sysfs_preempt_timeout.testlist with a meson_exe.py=
 custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1122] Generating version.h with a custom command.
  [2/606] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [3/606] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  cc -Itests/59830eb@@kms_big_joiner@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x=
86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uui=
d -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I=
/usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/=
valgrind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -p=
ipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -=
g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast=
 -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlo=
gical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretu=
rn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-a=
rith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunuse=
d -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -=
Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter =
-Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpli=
cit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werro=
r=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/5=
9830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -MF 'tests/59830eb@@km=
s_big_joiner@exe/intel_kms_big_joiner.c.o.d' -o 'tests/59830eb@@kms_big_joi=
ner@exe/intel_kms_big_joiner.c.o' -c ../tests/intel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1709664818:step_script
  section_start:1709664818:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664819:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/55893493):
  [2/475] Linking target lib/libi915_perf.so.1.5.
  [3/475] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/475] Linking target tests/core_hotunplug.
  [5/475] Linking target tests/gem_barrier_race.
  [6/475] Linking target tests/perf.
  [7/475] Linking target tests/sysfs_timeslice_duration.
  [8/475] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_big_joiner@exe -Itest=
s -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Il=
ib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/i=
nclude/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/includ=
e/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aar=
ch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-co=
lor=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -st=
d=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wba=
d-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallt=
hrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -=
Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definit=
ion -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninit=
ialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field=
-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-un=
used-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds =
-Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werro=
r=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-in=
t-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -=
Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -M=
D -MQ 'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -MF 'tes=
ts/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o.d' -o 'tests/59830e=
b@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -c ../tests/intel/kms_big_j=
oiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1709664853:step_script
  section_start:1709664853:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664854:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/55893492):
                   from ../tests/intel/kms_big_joiner.c:37:
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:283:13: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 6 =
has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
      igt_info("Number of combinations for %d outputs and %d pipes are %ld\=
n",
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         i+1, data.n_pipes, num_combinations);
                            ~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1247:62: note: in definition of macro =E2=80=98igt_info=
=E2=80=99
   #define igt_info(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO, f)
                                                                ^
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1709664836:step_script
  section_start:1709664836:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664837:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/55893494):
                   from ../tests/intel/kms_big_joiner.c:37:
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:283:13: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 6 =
has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
      igt_info("Number of combinations for %d outputs and %d pipes are %ld\=
n",
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         i+1, data.n_pipes, num_combinations);
                            ~~~~~~~~~~~~~~~~
  ../lib/igt_core.h:1247:62: note: in definition of macro =E2=80=98igt_info=
=E2=80=99
   #define igt_info(f...) igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO, f)
                                                                ^
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1709664870:step_script
  section_start:1709664870:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664871:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/55893485):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1123] Generating version.h with a custom command.
  [2/605] Generating sysfs_preempt_timeout.testlist with a meson_exe.py cus=
tom command.
  [3/605] Linking target tests/sysfs_timeslice_duration.
  [4/605] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [5/605] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  cc -Itests/59830eb@@kms_big_joiner@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D6=
4 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include co=
nfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statem=
ent -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarat=
ions -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wn=
ested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wsh=
adow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe=
-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addr=
ess-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramet=
er -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dim=
plicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -We=
rror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werr=
or=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwri=
te-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/=
59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -MF 'tests/59830eb@@k=
ms_big_joiner@exe/intel_kms_big_joiner.c.o.d' -o 'tests/59830eb@@kms_big_jo=
iner@exe/intel_kms_big_joiner.c.o' -c ../tests/intel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    315 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1709664822:step_script
  section_start:1709664822:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664823:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/55893489):
  [1/1122] Generating version.h with a custom command.
  [2/605] Generating sysfs_preempt_timeout.testlist with a meson_exe.py cus=
tom command.
  [3/605] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [4/605] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  clang -Itests/59830eb@@kms_big_joiner@exe -Itests -I../tests -I../include=
 -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stub=
s/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/u=
sr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition=
 -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitial=
ized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addre=
ss-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramete=
r -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimp=
licit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Wer=
ror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werro=
r=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrit=
e-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/5=
9830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -MF 'tests/59830eb@@km=
s_big_joiner@exe/intel_kms_big_joiner.c.o.d' -o 'tests/59830eb@@kms_big_joi=
ner@exe/intel_kms_big_joiner.c.o' -c ../tests/intel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c:315:3: error: expected '}'
          }
           ^
  ../tests/intel/kms_big_joiner.c:227:1: note: to match this '{'
  {
  ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1709664839:step_script
  section_start:1709664839:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664840:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/55893488):
  [1145/1627] Compiling C object 'tests/59830eb@@kms_busy@exe/intel_kms_bus=
y.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/995] Generating version.h with a custom command.
  [2/484] Generating sysfs_preempt_timeout.testlist with a meson_exe.py cus=
tom command.
  [3/484] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [4/484] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  cc -Itests/59830eb@@kms_big_joiner@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics=
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
error=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=
=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dse=
quence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mallo=
c -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@kms_big_joiner@exe/i=
ntel_kms_big_joiner.c.o' -MF 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o.d' -o 'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner=
.c.o' -c ../tests/intel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    315 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1709664837:step_script
  section_start:1709664837:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664838:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/55893486):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1124] Generating version.h with a custom command.
  [2/608] Generating sysfs_preempt_timeout.testlist with a meson_exe.py cus=
tom command.
  [3/608] Linking target tests/sysfs_timeslice_duration.
  [4/608] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [5/608] Compiling C object 'tests/59830eb@@kms_big_joiner@exe/intel_kms_b=
ig_joiner.c.o'.
  FAILED: tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  cc -Itests/59830eb@@kms_big_joiner@exe -Itests -I../tests -I../include -I=
../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/s=
yscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/incl=
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
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointe=
r-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3D=
pointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -pthread -MD -MQ 'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.=
c.o' -MF 'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o.d' -o =
'tests/59830eb@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -c ../tests/in=
tel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    315 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1709664839:step_script
  section_start:1709664839:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664840:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/55893487):
  ninja: Entering directory `build'
  [1/1123] Generating version.h with a custom command.
  [2/608] Generating sysfs_heartbeat_interval.testlist with a meson_exe.py =
custom command.
  [3/608] Generating sysfs_preempt_timeout.testlist with a meson_exe.py cus=
tom command.
  [4/608] Linking target tests/sysfs_timeslice_duration.
  [5/608] Generating sysfs_timeslice_duration.testlist with a meson_exe.py =
custom command.
  [6/608] Compiling C object 'tests/tests@@kms_big_joiner@exe/intel_kms_big=
_joiner.c.o'.
  FAILED: tests/tests@@kms_big_joiner@exe/intel_kms_big_joiner.c.o=20
  cc -Itests/tests@@kms_big_joiner@exe -Itests -I../tests -I../include -I..=
/include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/sys=
calls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/g=
lib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inc=
lude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/in=
clude/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 =
-Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include conf=
ig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statemen=
t -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declaratio=
ns -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnes=
ted-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshad=
ow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-u=
ninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addres=
s-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter=
 -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpl=
icit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werr=
or=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/t=
ests@@kms_big_joiner@exe/intel_kms_big_joiner.c.o' -MF 'tests/tests@@kms_bi=
g_joiner@exe/intel_kms_big_joiner.c.o.d' -o 'tests/tests@@kms_big_joiner@ex=
e/intel_kms_big_joiner.c.o' -c ../tests/intel/kms_big_joiner.c
  ../tests/intel/kms_big_joiner.c: In function =E2=80=98__igt_unique____rea=
l_main226=E2=80=99:
  ../tests/intel/kms_big_joiner.c:315:2: error: expected declaration or sta=
tement at end of input
    315 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1709664833:step_script
  section_start:1709664833:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709664836:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1120239
