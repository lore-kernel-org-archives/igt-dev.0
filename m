Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E09ED2FFFF
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 12:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101BF10E8FB;
	Fri, 18 Oct 2024 12:16:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48AD10E8FB;
 Fri, 18 Oct 2024 12:16:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/kms=5Fproperties?=
 =?utf-8?q?=3A_rework_immutability_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Oct 2024 12:16:16 -0000
Message-ID: <172925377692.1281967.1529615205515048760@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
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

Series: tests/kms_properties: rework immutability checks (rev2)
URL   : https://patchwork.freedesktop.org/series/138114/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1292840 for the overview.

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/65284355):
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out f7eae05d as detached HEAD (ref is intel/IGTPW_11936)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
  
  Skipping Git submodules setup
  section_end:1729253314:get_sources
  section_start:1729253314:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-f7eae05ddfe8770be21cc55fd2f5e56e5dc02bb6 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh
  section_end:1729253335:step_script
  section_start:1729253335:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1729253336:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1292840
