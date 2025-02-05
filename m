Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0FDC02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 13:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D158F10E161;
	Wed,  5 Feb 2025 13:04:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53710E161;
 Wed,  5 Feb 2025 13:04:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Prepare_lib/intel=5Fcom?=
 =?utf-8?q?pute_for_SVM/system_allocator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Feb 2025 13:04:27 -0000
Message-ID: <173876066771.1442162.8442878202724380891@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205101748.1117809-1-francois.dugast@intel.com>
In-Reply-To: <20250205101748.1117809-1-francois.dugast@intel.com>
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

Series: Prepare lib/intel_compute for SVM/system allocator
URL   : https://patchwork.freedesktop.org/series/144360/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1358438 f=
or the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/70559146):
  ninja: Entering directory `build'
  [1/1359] Generating version.h with a custom command.
  [2/1357] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_c=
ompute.c.o'.
  FAILED: lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-intel_compute_c@sta -=
Ilib -I../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-expe=
rimental -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/i=
nclude/cairo -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.=
0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freety=
pe2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nou=
veau -I/usr/include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/incl=
ude/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -=
D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wfo=
rmat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wm=
issing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-ex=
terns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Ws=
trict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare=
 -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddres=
s -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Di=
nt-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissin=
g-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-t=
ype -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -f=
no-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthr=
ead '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/bu=
ilds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_compute"'  -MD -=
MQ 'lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o' -MF 'lib/76b5a3=
5@@igt-intel_compute_c@sta/intel_compute.c.o.d' -o 'lib/76b5a35@@igt-intel_=
compute_c@sta/intel_compute.c.o' -c ../lib/intel_compute.c
  ../lib/intel_compute.c: In function =E2=80=98xe2lpg_compute_exec=E2=80=99:
  ../lib/intel_compute.c:1682:16: error: cast to pointer from integer of di=
fferent size [-Werror=3Dint-to-pointer-cast]
     input_data =3D (float *) user->input_addr;
                  ^
  ../lib/intel_compute.c:1692:17: error: cast to pointer from integer of di=
fferent size [-Werror=3Dint-to-pointer-cast]
     output_data =3D (float *) user->output_addr;
                   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738760265:step_script
  section_start:1738760265:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738760266:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/70559148):
  [1/1371] Generating version.h with a custom command.
  [2/1369] Linking static target lib/libigt-intel_batchbuffer_c.a.
  [3/1369] Compiling C object 'lib/76b5a35@@igt-intel_compute_c@sta/intel_c=
ompute.c.o'.
  FAILED: lib/76b5a35@@igt-intel_compute_c@sta/intel_compute.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-intel_compute_c@sta -Ilib =
-I../lib -I../include -I../include/drm-uapi -I../include/drm-uapi-experimen=
tal -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/includ=
e/cairo -I/usr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include =
-I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr=
/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/us=
r/include/mips-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiag=
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
oc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATA=
DIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt=
-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"intel_compute"'  -MD -MQ 'lib/76b5a35=
@@igt-intel_compute_c@sta/intel_compute.c.o' -MF 'lib/76b5a35@@igt-intel_co=
mpute_c@sta/intel_compute.c.o.d' -o 'lib/76b5a35@@igt-intel_compute_c@sta/i=
ntel_compute.c.o' -c ../lib/intel_compute.c
  ../lib/intel_compute.c: In function =E2=80=98xe2lpg_compute_exec=E2=80=99:
  ../lib/intel_compute.c:1682:16: error: cast to pointer from integer of di=
fferent size [-Werror=3Dint-to-pointer-cast]
     input_data =3D (float *) user->input_addr;
                  ^
  ../lib/intel_compute.c:1692:17: error: cast to pointer from integer of di=
fferent size [-Werror=3Dint-to-pointer-cast]
     output_data =3D (float *) user->output_addr;
                   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1738760262:step_script
  section_start:1738760262:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1738760262:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1358438
