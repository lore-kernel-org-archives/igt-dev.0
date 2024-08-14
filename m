Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006ABC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 16:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968F210E4E4;
	Wed, 14 Aug 2024 16:55:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD310E4E4;
 Wed, 14 Aug 2024 16:55:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Introduce_memory_mappin?=
 =?utf-8?q?g_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Aug 2024 16:55:20 -0000
Message-ID: <172365452032.633514.15457687182710751098@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814132404.18392-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20240814132404.18392-1-krzysztof.niemiec@intel.com>
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

Series: Introduce memory mapping tests
URL   : https://patchwork.freedesktop.org/series/137303/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1249059 f=
or the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/62257266):
  FAILED: tests/59830eb@@gem_mmap_offset@exe/intel_gem_mmap_offset.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/59830eb@@gem_mmap_offset@exe -It=
ests -I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi =
-Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/us=
r/include/glib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/i=
nclude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include=
/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/includ=
e/arm-linux-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnos=
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
830eb@@gem_mmap_offset@exe/intel_gem_mmap_offset.c.o' -MF 'tests/59830eb@@g=
em_mmap_offset@exe/intel_gem_mmap_offset.c.o.d' -o 'tests/59830eb@@gem_mmap=
_offset@exe/intel_gem_mmap_offset.c.o' -c ../tests/intel/gem_mmap_offset.c
  ../tests/intel/gem_mmap_offset.c: In function =E2=80=98__test_mmap_unmap=
=E2=80=99:
  ../tests/intel/gem_mmap_offset.c:1037:15: error: cast to pointer from int=
eger of different size [-Werror=3Dint-to-pointer-cast]
     errp =3D mmap((void *)map_addr,
                 ^
  ../tests/intel/gem_mmap_offset.c:1045:5: error: cast to pointer from inte=
ger of different size [-Werror=3Dint-to-pointer-cast]
      *(volatile char *)(poke_addr - SZ_1K);
       ^
  ../tests/intel/gem_mmap_offset.c:1049:16: error: cast to pointer from int=
eger of different size [-Werror=3Dint-to-pointer-cast]
     err =3D munmap((void *)map_addr, map_size);
                  ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1723654248:step_script
  section_start:1723654248:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723654249:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/62257268):
  FAILED: tests/59830eb@@gem_mmap_offset@exe/intel_gem_mmap_offset.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/59830eb@@gem_mmap_offset@exe -Itests =
-I../tests -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib=
 -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/inc=
lude/glib-2.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pix=
man-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 =
-I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-lin=
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
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-=
pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Wer=
ror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -W=
error=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-=
calloc -D_LARGEFILE64_SOURCE=3D1 -pthread  -MD -MQ 'tests/59830eb@@gem_mmap=
_offset@exe/intel_gem_mmap_offset.c.o' -MF 'tests/59830eb@@gem_mmap_offset@=
exe/intel_gem_mmap_offset.c.o.d' -o 'tests/59830eb@@gem_mmap_offset@exe/int=
el_gem_mmap_offset.c.o' -c ../tests/intel/gem_mmap_offset.c
  ../tests/intel/gem_mmap_offset.c: In function =E2=80=98__test_mmap_unmap=
=E2=80=99:
  ../tests/intel/gem_mmap_offset.c:1037:15: error: cast to pointer from int=
eger of different size [-Werror=3Dint-to-pointer-cast]
     errp =3D mmap((void *)map_addr,
                 ^
  ../tests/intel/gem_mmap_offset.c:1045:5: error: cast to pointer from inte=
ger of different size [-Werror=3Dint-to-pointer-cast]
      *(volatile char *)(poke_addr - SZ_1K);
       ^
  ../tests/intel/gem_mmap_offset.c:1049:16: error: cast to pointer from int=
eger of different size [-Werror=3Dint-to-pointer-cast]
     err =3D munmap((void *)map_addr, map_size);
                  ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1723654263:step_script
  section_start:1723654263:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1723654264:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1249059
