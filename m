Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E51C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1810E327;
	Fri, 17 Jan 2025 23:32:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1910E327;
 Fri, 17 Jan 2025 23:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Add_igt=5Frunner=27s_cm?=
 =?utf-8?q?dline_to_results?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 23:32:37 -0000
Message-ID: <173715675708.909766.12038094230318846743@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
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

Series: Add igt_runner's cmdline to results
URL   : https://patchwork.freedesktop.org/series/143699/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1347758 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69563458):
  439/443 assembler test/rnde-intsrc              OK       0.02 s 
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
  section_end:1737156736:step_script
  section_start:1737156736:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737156737:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69563457):
  439/443 assembler test/rnde-intsrc              OK       0.02 s 
  440/443 assembler test/rndz                     OK       0.02 s 
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
  section_end:1737156717:step_script
  section_start:1737156717:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737156718:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1347758
