Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B96C3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF4910E94C;
	Thu, 18 Jul 2024 14:42:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186EE10E94C;
 Thu, 18 Jul 2024 14:42:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fplane=5Fsca?=
 =?utf-8?q?ling=3A_Improvise_the_scaling_BW_issues=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Jul 2024 14:42:02 -0000
Message-ID: <172131372209.286319.1918692730885286522@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
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

Series: tests/kms_plane_scaling: Improvise the scaling BW issues. (rev7)
URL   : https://patchwork.freedesktop.org/series/135806/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1227306 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/61213699):
  section_start:1721313353:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out e5ed90b8 as detached HEAD (ref is intel/IGTPW_11429)...
  
  Skipping Git submodules setup
  section_end:1721313390:get_sources
  section_start:1721313390:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-e5ed90b82bdff6c328c1790b4e8e483b4ab8dc67 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd18b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1721313396:step_script
  section_start:1721313396:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721313397:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a808525defcb8bbb774078: image not known (docker.go:652:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1227306
