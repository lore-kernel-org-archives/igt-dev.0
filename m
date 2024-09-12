Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB258EE645B
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 08:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148F210EAF8;
	Thu, 12 Sep 2024 08:07:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B210EAF8;
 Thu, 12 Sep 2024 08:07:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_add_test_to_validate_fa?=
 =?utf-8?q?llback_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 08:07:45 -0000
Message-ID: <172612846536.990424.7401083750745872263@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

Series: add test to validate fallback (rev5)
URL   : https://patchwork.freedesktop.org/series/134660/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1269704 f=
or the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63511666):
  [293/1520] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_mmd_shared_c@s=
ta/amdgpu_amd_mmd_shared.c.o'.
  [294/1520] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio=
.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1232] Generating version.h with a custom command.
  [2/1228] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
  FAILED: lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Ilib/76b5a35@@igt-igt_kms_c@sta -Ilib -I.=
./lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/s=
tubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr=
/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/incl=
ude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/li=
bdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux-gnu -I/usr/=
include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GN=
U_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecl=
aration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-o=
p -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmi=
ssing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -W=
redundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-=
clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poi=
nter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -We=
rror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to=
-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraph=
s -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEF=
ILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-=
tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMA=
IN=3D"igt_kms"'  -MD -MQ 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o' -MF '=
lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o.d' -o 'lib/76b5a35@@igt-igt_kms_=
c@sta/igt_kms.c.o' -c ../lib/igt_kms.c
  ../lib/igt_kms.c: In function =E2=80=98igt_get_dp_link_param_set_for_outp=
ut=E2=80=99:
  ../lib/igt_kms.c:6785:29: error: implicit declaration of function =E2=80=
=98isdigit=E2=80=99 [-Werror=3Dimplicit-function-declaration]
     while (param_ptr > buf && isdigit(*param_ptr))
                               ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726128082:step_script
  section_start:1726128082:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726128084:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63511665):
  [288/1520] Compiling C object 'lib/76b5a35@@igt-igt_frame_c@sta/igt_frame=
.c.o'.
  [289/1520] Compiling C object 'lib/76b5a35@@igt-igt_audio_c@sta/igt_audio=
.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1237] Generating version.h with a custom command.
  [2/1233] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
  FAILED: lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Ilib/76b5a35@@igt-igt_kms_c@sta -Ilib -=
I../lib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib=
/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/u=
sr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixman-1 -I/usr/=
include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/includ=
e/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux-gnueabihf -=
I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pi=
pe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g=
 -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast =
-Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlog=
ical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused=
 -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -W=
no-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_=
LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/ig=
t-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LO=
G_DOMAIN=3D"igt_kms"'  -MD -MQ 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'=
 -MF 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o.d' -o 'lib/76b5a35@@igt-ig=
t_kms_c@sta/igt_kms.c.o' -c ../lib/igt_kms.c
  ../lib/igt_kms.c: In function =E2=80=98igt_get_dp_link_param_set_for_outp=
ut=E2=80=99:
  ../lib/igt_kms.c:6785:29: error: implicit declaration of function =E2=80=
=98isdigit=E2=80=99 [-Werror=3Dimplicit-function-declaration]
     while (param_ptr > buf && isdigit(*param_ptr))
                               ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726128076:step_script
  section_start:1726128076:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726128077:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/63511667):
  [287/1520] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_ip_blocks_c@st=
a/amdgpu_amd_ip_blocks.c.o'.
  [288/1520] Compiling C object 'lib/76b5a35@@igt-amdgpu_amd_mmd_shared_c@s=
ta/amdgpu_amd_mmd_shared.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1238] Generating version.h with a custom command.
  [2/1234] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
  FAILED: lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Ilib/76b5a35@@igt-igt_kms_c@sta -Ilib -I../l=
ib -I../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/stub=
s/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uu=
id -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -=
I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/usr/include/v=
algrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFS=
ET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE =
-include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-a=
fter-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissi=
ng-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pro=
totypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant=
-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered=
 -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arit=
h -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resu=
lt -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Din=
it-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOU=
RCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '=
-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt=
_kms"'  -MD -MQ 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o' -MF 'lib/76b5a=
35@@igt-igt_kms_c@sta/igt_kms.c.o.d' -o 'lib/76b5a35@@igt-igt_kms_c@sta/igt=
_kms.c.o' -c ../lib/igt_kms.c
  ../lib/igt_kms.c: In function =E2=80=98igt_get_dp_link_param_set_for_outp=
ut=E2=80=99:
  ../lib/igt_kms.c:6785:29: error: implicit declaration of function =E2=80=
=98isdigit=E2=80=99 [-Werror=3Dimplicit-function-declaration]
     while (param_ptr > buf && isdigit(*param_ptr))
                               ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726128076:step_script
  section_start:1726128076:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726128077:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/63511664):
  [282/650] Generating i915-perf-metrics-cflgt2 with a custom command.
  [283/650] Generating i915-perf-metrics-cflgt3 with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/375] Generating version.h with a custom command.
  [2/369] Compiling C object 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o'.
  FAILED: lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o=20
  cc -Ilib/76b5a35@@igt-igt_kms_c@sta -Ilib -I../lib -I../include -I../incl=
ude/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I..=
/lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvali=
d-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIF=
Y_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2=
 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-f=
ormat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -W=
old-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pr=
ototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -=
Wno-missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-ty=
pe-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werro=
r=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conve=
rsion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces=
 -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Wer=
ror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-built=
in-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -fPIC -pthread '-DI=
GT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx=
-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"igt_kms"'  -MD -MQ 'lib/76b5a3=
5@@igt-igt_kms_c@sta/igt_kms.c.o' -MF 'lib/76b5a35@@igt-igt_kms_c@sta/igt_k=
ms.c.o.d' -o 'lib/76b5a35@@igt-igt_kms_c@sta/igt_kms.c.o' -c ../lib/igt_kms=
.c
  ../lib/igt_kms.c: In function =E2=80=98igt_get_dp_link_param_set_for_outp=
ut=E2=80=99:
  ../lib/igt_kms.c:6785:29: error: implicit declaration of function =E2=80=
=98isdigit=E2=80=99 [-Werror=3Dimplicit-function-declaration]
     while (param_ptr > buf && isdigit(*param_ptr))
                               ^~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1726128071:step_script
  section_start:1726128071:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726128072:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1269704
