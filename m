Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF79C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 19:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332010E4B8;
	Fri, 23 Aug 2024 19:59:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7B10E4B8;
 Fri, 23 Aug 2024 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_runner/settings=3A_set_?=
 =?utf-8?q?PRUNE=5FKEEP=5FALL_as_default_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Aug 2024 19:59:45 -0000
Message-ID: <172444318515.747671.9732322262614556463@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
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

Series: runner/settings: set PRUNE_KEEP_ALL as default (rev2)
URL   : https://patchwork.freedesktop.org/series/135116/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256538 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62675372):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 468f88a1 as detached HEAD (ref is intel/IGTPW_11625)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1724442945:get_sources
  section_start:1724442945:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1724442945:step_script
  section_start:1724442945:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1724442947:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: container 370a508422ac66e06c0d2a9e0bae39b45491d09b51a6c351a001941fff31143c does not exist in database: no such container (exec.go:78:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256538
