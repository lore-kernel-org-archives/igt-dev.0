Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE2EC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 10:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7568910EBAE;
	Fri,  8 Mar 2024 10:18:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D40010F942;
 Fri,  8 Mar 2024 10:18:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Update_test_documentati?=
 =?utf-8?q?on_for_i915_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Mar 2024 10:18:02 -0000
Message-ID: <170989308205.612184.10711932412246858440@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Series: Update test documentation for i915 tests (rev2)
URL   : https://patchwork.freedesktop.org/series/130665/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1122740 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56037773):
  Checking out 9f92e761 as detached HEAD (ref is intel/IGTPW_10795)...
  Removing build/
  Removing installdir/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1709892879:get_sources
  section_start:1709892879:download_artifacts
  Downloading artifacts
  Downloading artifacts for build:tests-fedora (56037758)...
  Downloading artifacts from coordinator... ok        host=gitlab.freedesktop.org id=56037758 responseStatus=200 OK token=glcbt-64
  section_end:1709892889:download_artifacts
  section_start:1709892889:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
  section_end:1709892889:step_script
  section_start:1709892889:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1709892891:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176: image not known (docker.go:570:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1122740
