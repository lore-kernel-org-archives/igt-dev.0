Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D65C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 18:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA2B1133B3;
	Tue, 30 Jan 2024 18:16:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04A1132E1;
 Tue, 30 Jan 2024 18:16:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_introduce_Xe_multigpu_a?=
 =?utf-8?q?nd_other_multi-GPU_helpers_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 30 Jan 2024 18:16:11 -0000
Message-ID: <170663857150.824492.660210442811896897@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
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

Series: introduce Xe multigpu and other multi-GPU helpers (rev5)
URL   : https://patchwork.freedesktop.org/series/129101/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1090898 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/54396491):
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 26e6b4cd as detached HEAD (ref is intel/IGTPW_10606)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1706638212:get_sources
  section_start:1706638212:step_script
  Executing "step_script" stage of the job script
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-26e6b4cdff2f39a622960e01005140fdedc8fa0d ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Head "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/manifests/commit-26e6b4cdff2f39a622960e01005140fdedc8fa0d": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-mips%3Apull&service=container_registry": context deadline exceeded (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)
  section_end:1706638227:step_script
  section_start:1706638227:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1706638228:cleanup_file_variables
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-26e6b4cdff2f39a622960e01005140fdedc8fa0d" with specified policies [if-not-present]: Error response from daemon: Head "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/manifests/commit-26e6b4cdff2f39a622960e01005140fdedc8fa0d": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-mips%3Apull&service=container_registry": context deadline exceeded (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1090898
