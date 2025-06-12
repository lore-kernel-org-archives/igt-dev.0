Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69ADC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A20E10E7E5;
	Thu, 12 Jun 2025 11:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjgftyxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26010E7E5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729457; x=1781265457;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=TXih1ZbtPz1oRNSgB6KiYnQgeEHJIugrYMYDOPYd7vU=;
 b=NjgftyxTz4BehcKOwNVkt3lTfbCvmwpQXVmUq8fz3NaRvzj87nFOaYyn
 mfJdWR4308C1OrDihTNmKkFNXFTAKuQxGcsukYuPI6jK9tEkRbOk6yiTY
 66OJJRb6ex6gQlQnLcOY50XTeH3Pn7UURf31d00Et+AsXD4NdLcxdYUSs
 f1c/qwwUYVv5ZcGdKua9DN9vGlW9QVhaYJin6iYYrsz/M6d7pQFG9kl+J
 9gxwCvEfLsn8H6PR+NYvLp/15EBax3mFJLcJBgp16+kmG/1D8FSLh8oXb
 +bkrjucPZuYfM8ogtBHXjlK9kqKtfjkMnm8YMJscEmjQW02uyTOKqnjtf Q==;
X-CSE-ConnectionGUID: UtQm2kmuRRKdlz3MLVezPA==
X-CSE-MsgGUID: cxVS1EwCQ7SaFKtgZxaZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343048"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:36 -0700
X-CSE-ConnectionGUID: 8k8jrwp4R1G2vXFRZtUkCQ==
X-CSE-MsgGUID: JGY43QneSDSoxnSXKtkJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644794"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:34 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 0/6] CI/build: bump container images, OS and meson versions
Date: Thu, 12 Jun 2025 13:56:25 +0200
Message-Id: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnASmgC/22Oyw6CMBQFf8V0bbWPUKwr/8MY0sdFGoWSFhoN4
 d8tJCYsWJ7FzJwJRQgOIroeJhQgueh8lwc/HpBpVPcE7GzeiBFWEEEY1mPbV9abF4TKujgEHzF
 VSmghJbfFBWWyD1C7z2q9P/LWKgLWQXWmWVxjnzFQ7blVcYCwEE02+fBdbyS6cP8i3y0migk2d
 QlEMOBcmpvrBnifjG/RUkxs46B038GyQ5JSUjBaFtxuHfM8/wDJeWKNHAEAAA==
X-Change-ID: 20250602-bump_docker_distros-1aa6b6993d58
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3327;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=TXih1ZbtPz1oRNSgB6KiYnQgeEHJIugrYMYDOPYd7vU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB81+yZrgCXoE84evmlZ0xkfYwWAqyY0yWoA
 A3LF2WldUmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfAAKCRAjYrKT3hD9
 11ofDACtEQ4Yibn7sSbejI3l8w1lv0HCqImK2RHLKkArN/6yRGc5W8YW471fv4kZMiSuPZXv70Z
 FUpAAuBrtuqjbVlJJOitK2NuUfpsTB++3LwDp6/zd7KoQLxM/BNZleknKVtuALshY0KM7O64LiB
 Urc6dLbqDDJU/HMsEMoNLs/6sWTLlbeWpJ+d6EKvRzWllsFVt2cRMKtepZYHVZJEStGqULAIaJv
 CljSmJ9NLmtt+oYQxYOtzUElwjSMvBb363nKLS7JIipEnV2WSP1/JBvOxC9xLtwKnd3zoruTqmA
 y3FaOrQaamSlPNbMT7+oEF3J16v3qYm1eOxswdZtKKtprTS0qAR8cldsXxhUm1Uk3p9sG91+VYl
 FJDyNQRTOzaonlwSasVNCJ+pCmb4Yc0JA6W+Bd3m6F7mOGgQvYn5O4m710OXyo1yH7OmWKf53EP
 qoCMAWMcFja3ozp2+KBLYodyT6EkhM8wxoOke/eoNqYEH3YXv34g5ltl1pCGR0jphuMbY=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

New patch(es) require newer version of build tools to work properly.
This patchset tries to do it.

Unfortunatly after gitlab update (February/March) "pipeline checks"
do not work on pre-merge phase so all green CI results [1], can be followed
by critical post-merge failure on pipelines [2] and quick revert [3].
This patchset contains changes which can cause failure on CI only after
merge and potentially can end up with revert.

To test gitlab pipelines I have forked IGT repo. It allowed to test
pipelines in safe way (thanks Kamil for the idea).
Here are results of the test:
Last IGT without patchset:
https://gitlab.freedesktop.org/andrzej.hajda/igt-gpu-tools/-/pipelines/1448021
Last IGT with patchset:
https://gitlab.freedesktop.org/andrzej.hajda/igt-gpu-tools/-/pipelines/1448029

Anyway it appeared CI uses quite old buildah base images which fails to find
newer versions of OSes, and even with added workarounds for this they fail
with arm64/armhf debian images. As a result I have decided to create own
buldah image based on stable original bare buildah.
All this took quite long time - learing gitlab CI, docker, buildah, podman,...
Finally I have ended with v2, hopefully sth acceptable.

v2:
 - added own base buildah image creation job instead of using wayland's,
 - removed podman logins from CI script,
 - updated python[3]-docutils package name,
 - updated descriptions,
 - added tags,
 - successfully tested gitlab pipelins on forked repo.
v3:
 - modified subject prefixes in the 1st an last patch,
 - removed MIPS Deckerfile,
 - added tags

TODO:
 - switch to newer version of fedora, alternatively replace it by alma
 - consider setting reqired meson version to the oldest one in tested distros,
   and remove shenanigans with downgrading meson in fedora Dockerfile

[1]: https://patchwork.freedesktop.org/series/149642/#rev1
[2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1438518
[3]: https://patchwork.freedesktop.org/series/149700/

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com
- Link to v2: https://lore.kernel.org/r/20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com

---
Andrzej Hajda (6):
      gitlab-ci: create own base buildah image instead of wayland's
      Dockerfile: remove MIPS architecture
      Dockerfile: bump debian version
      Dockerfile: bump fedora version
      meson: bump required and tested version of meson
      gitlab-ci: remove podman login

 .gitlab-ci.yml                  | 37 +++++++++++++++++++++++++++----------
 .gitlab-ci/pull-or-rebuild.sh   |  4 ++--
 Dockerfile.build-buildah        |  3 +++
 Dockerfile.build-debian         |  2 +-
 Dockerfile.build-debian-arm64   |  4 ++--
 Dockerfile.build-debian-armhf   |  4 ++--
 Dockerfile.build-debian-minimal |  2 +-
 Dockerfile.build-debian-mips    | 39 ---------------------------------------
 Dockerfile.build-fedora         |  4 ++--
 meson.build                     |  2 +-
 10 files changed, 41 insertions(+), 60 deletions(-)
---
base-commit: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46
change-id: 20250602-bump_docker_distros-1aa6b6993d58

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

