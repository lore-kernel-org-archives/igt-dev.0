Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74D5C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 09:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FF710E520;
	Tue, 21 Jan 2025 09:18:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD7F10E51D;
 Tue, 21 Jan 2025 09:18:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Make_igt=5Ffacts=5Ftest?=
 =?utf-8?q?_noreturn_and_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jan 2025 09:18:57 -0000
Message-ID: <173745113763.2528870.10068986420789503642@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
In-Reply-To: <20250121063207.71737-1-pravalika.gurram@intel.com>
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

Series: Make igt_facts_test noreturn and cleanup
URL   : https://patchwork.freedesktop.org/series/143776/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1349299 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69671923):
  439/443 assembler test/rnde-intsrc              OK       0.01 s 
  440/443 assembler test/rndz                     OK       0.01 s 
  441/443 assembler test/lzd                      OK       0.01 s 
  442/443 assembler test/not                      OK       0.01 s 
  443/443 assembler test/immediate                OK       0.01 s 
  
  Ok:                  438
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1737450521:step_script
  section_start:1737450521:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737450529:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69672350):
  439/443 assembler test/rnde-intsrc              OK       0.02 s 
  440/443 assembler test/rndz                     OK       0.03 s 
  441/443 assembler test/lzd                      OK       0.02 s 
  442/443 assembler test/not                      OK       0.02 s 
  443/443 assembler test/immediate                OK       0.02 s 
  
  Ok:                  438
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1737451010:step_script
  section_start:1737451010:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737451011:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69671924):
  27/31 lib i915_perf_data_alignment            OK       0.53 s 
  28/31 lib bad_subtest_type                    EXPECTEDFAIL 0.48 s 
  29/31 lib igt_no_subtest                      EXPECTEDFAIL 0.24 s 
  30/31 lib igt_simple_test_subtests            EXPECTEDFAIL 0.24 s 
  31/31 lib igt_timeout                         EXPECTEDFAIL 1.21 s 
  
  Ok:                   26
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1737450451:step_script
  section_start:1737450451:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737450451:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1349299
