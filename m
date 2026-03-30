Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F871061B12
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9E510E5A4;
	Mon, 30 Mar 2026 15:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSU85b/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C311610E5A4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774885577; x=1806421577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UVfh7B5stkzhFwv6Cq+1nFQ9n+uHZrL1Ap8wvbR+0cQ=;
 b=DSU85b/p253MIozirFTSWyMI87kcYdN5HU7DGiD4+d5LbMYYKsir3PHq
 r6830dOxRM9eXS940HAOmjiNjN6L+Hgd6mObHkj4SVl5tSjhguqxPFsZD
 /DNx4dK4j+l/BH9wLK8R1k9w1kBjcv1hJKnVFvXkd3H+UhEe2/7zePzLC
 QpDDdZSg1s05e5xtXRyxO1iuXyevJ0DGwl5II6Lkf4lz4BjvnqsuazeiX
 60zfAbR43YFbIQiRK6+qGXthVXPXu5Su2fySAO0NFXXGoZ7U1Bjp3Vi8D
 y7FvtW7anneVOgWLucQzOO6SfXAZkRyc5C5NSq9A0jOa4C6tuM5U+Neal Q==;
X-CSE-ConnectionGUID: LQy0d/CaToWkg5wBwvA3hQ==
X-CSE-MsgGUID: BpZ2Qx2JSVOmfEazEqxxNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75946181"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75946181"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:16 -0700
X-CSE-ConnectionGUID: VX7VoI8nTdCjC4DS4JaGhg==
X-CSE-MsgGUID: uqJtZWoXQ3qhUJ+gtH8qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="256593487"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:13 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 0/3] tests/intel/xe_pmu: Guard engine accuracy tests
 against busy DRM clients
Date: Mon, 30 Mar 2026 21:09:13 +0530
Message-Id: <20260330153916.2474178-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The engine-activity accuracy subtests are sensitive to unrelated
DRM clients on the same card. When other processes keep the device busy,
the measured engine activity can be higher than expected and trigger
false failures.

This series improves the robustness of the subtest by first introducing
a helper to enumerate DRM client processes associated with a given card
fd, and subsequently using it in engine accuracy tests to detect competing
clients triggering a warning, and skipping the test.

Soham Purkait (3):
  lib/igt_drm_clients: Add helper to list and count the DRM client
    processes
  tests/intel/xe_pmu: Check if other processes are using the DRM device
  HAX: Add engine accuracy tests to xe-fast-feedback.testlist

 lib/igt_drm_clients.c                    | 93 ++++++++++++++++++++++++
 lib/igt_drm_clients.h                    | 10 +++
 tests/intel-ci/xe.fast-feedback.testlist |  3 +
 tests/intel/xe_pmu.c                     | 25 +++++++
 tests/meson.build                        |  1 +
 5 files changed, 132 insertions(+)

-- 
2.43.0

