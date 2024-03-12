Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC59C54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DCE112D73;
	Tue, 12 Mar 2024 10:08:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066A112D77;
 Tue, 12 Mar 2024 10:08:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/device=5Freset=3A?=
 =?utf-8?q?_Skip_if_no_drm_devices_are_preset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 Mar 2024 10:08:13 -0000
Message-ID: <171023809365.694325.3045360624522453988@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311162713.19137-1-nirmoy.das@intel.com>
In-Reply-To: <20240311162713.19137-1-nirmoy.das@intel.com>
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

Series: tests/device_reset: Skip if no drm devices are preset (rev2)
URL   : https://patchwork.freedesktop.org/series/130992/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1125656 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56172992):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98dremf=E2=80=99?
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237826:step_script
  section_start:1710237826:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237827:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/56172995):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98dremf=E2=80=99?
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237887:step_script
  section_start:1710237887:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237888:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/56172996):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98dremf=E2=80=99?
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    igt_require(drm_fd !=3D -1);
                ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
    if (!(expr)) igt_skip_check(#expr , NULL); \
          ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237864:step_script
  section_start:1710237864:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237865:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/56172987):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function)
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237811:step_script
  section_start:1710237811:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237812:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56172991):
  ninja: Entering directory `build'
  [1/1361] Generating version.h with a custom command.
  [2/1308] Linking target lib/libi915_perf.so.1.5.
  [3/1308] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.=
so.1.5.symbols'.
  [4/1308] Linking target tests/core_hotunplug.
  [5/1308] Generating core_hotunplug.testlist with a meson_exe.py custom co=
mmand.
  [6/1308] Compiling C object 'tests/59830eb@@device_reset@exe/device_reset=
.c.o'.
  FAILED: tests/59830eb@@device_reset@exe/device_reset.c.o=20
  clang -Itests/59830eb@@device_reset@exe -Itests -I../tests -I../include -=
I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/=
syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib6=
4/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/=
include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr=
/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D6=
4 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include co=
nfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statem=
ent -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissin=
g-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wp=
ointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized=
 -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-o=
f-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -W=
no-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplici=
t -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59=
830eb@@device_reset@exe/device_reset.c.o' -MF 'tests/59830eb@@device_reset@=
exe/device_reset.c.o.d' -o 'tests/59830eb@@device_reset@exe/device_reset.c.=
o' -c ../tests/device_reset.c
  ../tests/device_reset.c:201:14: error: use of undeclared identifier 'drm_=
fd'
          igt_require(drm_fd !=3D -1);
                      ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1710237831:step_script
  section_start:1710237831:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237832:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/56172990):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function)
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237816:step_script
  section_start:1710237816:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237817:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56172988):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function)
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237816:step_script
  section_start:1710237816:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237817:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/56172989):
  ../tests/device_reset.c: In function =E2=80=98init_device_fds=E2=80=99:
  ../tests/device_reset.c:201:14: error: =E2=80=98drm_fd=E2=80=99 undeclare=
d (first use in this function)
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ../tests/device_reset.c:201:14: note: each undeclared identifier is repor=
ted only once for each function it appears in
    201 |  igt_require(drm_fd !=3D -1);
        |              ^~~~~~
  ../lib/igt_core.h:1006:8: note: in definition of macro =E2=80=98igt_requi=
re=E2=80=99
   1006 |  if (!(expr)) igt_skip_check(#expr , NULL); \
        |        ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1710237848:step_script
  section_start:1710237848:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1710237849:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1125656
