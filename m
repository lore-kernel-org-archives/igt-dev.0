Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E64CD5BA7
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 10:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6C310E849;
	Thu,  5 Sep 2024 10:44:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2937310E849;
 Thu,  5 Sep 2024 10:44:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_runner/executor=2Ec=3A_?=
 =?utf-8?q?Detect_tests_killed_by_a_signal_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Sep 2024 10:44:27 -0000
Message-ID: <172553306715.950377.8209433428500986740@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
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

Series: runner/executor.c: Detect tests killed by a signal (rev4)
URL   : https://patchwork.freedesktop.org/series/137879/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1263533 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/63089106):
  ../runner/executor.c: In function =E2=80=98monitor_output=E2=80=99:
  ../runner/executor.c:1516:34: error: implicit declaration of function =E2=
=80=98sigdescr_np=E2=80=99; did you mean =E2=80=98sigreturn=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ^~~~~~~~~~~
                                    sigreturn
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
      sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
                                                         ~^
                                                         %d
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ~~~~~~~~~~~~~~~~~~~   =20
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363901:step_script
  section_start:1725363901:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363902:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63089109):
  ../runner/executor.c: In function =E2=80=98monitor_output=E2=80=99:
  ../runner/executor.c:1516:34: error: implicit declaration of function =E2=
=80=98sigdescr_np=E2=80=99; did you mean =E2=80=98sigreturn=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ^~~~~~~~~~~
                                    sigreturn
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
      sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
                                                         ~^
                                                         %d
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ~~~~~~~~~~~~~~~~~~~   =20
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363881:step_script
  section_start:1725363881:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363882:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/63089108):
  ../runner/executor.c: In function =E2=80=98monitor_output=E2=80=99:
  ../runner/executor.c:1516:34: error: implicit declaration of function =E2=
=80=98sigdescr_np=E2=80=99; did you mean =E2=80=98sigreturn=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ^~~~~~~~~~~
                                    sigreturn
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
      sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
                                                         ~^
                                                         %d
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ~~~~~~~~~~~~~~~~~~~   =20
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363875:step_script
  section_start:1725363875:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363876:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/63089110):
  ../runner/executor.c: In function =E2=80=98monitor_output=E2=80=99:
  ../runner/executor.c:1516:34: error: implicit declaration of function =E2=
=80=98sigdescr_np=E2=80=99; did you mean =E2=80=98sigreturn=E2=80=99? [-Wer=
ror=3Dimplicit-function-declaration]
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ^~~~~~~~~~~
                                    sigreturn
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
      sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
                                                         ~^
                                                         %d
        strsignal(killed), -killed, sigdescr_np(killed));
                                    ~~~~~~~~~~~~~~~~~~~   =20
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363889:step_script
  section_start:1725363889:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363890:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/63089101):
        |                                  ^~~~~~~~~~~
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   1515 |    sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
        |                                                       ~^
        |                                                        |
        |                                                        char *
        |                                                       %d
   1516 |      strsignal(killed), -killed, sigdescr_np(killed));
        |                                  ~~~~~~~~~~~~~~~~~~~   =20
        |                                  |
        |                                  int
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363904:step_script
  section_start:1725363904:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363904:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/63089105):
  [2/68] Compiling C object 'runner/527aa9f@@igt_runner@sta/executor.c.o'.
  FAILED: runner/527aa9f@@igt_runner@sta/executor.c.o=20
  clang -Irunner/527aa9f@@igt_runner@sta -Irunner -I../runner -I../include =
-I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs=
/syscalls -I. -I../ -I/usr/include/json-c -I/usr/include/glib-2.0 -I/usr/li=
b64/glib-2.0/include -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition=
 -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitial=
ized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-addre=
ss-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-paramete=
r -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimp=
licit -Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer=
-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dp=
ointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=
=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-callo=
c -D_LARGEFILE64_SOURCE=3D1 -fPIC -MD -MQ 'runner/527aa9f@@igt_runner@sta/e=
xecutor.c.o' -MF 'runner/527aa9f@@igt_runner@sta/executor.c.o.d' -o 'runner=
/527aa9f@@igt_runner@sta/executor.c.o' -c ../runner/executor.c
  ../runner/executor.c:1516:34: error: implicit declaration of function 'si=
gdescr_np' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                          strsignal(killed), -killed, sigde=
scr_np(killed));
                                                                      ^
  ../runner/executor.c:1516:34: warning: format specifies type 'char *' but=
 the argument has type 'int' [-Wformat]
                                          strsignal(killed), -killed, sigde=
scr_np(killed));
                                                                      ^~~~~=
~~~~~~~~~~~~~~
  /usr/include/bits/stdio2.h:42:7: note: expanded from macro 'sprintf'
                             __VA_ARGS__)
                             ^~~~~~~~~~~
  1 warning and 1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1725363914:step_script
  section_start:1725363914:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363914:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/63089104):
        |                                  ^~~~~~~~~~~
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   1515 |    sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
        |                                                       ~^
        |                                                        |
        |                                                        char *
        |                                                       %d
   1516 |      strsignal(killed), -killed, sigdescr_np(killed));
        |                                  ~~~~~~~~~~~~~~~~~~~   =20
        |                                  |
        |                                  int
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363897:step_script
  section_start:1725363897:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363898:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/63089102):
        |                                  ^~~~~~~~~~~
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   1515 |    sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
        |                                                       ~^
        |                                                        |
        |                                                        char *
        |                                                       %d
   1516 |      strsignal(killed), -killed, sigdescr_np(killed));
        |                                  ~~~~~~~~~~~~~~~~~~~   =20
        |                                  |
        |                                  int
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363899:step_script
  section_start:1725363899:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363899:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/63089103):
        |                                  ^~~~~~~~~~~
  ../runner/executor.c:1516:34: warning: nested extern declaration of =E2=
=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
  ../runner/executor.c:1515:56: warning: format =E2=80=98%s=E2=80=99 expect=
s argument of type =E2=80=98char *=E2=80=99, but argument 5 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   1515 |    sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
        |                                                       ~^
        |                                                        |
        |                                                        char *
        |                                                       %d
   1516 |      strsignal(killed), -killed, sigdescr_np(killed));
        |                                  ~~~~~~~~~~~~~~~~~~~   =20
        |                                  |
        |                                  int
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1725363901:step_script
  section_start:1725363901:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725363902:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1263533
