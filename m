Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39FED59D7F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 23:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628D910E101;
	Mon, 25 Nov 2024 23:25:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED52D10E0E0;
 Mon, 25 Nov 2024 23:25:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_CCS_hibernate_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 23:25:45 -0000
Message-ID: <173257714597.3040654.16830227860040741641@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
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

Series: CCS hibernate test
URL   : https://patchwork.freedesktop.org/series/141760/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1317067 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67189032):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 392e13d5 as detached HEAD (ref is intel/IGTPW_12193)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1732576936:get_sources
  section_start:1732576936:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-392e13d5bb297e2e010846f61036e0c996a82461 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1732576938:step_script
  section_start:1732576938:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732576939:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c: image not known (docker.go:650:0s)

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67189031):
         popen
  ../tests/intel/kms_ccs.c:289:7: warning: nested extern declaration of ‘open’ [-Wnested-externs]
  ../tests/intel/kms_ccs.c:289:29: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    fd = open(SYS_POWER_STATE, O_RDONLY);
                               ^~~~~~~~
                               STA_RONLY
  ../tests/intel/kms_ccs.c:289:29: note: each undeclared identifier is reported only once for each function it appears in
  ../tests/intel/kms_ccs.c: In function ‘hibernate_system’:
  ../tests/intel/kms_ccs.c:324:29: error: ‘O_WRONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    fd = open(SYS_POWER_STATE, O_WRONLY);
                               ^~~~~~~~
                               STA_RONLY
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732576954:step_script
  section_start:1732576954:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732576955:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67189033):
         popen
  ../tests/intel/kms_ccs.c:289:7: warning: nested extern declaration of ‘open’ [-Wnested-externs]
  ../tests/intel/kms_ccs.c:289:29: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    fd = open(SYS_POWER_STATE, O_RDONLY);
                               ^~~~~~~~
                               STA_RONLY
  ../tests/intel/kms_ccs.c:289:29: note: each undeclared identifier is reported only once for each function it appears in
  ../tests/intel/kms_ccs.c: In function ‘hibernate_system’:
  ../tests/intel/kms_ccs.c:324:29: error: ‘O_WRONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
    fd = open(SYS_POWER_STATE, O_WRONLY);
                               ^~~~~~~~
                               STA_RONLY
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1732576977:step_script
  section_start:1732576977:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732576978:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1317067
