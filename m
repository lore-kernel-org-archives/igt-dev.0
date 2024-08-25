Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAECC5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6116910E05C;
	Sun, 25 Aug 2024 18:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zol6i6G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CB610E05C
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608948; x=1756144948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o8Dk375GasPj01IQQD0HvBeos3mDQFwbUN6A1UTl53M=;
 b=Zol6i6G+LpeEd2ekBh+u2gD9Kb+cJdMInwvLs1ZYvGwt+ornWwxbtcTJ
 aqXyLaHF9wrWKX62luF7GX78T0TVs2+6wr6dWT2aP6bpkDAhhldHH0sK6
 PpbpOia+PAKWrUifQso3/4iY1aF07LkLvJLSmppIlH5VX6srSvnFcXOLp
 0sAsgxZW5pOdSqBgf6xfDXsL8Gw6QRXieBJpDz6iq5YDfiwFls+XarQyh
 EXmhh2/hhjgosLxBFo7Q6+T6xOOU8xyRP1GLH3Sh6Va8PGm9JmjKcgH6o
 WJyJGWQG4HhK4Z/FMV44BLhOQi2NDiVA5umHVa1VilzELWHBLGEs2/4Su g==;
X-CSE-ConnectionGUID: m1b3fyLGThafWNeIK7JCzg==
X-CSE-MsgGUID: zfSZnoumRKKAIog8d9IbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917449"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917449"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:28 -0700
X-CSE-ConnectionGUID: BlO6KvNjQ5WAIVvMm2gjvQ==
X-CSE-MsgGUID: /RLNbSnhRQSnMpfXaWAY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488275"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:26 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/14] add test to validate fallback
Date: Sun, 25 Aug 2024 23:44:10 +0530
Message-Id: <20240825181424.4034541-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (14):
  lib/igt_kms: add enum for link rate and lane count
  lib/igt_kms: add helper to get current link rate/ lane count for
    connector
  lib/igt_kms: add function to get max link rate/lane count
  lib/igt_kms: add function to force link retrain
  lib/igt_kms: add function to force link training failure
  lib/igt_kms: add function to check if retrain disabled
  lib/igt_kms: add function to check force link training failure support
  lib/igt_kms: add helper to get pending lt failures
  lib/igt_kms: add helper to get pending retrain count
  lib/igt_kms: add helper to set connector link status
  lib/igt_kms: add function to reset link params
  lib/igt_kms: allow set and reset value to be same
  tests/intel/kms_dp_fallback: add test for validating fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 334 ++++++++++++++-
 lib/igt_kms.h                            |  36 ++
 tests/intel-ci/fast-feedback.testlist    |   1 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/kms_fallback.c               | 506 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 877 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel/kms_fallback.c

-- 
2.43.0

