Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41714C5321E
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 22:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57510E11B;
	Fri, 23 Aug 2024 22:05:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37E910E11B;
 Fri, 23 Aug 2024 22:05:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_kunit=3A_Remove_hard-co?=
 =?utf-8?q?ded_test_list_from_xe=5Flive=5Fktest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Aug 2024 22:05:42 -0000
Message-ID: <172445074273.748054.18138008195857944733@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
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

Series: kunit: Remove hard-coded test list from xe_live_ktest
URL   : https://patchwork.freedesktop.org/series/137735/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256590 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62678117):
  431/435 assembler test/rnde-intsrc              OK       0.02 s 
  432/435 assembler test/rndz                     OK       0.02 s 
  433/435 assembler test/lzd                      OK       0.02 s 
  434/435 assembler test/not                      OK       0.02 s 
  435/435 assembler test/immediate                OK       0.01 s 
  
  Ok:                  430
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1724450659:step_script
  section_start:1724450659:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724450659:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62678116):
  431/435 assembler test/rnde-intsrc              OK       0.02 s 
  432/435 assembler test/rndz                     OK       0.02 s 
  433/435 assembler test/lzd                      OK       0.02 s 
  434/435 assembler test/not                      OK       0.02 s 
  435/435 assembler test/immediate                OK       0.02 s 
  
  Ok:                  430
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1724450644:step_script
  section_start:1724450644:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724450644:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256590
