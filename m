Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2321CC3600C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 10:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DF610E0BA;
	Tue, 17 Sep 2024 10:56:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD8D10E0BA;
 Tue, 17 Sep 2024 10:56:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_series_starting_with_?=
 =?utf-8?q?=5Bi-g-t=2C1/2=5D_lib/igt=5Fkms=3A_Add_a_debug_log_for_invalid_pi?=
 =?utf-8?q?pe/output_combo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Sep 2024 10:56:51 -0000
Message-ID: <172657061149.1021318.4073471027258967058@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
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

Series: series starting with [i-g-t,1/2] lib/igt_kms: Add a debug log for invalid pipe/output combo
URL   : https://patchwork.freedesktop.org/series/138757/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1272643 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/63693447):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 09a087a0 as detached HEAD (ref is intel/IGTPW_11749)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1726570471:get_sources
  section_start:1726570471:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-09a087a0caac3f121c4bbd2c8ebb2ea1971c4f1c with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  section_end:1726570475:step_script
  section_start:1726570475:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1726570476:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: image not known (docker.go:652:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1272643
