Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E5D1BDC2
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 16:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419D10E2BD;
	Mon,  4 Nov 2024 16:23:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF110E2BD;
 Mon,  4 Nov 2024 16:23:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/intel/kms=5Fccs?=
 =?utf-8?q?=3A_add_suspend_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 16:23:37 -0000
Message-ID: <173073741721.1392002.17499056755216479272@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031150901.325042-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241031150901.325042-1-juhapekka.heikkila@gmail.com>
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

Series: tests/intel/kms_ccs: add suspend tests (rev3)
URL   : https://patchwork.freedesktop.org/series/140731/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1303757 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/66076686):
  Running with gitlab-runner 17.4.0 (b92ee590)
    on fdo-equinix-m3l-31_8-15 -sxCmjG4y, system ID: s_58bb9674a776
  section_start:1730737164:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 ...
  WARNING: Failed to pull image with policy "if-not-present": initializing source docker://registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0: Requesting bearer token: invalid status code from registry 500 (Internal Server Error) (manager.go:251:0s)
  section_end:1730737166:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0" with specified policies [if-not-present]: initializing source docker://registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0: Requesting bearer token: invalid status code from registry 500 (Internal Server Error) (manager.go:251:0s)

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1303757
