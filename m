Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570C3CE7A9C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 21:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075BF10E8DE;
	Thu,  5 Sep 2024 21:04:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FF910E8DE;
 Thu,  5 Sep 2024 21:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_coverage_for_GPU_d?=
 =?utf-8?q?ebug_support_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christoph Manszewski" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Sep 2024 21:04:49 -0000
Message-ID: <172557028906.952289.1689198109678713129@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

Series: Test coverage for GPU debug support (rev6)
URL   : https://patchwork.freedesktop.org/series/136623/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1265472 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63236149):
  Message: WARNING: leg command not found, disabling overlay; try : apt-get install peg
  Configuring defs.rst using configuration
  Program rst2man-3 found: NO
  Program rst2man found: NO
  Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
  Dependency gtk-doc found: NO (tried pkgconfig and cmake)
  Program sphinx-build skipped: feature sphinx disabled
  Program rst2html-3 found: NO
  Program rst2html found: NO
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:38:9: ERROR:  Unknown variable "intel_xe_eudebug_progs".
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1725569831:step_script
  section_start:1725569831:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1725569832:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1265472
