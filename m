Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45F4C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 17:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875B210EB6D;
	Thu,  4 Jul 2024 17:57:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B9A10EB81;
 Thu,  4 Jul 2024 17:57:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fatomic=5Ftr?=
 =?utf-8?q?ansition=3A_Reducing_debug_loglevel_dynamically?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 17:57:58 -0000
Message-ID: <172011587848.29788.6302834191982837022@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704094911.679105-1-pranay.samala@intel.com>
In-Reply-To: <20240704094911.679105-1-pranay.samala@intel.com>
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

Series: tests/kms_atomic_transition: Reducing debug loglevel dynamically
URL   : https://patchwork.freedesktop.org/series/135754/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1217275 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60703488):
  cc -Itests/59830eb@@kms_atomic_transition@exe -Itests -I../tests -I../inc=
lude -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/=
stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/us=
r/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/incl=
ude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/li=
bdrm -I/usr/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/i=
nclude/valgrind -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dal=
ways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu1=
1 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-functi=
on-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=
=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initi=
alizers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-=
pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Wer=
ror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -W=
error=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-=
calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms_atom=
ic_transition@exe/kms_atomic_transition.c.o' -MF 'tests/59830eb@@kms_atomic=
_transition@exe/kms_atomic_transition.c.o.d' -o 'tests/59830eb@@kms_atomic_=
transition@exe/kms_atomic_transition.c.o' -c ../tests/kms_atomic_transition=
.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99; did you mean =E2=80=98igt_se=
t_module_param=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_set_debug_value(data.drm_fd, 13);
     ^~~~~~~~~~~~~~~~~~~
     igt_set_module_param
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_debug_reset(data.drm_fd);
     ^~~~~~~~~~~~~~~
     igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115748:step_script
  section_start:1720115748:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115748:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60703491):
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@kms_atomic_transition@exe=
 -Itests -I../tests -I../include -I../include/drm-uapi -I../include/linux-u=
api -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -=
I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr=
/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/inclu=
de/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/incl=
ude/aarch64-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnos=
tics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wex=
tra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
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
c -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59=
830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -MF 'tests/5983=
0eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o.d' -o 'tests/59830=
eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -c ../tests/kms_at=
omic_transition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99; did you mean =E2=80=98igt_se=
t_module_param=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_set_debug_value(data.drm_fd, 13);
     ^~~~~~~~~~~~~~~~~~~
     igt_set_module_param
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_debug_reset(data.drm_fd);
     ^~~~~~~~~~~~~~~
     igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115755:step_script
  section_start:1720115755:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115756:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/60703490):
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@kms_atomic_transition@e=
xe -Itests -I../tests -I../include -I../include/drm-uapi -I../include/linux=
-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo=
 -I/usr/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/=
include/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-l=
imits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3D=
array-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversio=
n -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -We=
rror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tes=
ts/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -MF 'tests=
/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o.d' -o 'tests/=
59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -c ../tests/k=
ms_atomic_transition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99; did you mean =E2=80=98igt_se=
t_module_param=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_set_debug_value(data.drm_fd, 13);
     ^~~~~~~~~~~~~~~~~~~
     igt_set_module_param
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_debug_reset(data.drm_fd);
     ^~~~~~~~~~~~~~~
     igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115766:step_script
  section_start:1720115766:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115767:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/60703492):
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@kms_atomic_transition@exe -I=
tests -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi=
 -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/u=
sr/include/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/inclu=
de/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mi=
ps-linux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-colo=
r=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Din=
t-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull=
 -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-poi=
nt -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-bui=
ltin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@kms=
_atomic_transition@exe/kms_atomic_transition.c.o' -MF 'tests/59830eb@@kms_a=
tomic_transition@exe/kms_atomic_transition.c.o.d' -o 'tests/59830eb@@kms_at=
omic_transition@exe/kms_atomic_transition.c.o' -c ../tests/kms_atomic_trans=
ition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99; did you mean =E2=80=98igt_se=
t_module_param=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_set_debug_value(data.drm_fd, 13);
     ^~~~~~~~~~~~~~~~~~~
     igt_set_module_param
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     igt_debug_reset(data.drm_fd);
     ^~~~~~~~~~~~~~~
     igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115759:step_script
  section_start:1720115759:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115759:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/60703483):
  FAILED: tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.=
o=20
  cc -Itests/59830eb@@kms_atomic_transition@exe -Itests -I../tests -I../inc=
lude -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/=
stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/us=
r/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -=
I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau =
-I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_B=
ITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inc=
lude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after=
-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-d=
eclarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototy=
pes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-dec=
ls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wn=
o-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -W=
no-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-=
parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werr=
or=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to=
-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -We=
rror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -=
Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin=
-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_atom=
ic_transition@exe/kms_atomic_transition.c.o' -MF 'tests/59830eb@@kms_atomic=
_transition@exe/kms_atomic_transition.c.o.d' -o 'tests/59830eb@@kms_atomic_=
transition@exe/kms_atomic_transition.c.o' -c ../tests/kms_atomic_transition=
.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
   1180 |   igt_set_debug_value(data.drm_fd, 13);
        |   ^~~~~~~~~~~~~~~~~~~
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   1264 |   igt_debug_reset(data.drm_fd);
        |   ^~~~~~~~~~~~~~~
        |   igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115723:step_script
  section_start:1720115723:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115724:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/60703487):
  FAILED: tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.=
o=20
  clang -Itests/59830eb@@kms_atomic_transition@exe -Itests -I../tests -I../=
include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../l=
ib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype=
2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouve=
au -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET=
_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -i=
nclude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-aft=
er-statement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute=
 -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-defin=
ition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wunin=
itialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-=
address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-par=
ameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-p=
ointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werr=
or=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -We=
rror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-c=
alloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_atomic=
_transition@exe/kms_atomic_transition.c.o' -MF 'tests/59830eb@@kms_atomic_t=
ransition@exe/kms_atomic_transition.c.o.d' -o 'tests/59830eb@@kms_atomic_tr=
ansition@exe/kms_atomic_transition.c.o' -c ../tests/kms_atomic_transition.c
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction 'igt_set_debug_value' is invalid in C99 [-Werror,-Wimplicit-functio=
n-declaration]
                  igt_set_debug_value(data.drm_fd, 13);
                  ^
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction 'igt_debug_reset' is invalid in C99 [-Werror,-Wimplicit-function-de=
claration]
                  igt_debug_reset(data.drm_fd);
                  ^
  ../tests/kms_atomic_transition.c:1264:3: note: did you mean 'igt_spin_res=
et'?
  ../lib/igt_dummyload.h:122:6: note: 'igt_spin_reset' declared here
  void igt_spin_reset(igt_spin_t *spin);
       ^
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1720115732:step_script
  section_start:1720115732:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115732:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/60703486):
  FAILED: tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.=
o=20
  cc -Itests/59830eb@@kms_atomic_transition@exe -Itests -I../tests -I../inc=
lude -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/=
stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/us=
r/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -=
I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiag=
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
=3D1 -pthread -MD -MQ 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_=
transition.c.o' -MF 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_tr=
ansition.c.o.d' -o 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_tra=
nsition.c.o' -c ../tests/kms_atomic_transition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
   1180 |   igt_set_debug_value(data.drm_fd, 13);
        |   ^~~~~~~~~~~~~~~~~~~
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   1264 |   igt_debug_reset(data.drm_fd);
        |   ^~~~~~~~~~~~~~~
        |   igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115749:step_script
  section_start:1720115749:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115750:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60703484):
  FAILED: tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.=
o=20
  cc -Itests/59830eb@@kms_atomic_transition@exe -Itests -I../tests -I../inc=
lude -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/=
stubs/syscalls -I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/u=
sr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -=
I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/us=
r/include/libdrm/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno=
-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -We=
rror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-co=
nversion -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-bra=
ces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -=
Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-bu=
iltin-malloc -fno-builtin-calloc -D_LARGEFILE64_SOURCE=3D1 -pthread -MD -MQ=
 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -MF '=
tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o.d' -o 't=
ests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o' -c ../te=
sts/kms_atomic_transition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
   1180 |   igt_set_debug_value(data.drm_fd, 13);
        |   ^~~~~~~~~~~~~~~~~~~
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   1264 |   igt_debug_reset(data.drm_fd);
        |   ^~~~~~~~~~~~~~~
        |   igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115749:step_script
  section_start:1720115749:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115749:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/60703485):
  FAILED: tests/tests@@kms_atomic_transition@exe/kms_atomic_transition.c.o =

  cc -Itests/tests@@kms_atomic_transition@exe -Itests -I../tests -I../inclu=
de -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/st=
ubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/=
lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BIT=
S=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inclu=
de config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-s=
tatement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-dec=
larations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototype=
s -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls=
 -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-=
maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno=
-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-pa=
rameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=
=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-p=
ointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werr=
or=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -We=
rror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-c=
alloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/tests@@kms_atomic_=
transition@exe/kms_atomic_transition.c.o' -MF 'tests/tests@@kms_atomic_tran=
sition@exe/kms_atomic_transition.c.o.d' -o 'tests/tests@@kms_atomic_transit=
ion@exe/kms_atomic_transition.c.o' -c ../tests/kms_atomic_transition.c
  ../tests/kms_atomic_transition.c: In function =E2=80=98__igt_unique____re=
al_main1123=E2=80=99:
  ../tests/kms_atomic_transition.c:1180:3: error: implicit declaration of f=
unction =E2=80=98igt_set_debug_value=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
   1180 |   igt_set_debug_value(data.drm_fd, 13);
        |   ^~~~~~~~~~~~~~~~~~~
  ../tests/kms_atomic_transition.c:1180:3: warning: nested extern declarati=
on of =E2=80=98igt_set_debug_value=E2=80=99 [-Wnested-externs]
  ../tests/kms_atomic_transition.c:1264:3: error: implicit declaration of f=
unction =E2=80=98igt_debug_reset=E2=80=99; did you mean =E2=80=98igt_spin_r=
eset=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   1264 |   igt_debug_reset(data.drm_fd);
        |   ^~~~~~~~~~~~~~~
        |   igt_spin_reset
  ../tests/kms_atomic_transition.c:1264:3: warning: nested extern declarati=
on of =E2=80=98igt_debug_reset=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1720115757:step_script
  section_start:1720115757:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720115758:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1217275
