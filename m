Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CBDC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A0910E491;
	Fri, 29 Mar 2024 05:43:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F0810EF8C;
 Fri, 29 Mar 2024 05:41:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Update_compression_in_c?=
 =?utf-8?q?onfig_based_on_platform_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Mar 2024 05:41:20 -0000
Message-ID: <171169088026.1066424.8957705608811470026@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1711733054.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1711733054.git.akshata.jahagirdar@intel.com>
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

Series: Update compression in config based on platform (rev2)
URL   : https://patchwork.freedesktop.org/series/131802/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1140422 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56943254):
  [1257/1796] Compiling C object 'tests/59830eb@@kms_psr2_sf@exe/intel_kms_=
psr2_sf.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1101] Generating version.h with a custom command.
  [2/541] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  cc -Itests/59830eb@@xe_ccs@exe -Itests -I../tests -I../include -I../inclu=
de/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls =
-I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-li=
nux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr=
/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind=
 -I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_F=
ILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU=
_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecla=
ration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op=
 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmis=
sing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wr=
edundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-c=
lobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poin=
ter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unu=
sed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Wer=
ror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmiss=
ing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn=
-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings =
-fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/59830eb@@x=
e_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=
.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -c ../tests/intel/xe_cc=
s.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
     if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690486:step_script
  section_start:1711690486:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690487:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/56943257):
  ninja: Entering directory `build'
  [1/721] Generating version.h with a custom command.
  [2/417] Linking target tests/kms_frontbuffer_tracking.
  [3/417] Linking target tests/kms_psr2_sf.
  [4/417] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/59830eb@@xe_ccs@exe -Itests -I../t=
ests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../=
lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/g=
lib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman=
-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/=
usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-lin=
ux-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dal=
ways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu1=
1 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-functi=
on-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=
=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initi=
alizers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ =
'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@xe_ccs@exe=
/intel_xe_ccs.c.o.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -c ../=
tests/intel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
     if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690486:step_script
  section_start:1711690486:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690487:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/56943256):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/719] Generating version.h with a custom command.
  [2/411] Linking target tests/kms_frontbuffer_tracking.
  [3/411] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@xe_ccs@exe -Itests -I..=
/tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I.=
./lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include=
/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pi=
xman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16=
 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-lin=
ux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-colo=
r=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD=
 -MQ 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@xe_cc=
s@exe/intel_xe_ccs.c.o.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -=
c ../tests/intel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
     if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690471:step_script
  section_start:1711690471:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690471:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/56943258):
  [5/427] Linking target tests/gem_barrier_race.
  [6/427] Linking target tests/perf.
  [7/427] Linking target tests/kms_frontbuffer_tracking.
  [8/427] Linking target tests/kms_psr2_sf.
  [9/427] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@xe_ccs@exe -Itests -I../test=
s -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib=
 -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib=
-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/=
usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/in=
clude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I=
/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pip=
e -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g =
-D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -=
Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogi=
cal-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn=
 -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ari=
th -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused =
-Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wn=
o-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -W=
no-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplici=
t -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/5=
9830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@xe_ccs@exe/intel_x=
e_ccs.c.o.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -c ../tests/in=
tel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
     if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690491:step_script
  section_start:1711690491:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690492:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/56943249):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1102] Generating version.h with a custom command.
  [2/532] Generating kms_psr2_sf.testlist with a meson_exe.py custom comman=
d.
  [3/532] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  cc -Itests/59830eb@@xe_ccs@exe -Itests -I../tests -I../include -I../inclu=
de/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls =
-I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.=
0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/=
valgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall =
-Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -=
D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wfo=
rmat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wm=
issing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-ex=
terns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Ws=
trict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uniniti=
alized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-p=
acked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-=
unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -=
Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dm=
issing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dret=
urn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strin=
gs -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@=
@xe_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c=
.o.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -c ../tests/intel/xe_=
ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
    748 |   if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(x=
e))
        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690456:step_script
  section_start:1711690456:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690456:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56943253):
  ../tests/intel/xe_ccs.c:782:31: error: implicit declaration of function '=
blt_platform_has_flat_ccs_enabled' is invalid in C99 [-Werror,-Wimplicit-fu=
nction-declaration]
                  if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_ena=
bled(xe))
                                              ^
  ../tests/intel/xe_ccs.c:793:31: error: implicit declaration of function '=
blt_platform_has_flat_ccs_enabled' is invalid in C99 [-Werror,-Wimplicit-fu=
nction-declaration]
                  if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_ena=
bled(xe))
                                              ^
  ../tests/intel/xe_ccs.c:806:31: error: implicit declaration of function '=
blt_platform_has_flat_ccs_enabled' is invalid in C99 [-Werror,-Wimplicit-fu=
nction-declaration]
                  if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_ena=
bled(xe))
                                              ^
  ../tests/intel/xe_ccs.c:818:31: error: implicit declaration of function '=
blt_platform_has_flat_ccs_enabled' is invalid in C99 [-Werror,-Wimplicit-fu=
nction-declaration]
                  if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_ena=
bled(xe))
                                              ^
  1 warning and 7 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1711690478:step_script
  section_start:1711690478:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690479:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/56943252):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/972] Generating version.h with a custom command.
  [2/405] Generating kms_frontbuffer_tracking.testlist with a meson_exe.py =
custom command.
  [3/405] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  cc -Itests/59830eb@@xe_ccs@exe -Itests -I../tests -I../include -I../inclu=
de/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls =
-I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.=
0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libdrm -I/usr/include/valgrind -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-com=
pare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Dad=
dress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=
=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dno=
nnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequenc=
e-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fn=
o-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c=
.o' -MF 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o.d' -o 'tests/59830eb@@x=
e_ccs@exe/intel_xe_ccs.c.o' -c ../tests/intel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
    748 |   if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(x=
e))
        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690490:step_script
  section_start:1711690490:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690490:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56943250):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1102] Generating version.h with a custom command.
  [2/533] Generating kms_psr2_sf.testlist with a meson_exe.py custom comman=
d.
  [3/533] Compiling C object 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o=20
  cc -Itests/59830eb@@xe_ccs@exe -Itests -I../tests -I../include -I../inclu=
de/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls =
-I. -I../ -I../lib/stubs/libunwind -I/usr/include/cairo -I/usr/include/glib=
-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/f=
reetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/valgrind -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -W=
no-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bo=
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthrea=
d -MD -MQ 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/59830eb@@=
xe_ccs@exe/intel_xe_ccs.c.o.d' -o 'tests/59830eb@@xe_ccs@exe/intel_xe_ccs.c=
.o' -c ../tests/intel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
    748 |   if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(x=
e))
        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690462:step_script
  section_start:1711690462:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690463:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56943251):
  [1272/1802] Linking target tests/xe_compute.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1103] Generating version.h with a custom command.
  [2/532] Compiling C object 'tests/tests@@xe_ccs@exe/intel_xe_ccs.c.o'.
  FAILED: tests/tests@@xe_ccs@exe/intel_xe_ccs.c.o=20
  cc -Itests/tests@@xe_ccs@exe -Itests -I../tests -I../include -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/va=
lgrind -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -W=
invalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_=
FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wform=
at=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmis=
sing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-exte=
rns -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstr=
ict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitial=
ized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-pac=
ked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmis=
sing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretur=
n-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings=
 -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/tests@@xe=
_ccs@exe/intel_xe_ccs.c.o' -MF 'tests/tests@@xe_ccs@exe/intel_xe_ccs.c.o.d'=
 -o 'tests/tests@@xe_ccs@exe/intel_xe_ccs.c.o' -c ../tests/intel/xe_ccs.c
  ../tests/intel/xe_ccs.c: In function =E2=80=98__igt_unique____real_main71=
3=E2=80=99:
  ../tests/intel/xe_ccs.c:748:31: error: implicit declaration of function =
=E2=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
    748 |   if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(x=
e))
        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../tests/intel/xe_ccs.c:748:31: warning: nested extern declaration of =E2=
=80=98blt_platform_has_flat_ccs_enabled=E2=80=99 [-Wnested-externs]
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1711690490:step_script
  section_start:1711690490:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711690491:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1140422
