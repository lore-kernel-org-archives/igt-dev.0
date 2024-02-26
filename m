Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E20DC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 20:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36410E1C2;
	Mon, 26 Feb 2024 20:53:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3810E1C2;
 Mon, 26 Feb 2024 20:53:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_benchmarks/kms=5Ffb=5Fs?=
 =?utf-8?q?tress=3A_Add_command-line_options_to_change_the_planes_and_writeb?=
 =?utf-8?q?ack_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 20:53:57 -0000
Message-ID: <170898083796.318338.1124473186815883330@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
In-Reply-To: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
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

Series: benchmarks/kms_fb_stress: Add command-line options to change the pl=
anes and writeback formats
URL   : https://patchwork.freedesktop.org/series/130399/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1113455 f=
or the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/55524519):
                         =3D 0
  2 warnings generated.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/959] Generating version.h with a custom command.
  [2/213] Linking target benchmarks/gem_wsim.
  [3/213] Compiling C object 'benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_=
stress.c.o'.
  FAILED: benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stress.c.o=20
  clang -Ibenchmarks/cb1d2fd@@kms_fb_stress@exe -Ibenchmarks -I../benchmark=
s -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib=
 -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib=
-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/f=
reetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-at=
tribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-styl=
e-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes=
 -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arit=
h -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD =
-MQ 'benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stress.c.o' -MF 'benchmar=
ks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stress.c.o.d' -o 'benchmarks/cb1d2fd@@=
kms_fb_stress@exe/kms_fb_stress.c.o' -c ../benchmarks/kms_fb_stress.c
  ../benchmarks/kms_fb_stress.c:207:9: error: initializer element is not a =
compile-time constant
          .kms =3D default_kms,
                 ^~~~~~~~~~~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1708980416:step_script
  section_start:1708980416:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1708980418:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1113455
