Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AE3C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 12:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C03E11305A;
	Tue, 30 Jan 2024 12:14:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D611305A;
 Tue, 30 Jan 2024 12:14:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fdraw=3A_Fix_t?=
 =?utf-8?q?he_usage_of_FB_width_=26_height_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 30 Jan 2024 12:14:02 -0000
Message-ID: <170661684248.823563.1388778849867536191@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_draw: Fix the usage of FB width & height (rev2)
URL   : https://patchwork.freedesktop.org/series/129294/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1090615 for the overview.

test:list-undocumented-tests has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54381216):
  Checking out 9a9353c4 as detached HEAD (ref is intel/IGTPW_10604)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1706616531:get_sources
  section_start:1706616531:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (54381203)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=54381203 responseStatus=200 OK token=64_HszzB
  section_end:1706616542:download_artifacts
  section_start:1706616542:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-9a9353c4c08fdfd8af2774b28204fda5919f956f with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1706616544:step_script
  section_start:1706616544:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706616545:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1090615
