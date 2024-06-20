Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7D0C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 16:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977910EADF;
	Thu, 20 Jun 2024 16:12:53 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5E10EAE2;
 Thu, 20 Jun 2024 16:12:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_runner/settings=3A_set_?=
 =?utf-8?q?PRUNE=5FKEEP=5FALL_as_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 16:12:51 -0000
Message-ID: <171889997142.127624.68683028023073230@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240620130216.85074-1-kamil.konieczny@linux.intel.com>
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

Series: runner/settings: set PRUNE_KEEP_ALL as default
URL   : https://patchwork.freedesktop.org/series/135116/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1206188 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60149016):
  423/427 assembler test/rnde-intsrc              OK       0.02 s 
  424/427 assembler test/rndz                     OK       0.02 s 
  425/427 assembler test/lzd                      OK       0.01 s 
  426/427 assembler test/not                      OK       0.02 s 
  427/427 assembler test/immediate                OK       0.02 s 
  
  Ok:                  422
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1718899778:step_script
  section_start:1718899778:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718899779:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60149015):
  423/427 assembler test/rnde-intsrc              OK       0.02 s 
  424/427 assembler test/rndz                     OK       0.02 s 
  425/427 assembler test/lzd                      OK       0.02 s 
  426/427 assembler test/not                      OK       0.02 s 
  427/427 assembler test/immediate                OK       0.02 s 
  
  Ok:                  422
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1718899773:step_script
  section_start:1718899773:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1718899773:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1206188
