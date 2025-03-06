Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D437C28B23
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 12:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351FC10E120;
	Thu,  6 Mar 2025 12:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7B0a/FF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0B10E120
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741263232; x=1772799232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LgmvpI10B34O71bhvMXYj1Spil0jeyAIf+GnirO0LRY=;
 b=B7B0a/FFywWCw05ZO3MI+/9LzdwAgd/ouBOsBzV4IdQyMSdJIdvbGcKG
 BTVFfhJlZCRTdXDcsR78FgrzTXnL0CuD8KD3zJYDOn9kHC7LGKZoieUYh
 bbe9wqZJe8h3JXwgMyTXgSymwsuAp9yc0C59sFyVa1DsxH6LGHRJ+LopB
 jklKF2fMxyrgp5vovTI7RnYP+yCBKEXQmzVEsOAw7P10xZV083aNid502
 Jf6gjA6jgsA382vJzd6ZXagLCgdCotJhFZkN4/Ry9tposCA5/a/HKNS6g
 0NDEmCT7QhJy4zPA9kIGrvGTYhc+mrUkbIdtNzohIENgVd1j3xt/JlW4O A==;
X-CSE-ConnectionGUID: sVB0TMpAQcGG/6VCdIwi0g==
X-CSE-MsgGUID: Cwuv+WlcTmm3/HITVcA+TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45073370"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="45073370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:13:52 -0800
X-CSE-ConnectionGUID: +yhdmjYqQ1CwF+5ISssdIA==
X-CSE-MsgGUID: wzPFEpW1TKOthTn6YeCv1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119199072"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 04:13:51 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe: Block
 kms_display_modes@mst-extended-mode-negative test
Date: Thu,  6 Mar 2025 17:43:11 +0530
Message-Id: <20250306121311.431289-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

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
2.25.1

