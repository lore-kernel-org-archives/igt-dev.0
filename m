Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D41C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 22:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6C10F40A;
	Tue, 26 Mar 2024 22:31:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0B210F409;
 Tue, 26 Mar 2024 22:31:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Fix_memory_access_issue?=
 =?utf-8?q?_due_to_variable_block_scope_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 22:31:26 -0000
Message-ID: <171149228624.1054169.5081608609613022794@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326213937.11750-1-me@petersenna.com>
In-Reply-To: <20240326213937.11750-1-me@petersenna.com>
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

Series: Fix memory access issue due to variable block scope (rev3)
URL   : https://patchwork.freedesktop.org/series/131602/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1138362 for the overview.

build-containers:build-debian-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56836336):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1711491874:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Head "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/2019-08-13.0": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Awayland%2Fci-templates%2Fbuildah%3Apull&service=container_registry": net/http: request canceled (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)
  section_end:1711491889:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: Head "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/2019-08-13.0": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Awayland%2Fci-templates%2Fbuildah%3Apull&service=container_registry": net/http: request canceled (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/56836338):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-27 EfLUxtkS, system ID: s_53a5e12e8cde
  section_start:1711491875:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Head "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/2019-08-13.0": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Awayland%2Fci-templates%2Fbuildah%3Apull&service=container_registry": context deadline exceeded (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)
  section_end:1711491892:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: Head "https://registry.freedesktop.org/v2/wayland/ci-templates/buildah/manifests/2019-08-13.0": Get "https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Awayland%2Fci-templates%2Fbuildah%3Apull&service=container_registry": context deadline exceeded (Client.Timeout exceeded while awaiting headers) (manager.go:237:15s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1138362
