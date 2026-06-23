Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B7CD98F0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 05:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CD010E940;
	Tue, 23 Jun 2026 05:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ne7EtyBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3056E10E940
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 05:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782191114; x=1813727114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OVB7vfF3QbJpIDf7FSxM6Al7C+Lru9Ong7tFgXZTQZM=;
 b=ne7EtyBmpI+sFiIoUMYUzbXXnoriM53Xjzy1bHUIlmXnjdCSG6sn/9u3
 IyZjaDpiiNo7+5b4OHWnOcbPcWx316xMWGOYt5scXjwpcYH5nkAzJyy/9
 JIHa55yDAEqBkQU1m7EU5xAHCck7OQ0SnpsmtqaZsuIpvP/q/yRS1TEnv
 bZQ/RuZ8PPF3n/7bC9RkD01MC/ZMA+bSC5sTpmgIJWpDbxEQUyumEu/r9
 zCRi/3btcJ5TQvQSbe+U9HRnUTVM+W11wY6ygoLNaTP+l+okBsSkbsTSJ
 hSKVf03wJSr1DW7wAnN0EwJRGZBrhCMoZC0UyiaJO86WJ+/AlupQ406vf g==;
X-CSE-ConnectionGUID: OcgjWn1HQ02tA1KRHdaOoA==
X-CSE-MsgGUID: g9EoigKHSCeHn0MBwD8oiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100476444"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="100476444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 22:05:14 -0700
X-CSE-ConnectionGUID: 33mLXxBzTmOqCMof+/fM6Q==
X-CSE-MsgGUID: kvSG9obWS5OaIgI1hUsoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="254501632"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 22:05:13 -0700
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com
Subject: [PATCH i-g-t] intel-ci: Blocklist multi-queue subtests for PTL
Date: Tue, 23 Jun 2026 10:36:32 +0530
Message-ID: <20260623050633.9620-1-venkateswara.rao.muppidi@intel.com>
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

Blocklist multi-queue subtests in xe.ptl.core.blocklist since
multi-queue tests are not supported on PTL

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index abaa1284f..8752e92cd 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -53,6 +53,11 @@ igt@xe_pm@d3hot-i2c
 ##################################################################
 igt@xe_compute@ccs-mode-basic
 igt@xe_compute@ccs-mode-compute-kernel
+#################################################################
+# Tests not applicable for the platform
+##################################################################
+igt@xe_exec_multi_queue@.*
+igt@.*@.*multi-queue.*
 ##################################################################
 # Expected skips as the tests are not supported on PTL
 ##################################################################
-- 
2.43.0

