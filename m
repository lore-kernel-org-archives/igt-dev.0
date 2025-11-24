Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E21CFD313
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05A410E31E;
	Mon, 24 Nov 2025 18:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLhG5l3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACE110E31E
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008894; x=1795544894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=abMkmo8+ycYkAgmEbF5cy7mf5f8wG/njL0EM3Gp92Ww=;
 b=MLhG5l3gP01b+2uth3pVvIPZNvGcV5gzu+5Y/XFYnGdg22NAlCfxxD3d
 DFIkmBsOAUqR5FH+quj7eeaPfggVEW/S5ydbuOaAlTBfZiChUN6J9xjn1
 /a+3wnNOxoMNDP/gTHpn0GWYKt9csbHy5sZ3hODaMDBKJP973ObgPVW/y
 4uEu/2sxVnW1V2Bx/XaBR8VsQ+KdJ5Zr/DpeUKgKAPeQaRvvp+Jo8FCmp
 0iNcwEXw243i6fDFOLmSCb8ABTa5gy9FOat3MVj0sCoKpFa5xaREuQOU5
 IKN9S8Jpxq+hLXFzBfDtK2rmTIr6OWQsEQ6Ahueotvy/KgP3AI0bLd2mr A==;
X-CSE-ConnectionGUID: 9uUv+MwBT9WGi42Tt3nyTw==
X-CSE-MsgGUID: 0Ue6GG6DQRa6ZfIkPJoj6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055330"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:13 -0800
X-CSE-ConnectionGUID: WnlUFxYZSqybqur626Tcyg==
X-CSE-MsgGUID: HszInNOTQQCq7OgaI2TULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747121"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:13 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/6] RFC: Add new test for eDP data override
Date: Mon, 24 Nov 2025 23:57:50 +0530
Message-ID: <20251124182804.2095722-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Ignore the first 4 patches as those are under review in a
different series. Since those patches are dependencies for
the last two patches, I have included them.

Please review patches 5 & 6: 

lib/igt_kms: Add helper to get eDP/DP supported link rates
tests/intel/kms_link_training: Add edp-data-override subtest

Jeevan B (2):
  lib/igt_kms: Add helper to get eDP/DP supported link rates
  RFC: tests/intel/kms_link_training: Add edp-data-override subtest

Kunal Joshi (4):
  tests/intel/kms_dp_link_training: rename to
    tests/intel/kms_link_training
  tests/intel/kms_dp_linktrain_fallback: rename to
    tests/intel/kms_linktrain_fallback
  lib/igt_kms: add helpers for connector type
  tests/intel/kms_link_training: extend test for eDP connector

 lib/igt_kms.c                                 | 126 +++-
 lib/igt_kms.h                                 |  11 +-
 tests/intel/kms_dp_linktrain_fallback.c       | 639 ------------------
 tests/intel/kms_dsc_helper.c                  |   2 +-
 ...dp_link_training.c => kms_link_training.c} | 191 +++++-
 tests/intel/kms_pm_backlight.c                |   2 +-
 tests/kms_atomic_transition.c                 |   4 +-
 tests/kms_hdr.c                               |   2 +-
 tests/meson.build                             |  16 +-
 9 files changed, 323 insertions(+), 670 deletions(-)
 delete mode 100644 tests/intel/kms_dp_linktrain_fallback.c
 rename tests/intel/{kms_dp_link_training.c => kms_link_training.c} (65%)

-- 
2.43.0

