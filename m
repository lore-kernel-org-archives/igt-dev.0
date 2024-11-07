Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70FED5AE6B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1A10E7AC;
	Thu,  7 Nov 2024 07:13:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8C510E7AC;
 Thu,  7 Nov 2024 07:13:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_igt-runner_fact_checkin?=
 =?utf-8?q?g_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 07 Nov 2024 07:13:45 -0000
Message-ID: <173096362569.1420466.13850817667044018789@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

Series: igt-runner fact checking (rev3)
URL   : https://patchwork.freedesktop.org/series/140841/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1305711 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66246967):
  437/441 assembler test/rnde-intsrc              OK       0.01 s 
  438/441 assembler test/rndz                     OK       0.01 s 
  439/441 assembler test/lzd                      OK       0.01 s 
  440/441 assembler test/not                      OK       0.02 s 
  441/441 assembler test/immediate                OK       0.01 s 
  
  Ok:                  436
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1730963455:step_script
  section_start:1730963455:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730963456:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66246968):
  437/441 assembler test/rnde-intsrc              OK       0.02 s 
  438/441 assembler test/rndz                     OK       0.02 s 
  439/441 assembler test/lzd                      OK       0.01 s 
  440/441 assembler test/not                      OK       0.02 s 
  441/441 assembler test/immediate                OK       0.01 s 
  
  Ok:                  436
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1730963481:step_script
  section_start:1730963481:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730963483:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66246966):
  27/31 lib i915_perf_data_alignment            OK       0.67 s 
  28/31 lib bad_subtest_type                    EXPECTEDFAIL 0.59 s 
  29/31 lib igt_no_subtest                      EXPECTEDFAIL 0.27 s 
  30/31 lib igt_simple_test_subtests            EXPECTEDFAIL 0.27 s 
  31/31 lib igt_timeout                         EXPECTEDFAIL 1.34 s 
  
  Ok:                   26
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1730963421:step_script
  section_start:1730963421:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1730963422:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1305711
