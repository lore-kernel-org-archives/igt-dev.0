Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D7C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB25910E640;
	Wed, 31 Jul 2024 14:53:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1510E640;
 Wed, 31 Jul 2024 14:53:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/xe=5Fsysfs?=
 =?utf-8?q?=5Fpreempt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 31 Jul 2024 14:53:29 -0000
Message-ID: <172243760940.468187.14435356956313460692@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
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

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev4)
URL   : https://patchwork.freedesktop.org/series/136449/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1237760 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61728996):
    int engines_fd = -1, gt_fd = -1;
    ^~~
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: error: implicit declaration of function ‘openat’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: warning: nested extern declaration of ‘openat’ [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: note: each undeclared identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722437232:step_script
  section_start:1722437232:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722437232:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61728995):
    int engines_fd = -1, gt_fd = -1;
    ^~~
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: error: implicit declaration of function ‘openat’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: warning: nested extern declaration of ‘openat’ [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: note: each undeclared identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722437260:step_script
  section_start:1722437260:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722437262:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61728997):
    int engines_fd = -1, gt_fd = -1;
    ^~~
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: error: implicit declaration of function ‘openat’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                     ^~~~~~
                     popen
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:19: warning: nested extern declaration of ‘openat’ [-Wnested-externs]
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
        engines_fd = openat(gt_fd, "engines", O_RDONLY);
                                              ^~~~~~~~
                                              STA_RONLY
  ../tests/intel/xe_sysfs_preempt_timeout.c:207:44: note: each undeclared identifier is reported only once for each function it appears in
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1722437272:step_script
  section_start:1722437272:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1722437274:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1237760
