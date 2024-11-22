Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061AD78767
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72710EB3D;
	Fri, 22 Nov 2024 10:09:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551D10EB3D;
 Fri, 22 Nov 2024 10:09:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_intel=3A_igt=5Fdraw_and?=
 =?utf-8?q?_intel=5Fbufops_improvements_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 10:09:46 -0000
Message-ID: <173227018695.1655454.405316092850016092@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
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

Series: intel: igt_draw and intel_bufops improvements (rev4)
URL   : https://patchwork.freedesktop.org/series/139556/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1315210 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67034488):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 6461f3f4 as detached HEAD (ref is intel/IGTPW_12173)...
  Removing build/
  Removing installdir/
  
  Skipping Git submodules setup
  section_end:1732269930:get_sources
  section_start:1732269930:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-6461f3f41c804bd83e7a16f646cea2438bfad178 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  section_end:1732269933:step_script
  section_start:1732269933:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732269935:cleanup_file_variables
  ERROR: Job failed: exit code 137
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/67034487):
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 6461f3f4 as detached HEAD (ref is intel/IGTPW_12173)...
  Removing build/
  Removing installdir/
  
  Skipping Git submodules setup
  section_end:1732269925:get_sources
  section_start:1732269925:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf:commit-6461f3f41c804bd83e7a16f646cea2438bfad178 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  Checking if the user of the pipeline is allowed...
  section_end:1732269932:step_script
  section_start:1732269932:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1732269933:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1315210
