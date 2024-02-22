Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B72C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 19:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86A910E16C;
	Thu, 22 Feb 2024 19:49:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B5010E16C;
 Thu, 22 Feb 2024 19:49:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/igt=5Fkmod=3A_Allow?=
 =?utf-8?q?_to_load_kunit_from_alias?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Feb 2024 19:49:51 -0000
Message-ID: <170863139192.217031.12073361436627309618@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222193044.3004471-1-lucas.demarchi@intel.com>
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

Series: lib/igt_kmod: Allow to load kunit from alias
URL   : https://patchwork.freedesktop.org/series/130282/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1110482 for the overview.

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/55393643):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-28 _cvnfVvT, system ID: s_d7b83ec7ddf0
  section_start:1708631123:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Get "https://registry.freedesktop.org/v2/": read tcp [2604:1380:45f2:6900::3]:54852->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)
  section_end:1708631124:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: Error response from daemon: Get "https://registry.freedesktop.org/v2/": read tcp [2604:1380:45f2:6900::3]:54852->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1110482
