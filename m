Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D277C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 04:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECE21123FF;
	Wed,  3 Apr 2024 04:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWHEs9by";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCA61123FF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 04:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712118265; x=1743654265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ey6H+m0YsD6eW3akugLCUUWJwQzS1LS3PMn/oYh48PU=;
 b=aWHEs9by57R/vSPtB0QWbgCLePyeNjoFx64YsxhqpSPhZteafV9usZV6
 PbxaWGSq2Y2sVQWGDM301JOsgsw2cuv/2frrngDO3PXllay6QHeiOYW2c
 FGE75MzrBINx3J/lP8IfWWhid1K0sfm/sbmXB9ff5YL59o2QDQj7YZehC
 BJkkd22qVVKFPy6vlCbVcqqAZprmpytUcW/6ay+bT8CUrDaRqN+T/6nuy
 UpEYbQsoxJA6MBkDLo75ueR99YbfawPt7o0CmPbUuNwKSwRKy4awTxiym
 iYnhawEmLHpN64d6+4edsvjMPB/PHGFzzR01Wa7k4GmIeWzXsR05czNH3 w==;
X-CSE-ConnectionGUID: xgGGUaHVTBi3llD0ebv0PA==
X-CSE-MsgGUID: QsPQffJmS4KEyR41SuKhlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32720236"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="32720236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 21:24:24 -0700
X-CSE-ConnectionGUID: AVrxmqR2Qzy+4qvtdYuauQ==
X-CSE-MsgGUID: hJ/aYautRlCEO9LuuEKyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="22762488"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2024 21:24:22 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all default
 values
Date: Wed,  3 Apr 2024 09:54:45 +0530
Message-Id: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
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

From: nakshtra goyal <nakshtra.goyal@intel.com>

Change in igt_assert_f function parameters so that it also validate for
property value equals to 0.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: nakshtra goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_sysfs_defaults.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 4a6b3ba6d..a0014a832 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -42,8 +42,8 @@ static void test_defaults(int xe, int engine, const char **property)
 
 		igt_debug("Checking attr '%s'\n", de->d_name);
 
-		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
-			     "Default value %s is not present!\n", de->d_name);
+		property_value = igt_sysfs_get_u64(defaults, de->d_name);
+		igt_assert_f(property_value >= 0, "Default value %s is not present!\n", de->d_name);
 
 		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
 
-- 
2.34.1

