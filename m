Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87417C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 16:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3159710E442;
	Wed, 12 Aug 2026 16:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFbzU57B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7139410E442
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786552704; x=1818088704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wrelgZ6I1xIZuTkOhbYI10ApgIlKSv8OcYZYBXbubE0=;
 b=OFbzU57BlytyLyv35wHZ7p5tHoGhN5zbr3yVZB843MTYc9jVCG+Bc1Fc
 Ml1qVm80TdMhMZUQAtEEAQIZCqWDj7z4+LDMjyOlVEbFadMCp1gq+jkzX
 AiJA4JWMQRfYIDganSu/MMmlv4k/DI+DaTCl6UtgeJ3UqIOlD6sg2LXhn
 rG9uYHFpJKIwB50frX2kRX8bSb2gHxTPksXx9F2k/RXFKjiXzN2tCTy3r
 pD/cp+Nwdah/At3dvCcbLOxFpguLYSYfTLiuJQwhy08V2abSj8Vr3yuzH
 BgJfKYEO8lmAkrHTNU+pKCbXCLzF2xMW5CRoHNz5sJqKDSyML9m74hUll A==;
X-CSE-ConnectionGUID: EEki57oTSqKBaX0toQIp1A==
X-CSE-MsgGUID: LAwztQEWREi9IztbOsvEWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98628885"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98628885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:38:24 -0700
X-CSE-ConnectionGUID: 19NErttAQgCmtkh3BvAZ8A==
X-CSE-MsgGUID: 5BHX8s8qThClHDYqWHX3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261924215"
Received: from unknown (HELO cml-CometLake-Client-Platform.iind.intel.com)
 ([10.223.55.11])
 by orviesa006.jf.intel.com with ESMTP; 12 Aug 2026 09:38:22 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com,
	himanshu.girotra@intel.com
Subject: [PATCH i-g-t] intel-ci: Add xe.nvl.core.blocklist to config.json
Date: Wed, 12 Aug 2026 22:08:21 +0530
Message-Id: <20260812163821.1485347-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Add xe.nvl.core.blocklist to xe_test_config.json file so that
core testlists can be generated for NVL as well. Currently they are
not being generated due to missing NVL entry in config file.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index cfdb369b8..55542655c 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -79,6 +79,7 @@
 		    "include": [
 			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
+			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
 			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
 			{ "all": "../intel-ci/xe.blocklist.txt" }
-- 
2.34.1

