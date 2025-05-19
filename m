Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D0C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 09:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277FE10E002;
	Mon, 19 May 2025 09:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVFFzhND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405410E002
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747646602; x=1779182602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfJxglwbCbcCEAm/CyuWwC1QO9HDjz7M5nGEic/mvVE=;
 b=cVFFzhNDY1m4y8iwGGOBwVZpveY3HbL9fsHd6355cUIlk2i8sZF1IhDv
 bQAuOWSY5a2qkE6AKo7eine1rjASGv0Ji5HGw5fQx0YYLWsj7WHZCwIp6
 ZNoNWmC0U9bqCvCkBtjKJHrDRj6fKQr2tIxjSkV1ndnxGW1Zz+/e7hdEY
 qyFY79PUW3g7+Sh/SOC/vY/1XHvIrY66/kgmjz9c6K+aY60mPm31fjB62
 zsfwrBh8UkhCzKs3dDDwwSpVB0bNNBCw71u9mOa1d+qMBF9B0ENaZOATf
 uOtf6OGgrv+uwPkAoT86VVB2tuMN/PMMqZhctcxzfugINxcoTACa5T6Eu Q==;
X-CSE-ConnectionGUID: eI0whDAsQmGmKQ4RabvbAg==
X-CSE-MsgGUID: C5Neqs+WTG2k3CBUYPF7iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66952375"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="66952375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:23:21 -0700
X-CSE-ConnectionGUID: c1aLHnDmQwuNTZGCVgpgfw==
X-CSE-MsgGUID: 6vuoelg8QLWWAvTw74VCCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139057978"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:23:19 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH] tests/intel-ci: Block unsupported dirty rect test for i915
Date: Mon, 19 May 2025 14:44:03 +0530
Message-Id: <20250519091403.3305383-1-santhosh.reddy.guddati@intel.com>
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

Block KMS test as the feature is not supported on all i915 platforms.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel-ci/blacklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 5a563e84d..8543f5ddc 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -153,6 +153,7 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
 igt@kms_frontbuffer_tracking@plane-fbc-rte
 igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
+igt@kms_fbc_dirty_rect.*
 
 ###############################################
 # Test was written with the idea that edid read shouldn't take an
-- 
2.34.1

