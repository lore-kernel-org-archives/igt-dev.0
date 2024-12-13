Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C64E77180
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 16:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5310F0A0;
	Fri, 13 Dec 2024 16:53:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4A810F0A0;
 Fri, 13 Dec 2024 16:53:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/chamelium/kms=5Fc?=
 =?utf-8?q?hamelium=5Fedid=3A_Limit_the_number_of_EDIDs_tested_to_prevent_CI?=
 =?utf-8?q?_timeout=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 16:53:09 -0000
Message-ID: <173410878950.2184382.11977069409687717834@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213095432.2323965-1-pranay.samala@intel.com>
In-Reply-To: <20241213095432.2323965-1-pranay.samala@intel.com>
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

Series: tests/chamelium/kms_chamelium_edid: Limit the number of EDIDs tested to prevent CI timeout.
URL   : https://patchwork.freedesktop.org/series/142542/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1329406 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/68176499):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 85cf021d as detached HEAD (ref is intel/IGTPW_12313)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1734108513:get_sources
  section_start:1734108513:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-85cf021d67c5f7d53662b08ff24901cb8ec8d768 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1734108516:step_script
  section_start:1734108516:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1734108518:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8: image not known (docker.go:650:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1329406
