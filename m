Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63332C677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167CA10E61B;
	Wed, 11 Jun 2025 11:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXXfxQKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56210E61B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640041; x=1781176041;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=AvoDWRa52vD1y9cwmb6Ee03pt5+OVTaDWCi+998zqk0=;
 b=UXXfxQKBzYjW3RjkyAh7EUsw55F92jIFxZmdj2s3x164AismQgMq/Dop
 rDPQEfkutbugrmuvRnl+iYsOlapXRWhrJLBIXQqg2fDkNkR54fo1CwZcz
 hxEUoNcT7dKIScFExBPWwefziFC3Svli6JXdT+CHSenXIqATwMJQ3jgDN
 dFrXGgQGCGEw7cBiVj10upblWvA5goke0A1g9crE9M94KixvO76BAO2M0
 EgWVnJQbly1mt1hxAdl2jnYK9vNSYobb2omXJG3ouqt3zl8XFFS9BQAni
 0T/DaazigE/rJ0ZhZmOmZdUtZR8l3Rz/tHRwU5rbJMoa/QhjaFtwCbJTn A==;
X-CSE-ConnectionGUID: +BsucdSzS0+sXzrmCuRmrw==
X-CSE-MsgGUID: BnBATEfkS/i9HouhvUylAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057447"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:20 -0700
X-CSE-ConnectionGUID: AWIjsFSsRz2YpM3vC7NW5A==
X-CSE-MsgGUID: AbWt3iJlRhGLd6gdskSZrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147014985"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:18 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/5] CI/build: bump container images, OS and meson versions
Date: Wed, 11 Jun 2025 13:06:35 +0200
Message-Id: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADtjSWgC/22Oyw6CMBQFf4V0bbW0oYor/8MQ0sdFGm1LboFoC
 P9uIXHnchYz5ywkATpI5FosBGF2ycWQgR8KYnoVHkCdzUw44xWTjFM9+aG10TwBW+vSiDHRUim
 pZV0LW11INgeEzr336r3JrFUCqlEF02+tacgaKH/yKo2Am9HnUsTPfmMuN++3KP4uziVl1HRnY
 JKDELW5uTDC62iiJ826rl/qJmEi2AAAAA==
X-Change-ID: 20250602-bump_docker_distros-1aa6b6993d58
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=AvoDWRa52vD1y9cwmb6Ee03pt5+OVTaDWCi+998zqk0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWNCxssHsixf/NBravkNFuU9GRhP89do/3AgB
 d5gxBckF4eJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljQgAKCRAjYrKT3hD9
 1xuIDACLTsoNq4Cv9aT6kYmL7X0blaDs7QNIOtF+BQUbWW0GvoPdAAD3PbnnuxeyfjU4UGzdzSk
 LjsEQvpJLbihZhOOvvz6MsMxkPbuoSUyRNACcAlxlqNd6+tMldwui85UPmIVWOptjHMRiE15tja
 Wwrn6hx7MoYQTnBxeIHhc9V3bjLgOz+hp8iFGe1ziCwEcmASUpdTSFf59VF8wdEl/WAQH6GMwAK
 CpOk+HWLmSeozeWANDnlBlVa2Ac3cxXHreXJ6w6Tf+RSjrv0thnKsePZSLwm0ddVHr/6GFaFQx2
 zovM/TPWDMz1fWVcd+NwC71v5MsB0iw1kqdH5tP1HZO7HQ6+ifnZ0k/2i5sNKPtvw5EkC667FqZ
 EDYWEFHTX91AOX+6yZVDcKRpTXt42e4XU3ryBf365fSP57jDBEdKl5AyCVBvho5cz32cfUB7E3N
 OpfZiKcp2MJZDTxgJKyg6cVxMIDAGX8EAc9+m+EmEntdo/4yAFITfTsNKIy96M4RCfgZE=
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

[1]: https://patchwork.freedesktop.org/series/149642/#rev1
[2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1438518
[3]: https://patchwork.freedesktop.org/series/149700/

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
- Link to v1: https://lore.kernel.org/r/20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com

---
Andrzej Hajda (5):
      CI: create own base buildah image instead of wayland's
      Dockerfile: bump debian version
      Dockerfile: bump fedora version
      meson: bump required and tested version of meson
      CI: remove podman login

 .gitlab-ci.yml                  | 37 +++++++++++++++++++++++++++----------
 .gitlab-ci/pull-or-rebuild.sh   |  4 ++--
 Dockerfile.build-buildah        |  3 +++
 Dockerfile.build-debian         |  2 +-
 Dockerfile.build-debian-arm64   |  4 ++--
 Dockerfile.build-debian-armhf   |  4 ++--
 Dockerfile.build-debian-minimal |  2 +-
 Dockerfile.build-debian-mips    |  4 ++--
 Dockerfile.build-fedora         |  4 ++--
 meson.build                     |  2 +-
 10 files changed, 43 insertions(+), 23 deletions(-)
---
base-commit: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46
change-id: 20250602-bump_docker_distros-1aa6b6993d58

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

