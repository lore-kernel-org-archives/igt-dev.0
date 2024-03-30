Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F16C6FD1F
	for <igt-dev@archiver.kernel.org>; Sat, 30 Mar 2024 15:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426210E8B4;
	Sat, 30 Mar 2024 15:34:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3633A10E8BB;
 Sat, 30 Mar 2024 15:34:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/gem=5Fexec?=
 =?utf-8?q?=5Fcapture=3A_Reduce_test_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 30 Mar 2024 15:34:55 -0000
Message-ID: <171181289522.1082880.6718567461151245015@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240330145939.85030-1-me@petersenna.com>
In-Reply-To: <20240330145939.85030-1-me@petersenna.com>
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

Series: tests/intel/gem_exec_capture: Reduce test size
URL   : https://patchwork.freedesktop.org/series/131845/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1141397 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56990221):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-27 EfLUxtkS, system ID: s_53a5e12e8cde
  section_start:1711812827:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Get "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f": read tcp [2604:1380:45f2:6900::19]:38614->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:1s)
  section_end:1711812829:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: Get "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f": read tcp [2604:1380:45f2:6900::19]:38614->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:1s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1141397
