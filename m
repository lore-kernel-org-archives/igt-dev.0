Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E7C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 04:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C2D10ECD5;
	Wed, 27 Mar 2024 04:23:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4EF10EBCF;
 Wed, 27 Mar 2024 04:23:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/amdgpu=3A_add_gem?=
 =?utf-8?q?_create_fuzzing_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Mar 2024 04:23:09 -0000
Message-ID: <171151338918.1055089.5201835795219108265@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327040055.457898-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240327040055.457898-1-vitaly.prosyak@amd.com>
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

Series: tests/amdgpu: add gem create fuzzing test
URL   : https://patchwork.freedesktop.org/series/131671/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1138541 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56843465):
  422/426 assembler test/rnde-intsrc              OK       0.01 s 
  423/426 assembler test/rndz                     OK       0.01 s 
  424/426 assembler test/lzd                      OK       0.01 s 
  425/426 assembler test/not                      OK       0.01 s 
  426/426 assembler test/immediate                OK       0.01 s 
  
  Ok:                  421
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1711513143:step_script
  section_start:1711513143:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711513144:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56843466):
  422/426 assembler test/rnde-intsrc              OK       0.01 s 
  423/426 assembler test/rndz                     OK       0.01 s 
  424/426 assembler test/lzd                      OK       0.01 s 
  425/426 assembler test/not                      OK       0.01 s 
  426/426 assembler test/immediate                OK       0.01 s 
  
  Ok:                  421
  Expected Fail:         4
  Fail:                  1
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1711513161:step_script
  section_start:1711513161:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1711513161:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1138541
