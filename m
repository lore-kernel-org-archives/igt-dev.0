Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0450C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E94F10E6C7;
	Mon, 25 Mar 2024 09:16:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625B10E6C7;
 Mon, 25 Mar 2024 09:16:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_meson=3A_Turn_on_few_wa?=
 =?utf-8?q?rns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Mar 2024 09:16:32 -0000
Message-ID: <171135819215.1035674.9425549463416959589@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325082422.691115-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240325082422.691115-1-bhanuprakash.modem@intel.com>
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

Series: meson: Turn on few warns
URL   : https://patchwork.freedesktop.org/series/131560/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1136404 f=
or the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/56732898):
  [55/1408] Compiling C object 'lib/76b5a35@@i915_perf@sha/i915_perf.c.o'.
  [56/1408] Linking target lib/libi915_perf.so.1.5.
  [57/1408] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf=
.so.1.5.symbols'.
  [58/1408] Compiling C object 'lib/tests/dc197ac@@igt_types@exe/igt_types.=
c.o'.
  FAILED: lib/tests/dc197ac@@igt_types@exe/igt_types.c.o=20
  clang -Ilib/tests/dc197ac@@igt_types@exe -Ilib/tests -I../lib/tests -I../=
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
rror=3Dtrigraphs -Werror=3Dunused-variable -Werror=3Dwrite-strings -fno-bui=
ltin-malloc -fno-builtin-calloc -pthread -MD -MQ 'lib/tests/dc197ac@@igt_ty=
pes@exe/igt_types.c.o' -MF 'lib/tests/dc197ac@@igt_types@exe/igt_types.c.o.=
d' -o 'lib/tests/dc197ac@@igt_types@exe/igt_types.c.o' -c ../lib/tests/igt_=
types.c
  ../lib/tests/igt_types.c:67:16: error: unused variable 'x' [-Werror,-Wunu=
sed-variable]
                  scoped_int_t(x);
                               ^
  ../lib/tests/igt_types.c:116:16: error: unused variable 'x' [-Werror,-Wun=
used-variable]
                  scoped_int_t(x);
                               ^
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1711357916:step_script
  section_start:1711357916:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711357916:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1136404
