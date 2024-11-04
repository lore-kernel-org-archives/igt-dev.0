Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69085D1BDD0
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 17:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2284D10E297;
	Mon,  4 Nov 2024 17:19:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FF10E093;
 Mon,  4 Nov 2024 17:19:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fexec?=
 =?utf-8?q?=5Freset=3A_Add_mocs_reset_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 17:19:18 -0000
Message-ID: <173074075897.1400537.4116385602692519086@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101154432.3679065-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20241101154432.3679065-1-janga.rahul.kumar@intel.com>
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

Series: tests/intel/xe_exec_reset: Add mocs reset test (rev2)
URL   : https://patchwork.freedesktop.org/series/140575/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1303803 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66078285):
  ../tests/intel/xe_exec_reset.c: In function ‘gt_mocs_reset’:
  ../tests/intel/xe_exec_reset.c:741:42: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/intel/xe_exec_reset.c:741:42: note: each undeclared identifier is reported only once for each function it appears in
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1730740351:step_script
  section_start:1730740351:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730740351:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66078284):
  ../tests/intel/xe_exec_reset.c: In function ‘gt_mocs_reset’:
  ../tests/intel/xe_exec_reset.c:741:42: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/intel/xe_exec_reset.c:741:42: note: each undeclared identifier is reported only once for each function it appears in
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1730740374:step_script
  section_start:1730740374:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730740375:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66078286):
  ../tests/intel/xe_exec_reset.c: In function ‘gt_mocs_reset’:
  ../tests/intel/xe_exec_reset.c:741:42: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ../tests/intel/xe_exec_reset.c:741:42: note: each undeclared identifier is reported only once for each function it appears in
    igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
                                            ^~~~~~~~
  ../lib/igt_core.h:676:13: note: in definition of macro ‘igt_assert’
    do { if (!(expr)) \
               ^~~~
  ninja: build stopped: subcommand failed.
  section_end:1730740363:step_script
  section_start:1730740363:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730740364:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1303803
