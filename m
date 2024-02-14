Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32742C48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 15:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9829610E3A3;
	Wed, 14 Feb 2024 15:30:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9C10E3A3;
 Wed, 14 Feb 2024 15:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/amdgpu/amd=5Fmult?=
 =?utf-8?q?ipipe=5Fmodeset=3A_Run_mode_set_and_display_enable_for_multidispl?=
 =?utf-8?q?ays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Feb 2024 15:30:05 -0000
Message-ID: <170792460592.1238604.14941515920039059172@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214134441.27951-1-hersenxs.wu@amd.com>
In-Reply-To: <20240214134441.27951-1-hersenxs.wu@amd.com>
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

Series: tests/amdgpu/amd_multipipe_modeset: Run mode set and display enable for multidisplays
URL   : https://patchwork.freedesktop.org/series/129899/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1103156 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55039139):
  Removing build/
  Removing installdir/
  Removing lib/i915/perf-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1707924521:get_sources
  section_start:1707924521:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (55039124)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=55039124 responseStatus=200 OK token=64_cDGug
  section_end:1707924528:download_artifacts
  section_start:1707924528:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1707924538:step_script
  section_start:1707924538:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1707924539:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: container create: creating container storage: parsing named reference "594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176": invalid repository name (594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176), cannot specify 64-byte hexadecimal strings (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1103156
