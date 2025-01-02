Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD4E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 04:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2911610E199;
	Thu,  2 Jan 2025 04:35:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487710E199;
 Thu,  2 Jan 2025 04:35:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Inject_errors_during_xe?=
 =?utf-8?q?=5Fguc=5Fct=5Fsend=5Frecv_=26_xe=5Fguc=5Fmmio=5Fsend=5Frecv_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Jan 2025 04:35:25 -0000
Message-ID: <173579252558.1910232.8687536103967966277@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230090210.17621-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20241230090210.17621-1-satyanarayana.k.v.p@intel.com>
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

Series: Inject errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv (rev2)
URL   : https://patchwork.freedesktop.org/series/143054/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1338101 for the overview.

test:verify-blacklists has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/68745396):
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing meson-test-list.txt
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1735792144:get_sources
  section_start:1735792144:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (68745382)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=68745382 responseStatus=200 OK token=glcbt-64
  section_end:1735792163:download_artifacts
  section_start:1735792163:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora:commit-14d546e49011de95895107e10dfea34c2a58a8a1 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-fedora@sha256:17d64607d998df2bf29a56b88922d3a598e6f1daa3b51ece2a892c2f293daf83 ...
  section_end:1735792167:step_script
  section_start:1735792167:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1735792168:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:4b3054d89ef79f9be95501786fbbbe22857d02c867fff99693808cd80909939f: image not known (docker.go:650:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1338101
