Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A047C71148
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8C910E834;
	Thu, 12 Jun 2025 12:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDFifYE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4862B10E830
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731485; x=1781267485;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=1UAyESwVvWY1Ik8POzNvtdPjVFPRYQztqqDiTjr/mfA=;
 b=aDFifYE4Ipn01CywmEkrId/KQS7pWRgJwJYZWn2USD4Sz+RI2s57qGDu
 YZB+E8ydhI09foRrXDZliOJWdqCdekSAY3ylJqj4/zp0/Xk28PToFXyzn
 dgPQxpB97tnqDgC83EhLaHZHvOD1U3T0uOdfOQqKP3R1Pi0kfOJ/VHYmS
 OneU3QIG21jHMJJH2PfZNkBGMMKjD0bz1GTVSYbM3KbvbnMmPX3Tg9BQ4
 tqNg/YDqO7FhCX58xB5b5WoLK/PGx+P//3g2mpFgvQTSTrXrKMBd5vSmi
 p1eFElmmDviSpP/Dt2Lhna93F2LqqhixGVuZvU4PuEHroflTSaYlsXmF3 Q==;
X-CSE-ConnectionGUID: YNUJVeDGRYich2B8jyGeMw==
X-CSE-MsgGUID: vwKrBmzrSxeqgwcBwbI7Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777774"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:23 -0700
X-CSE-ConnectionGUID: /XWo0EnPTNSQJ3XTrltfbw==
X-CSE-MsgGUID: ++HV/e/QQzKfOJXYpJOZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061579"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:14 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v4 0/6] CI/build: bump container images, OS and meson versions
Date: Thu, 12 Jun 2025 14:30:11 +0200
Message-Id: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPISmgC/23Pyw6CMBAF0F8xXVvtQ8C68j+MIX0M0iiUtNBoC
 P9uITEhhuVd3HNnRhTAWwjoshuRh2iDdW0Kp/0O6Vq2D8DWpIwYYRnJCcNqaLrSOP0EXxobeu8
 CplLmKheCm+yMUrPzUNn3ot7uKSsZACsvW13P1tClGsjm2MjQg58bdZKc/yxnRDr3fot8czFST
 LCuCiA5A86Fvtq2h9dBuwbNi5GtDEq3DZYMQQpBQSuRcfNv8LWx/XnkySjOGhQXsqCKro1pmr7
 Xgx3SYAEAAA==
X-Change-ID: 20250602-bump_docker_distros-1aa6b6993d58
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=1UAyESwVvWY1Ik8POzNvtdPjVFPRYQztqqDiTjr/mfA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshgkJbxHofUehJVg9CnNpSUAqkmvA1yvoo5V
 seGhi26c0OJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYAAKCRAjYrKT3hD9
 13I1C/4zsDqS3F0XdnBjLpXUL17yLPa7E+hmIR5pwqStFb1NeMnh1x/XgLDqLfZLEpWAU1UZyWQ
 Dv9q8y58AoFo2xYBordgqGeDePH0nV6KQ/AdMRDm4JkFmnrQ3y1vaRnNzo52SajeYJzZ9u3H3Tg
 d8fNNLNjb+AN7cm8uLqoC3zNuKEG01ZYMR4BAgFAl45nG/2BFEDhfsd5UOelbwo7QvRmBMecKTI
 tfDHjFUqppJez6NB3tR2Y/iG0nRsj8zAiX6rd35pXUTw83kWUGGvMopfioE7cYGUMaaAHFRaIKA
 HCAHtkQ+QZK2UbItpiKAUUU4Bf5Ra4xix9RXUWE6/LSq9xNqSCpLIZvqnt7PF7spuNlXhmWRIk/
 OuDI7WKkg2XQvkskPmZ7OMrMyM6LtxRuqPY/n67IVXNuU/qfA8nZY726e701zbwGBh8xZfRjlqx
 lmTxzngha07hcLfzks+z1CaqQAPZLl73IrsF7RAziu1LH4xHE5LJai3gybxv7yp/JWgp0=
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
v4:
 - just fixed fedora version back to 33, 42 somehow sneaked in

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
- Link to v3: https://lore.kernel.org/r/20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com

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

