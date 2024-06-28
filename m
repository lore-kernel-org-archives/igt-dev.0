Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27524C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 12:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5B10EC36;
	Fri, 28 Jun 2024 12:46:44 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBED10EC36;
 Fri, 28 Jun 2024 12:46:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_vmwgfx_prime_tests_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jun 2024 12:46:43 -0000
Message-ID: <171957880362.185636.4536402604886033371@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
In-Reply-To: <20240627195615.3695848-1-zack.rusin@broadcom.com>
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

== Series Details ==

Series: Add vmwgfx prime tests (rev2)
URL   : https://patchwork.freedesktop.org/series/133402/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1212583 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482518):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578469:step_script
  section_start:1719578469:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578470:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482521):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578465:step_script
  section_start:1719578465:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578466:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482520):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578486:step_script
  section_start:1719578486:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578487:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482522):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
     igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                            ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578491:step_script
  section_start:1719578491:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578492:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482513):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578498:step_script
  section_start:1719578498:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578498:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482517):
  ../lib/igt_core.h:676:13: note: expanded from macro 'igt_assert'
          do { if (!(expr)) \
                     ^
  ../tests/vmwgfx/vmw_prime.c:327:41: error: reference to overloaded function could not be resolved; did you mean to call it?
                  igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                                                        ^~~~~~~~~
  ../lib/igt_core.h:676:13: note: expanded from macro 'igt_assert'
          do { if (!(expr)) \
                     ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: error: use of undeclared identifier 'pattern'
                  igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
                                         ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1719578493:step_script
  section_start:1719578493:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578493:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482516):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578468:step_script
  section_start:1719578468:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578469:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482514):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578466:step_script
  section_start:1719578466:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578467:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60482515):
  ../tests/vmwgfx/vmw_prime.c: In function ‘draw_triangle_3d’:
  ../tests/vmwgfx/vmw_prime.c:327:26: error: ‘pattern’ undeclared (first use in this function)
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ../tests/vmwgfx/vmw_prime.c:327:26: note: each undeclared identifier is reported only once for each function it appears in
    327 |   igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
        |                          ^~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    676 |  do { if (!(expr)) \
        |             ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1719578493:step_script
  section_start:1719578493:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719578494:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1212583
