Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B5FCFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2510E295;
	Fri,  4 Oct 2024 10:33:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99A810E289;
 Fri,  4 Oct 2024 10:33:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests=3A_Update_asserti?=
 =?utf-8?q?on_in_invalid-wait-zero-handles?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 04 Oct 2024 10:33:57 -0000
Message-ID: <172803803782.1173197.197906502456203491@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002113418.24070-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20241002113418.24070-2-krzysztof.niemiec@intel.com>
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

Series: tests: Update assertion in invalid-wait-zero-handles
URL   : https://patchwork.freedesktop.org/series/139417/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1282371 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64529189):
  Running with gitlab-runner 17.4.0 (b92ee590)
    on fdo-equinix-m3l-32_16-23 Wf-ezYkxU, system ID: s_0bec02416a6c
  section_start:1727871833:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1: reading manifest commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64: manifest unknown: manifest unknown (manager.go:251:2s)
  section_end:1727871836:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1: reading manifest commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64: manifest unknown: manifest unknown (manager.go:251:2s)
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/64529190):
  Running with gitlab-runner 17.4.0 (b92ee590)
    on fdo-equinix-m3l-32_16-23 Wf-ezYkxU, system ID: s_0bec02416a6c
  section_start:1727871853:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1: reading manifest commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips: manifest unknown: manifest unknown (manager.go:251:2s)
  section_end:1727871856:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1: reading manifest commit-f4ee9f6711b4c6b6a6c329fcb8bc2b584a469df1 in registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips: manifest unknown: manifest unknown (manager.go:251:2s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1282371
