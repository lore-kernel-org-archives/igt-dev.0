Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD54C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 11:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ADA10E85B;
	Thu, 13 Mar 2025 11:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GulIH38y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD3610E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741866666; x=1773402666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S9aWA+WDFGkKuV2oblKfox8rUGzgVs6ywMcXqZgJcUA=;
 b=GulIH38ydRF4T52wOK8EvMiSwrSLU0hyGuBU+XbW6BwJC/eMZR0Wzo/v
 q5ZJ2zBnsu/jrELfR/aIwqCl1gxgmaFJxeO27GXhKcfYrMksOzDcO9Erp
 hJ2w8fREJ0giDQ2XcFpgjV87xISenXCgwOVrpB65sKXAIx4yenlaw5lb3
 uyN+TF4oX+k6EReYNErslO+Eo/wuUY0l/q329DBcEG7gXkzippO51KSoY
 sv+IstDzjy/CzpRx82l4uN1iOb23ZT/SMRHFlYDQfNJLOnqpiwc4VGGqg
 gRcIgVhyezRSU33cEO2GGxrdK1dF8jxg3f+pogjN+rUi97pywPoFSdtf0 g==;
X-CSE-ConnectionGUID: YKUEA3nOTz6iGQJUlcCyUw==
X-CSE-MsgGUID: rNld2ig7S9qveCYNbCwmXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60378238"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="60378238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:51:06 -0700
X-CSE-ConnectionGUID: aUXm54GtTC+QsMeAS8EamA==
X-CSE-MsgGUID: NXapw/+mS2SXUcPtkFFEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120989743"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2025 04:51:04 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci/xe: Block
 kms_display_modes@mst-extended-mode-negative test
Date: Thu, 13 Mar 2025 17:18:32 +0530
Message-ID: <20250313114832.15472-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306121311.431289-1-mohammed.thasleem@intel.com>
References: <20250306121311.431289-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This negative test was designed to validate ENOSPC errors with 2k-4k or
4k-4k monitors connected via MST, addressing bandwidth issues in MST
configurations.

However, it is not applicable to current bandwidths, as DP 1.4 supports
4 × 8.1 Gbps, and DP 2.1 has increased this to 4 × 20 Gbps, offering
significantly greater display capabilities.

v2: Add blacklist for i915.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel-ci/blacklist.txt    | 4 ++++
 tests/intel-ci/xe.blocklist.txt | 1 +
 2 files changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 9917bf46a..507c14d58 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -83,6 +83,10 @@ igt@gem_exec_alignment@pi-shared
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
+#Test is removed, so block it on CI
+###############################################
+igt@kms_display_modes@mst-extended-mode-negative
+###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80ceba9a5..06506f590 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -92,6 +92,7 @@ igt@kms_sysfs_edid_timing
 # KMS: Non-Intel tests
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
+igt@kms_display_modes@mst-extended-mode-negative
 ##################################################################
 # SR-IOV tests too stressful or time-consuming
 # to execute all dynamic subtests at once.
-- 
2.43.0

