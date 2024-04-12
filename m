Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38844C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 10:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7A610F574;
	Fri, 12 Apr 2024 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipwyYaCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AAB10F574
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712917525; x=1744453525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fwatxYb1knUH2ngRL7vZtGm1RhvAEQ1lAdejbcdjiJk=;
 b=ipwyYaCWHNOh1LMbGcmCICGOh9HmY4Jdy/LwO7i326SOc/6e2rT8epn5
 UOtc/PyWETfpgJ4NT0Tp7ptT4MpBPPCRyR0wIYGQ7OOsF3l4TPSw1eGhT
 rLsWOUPW4+BSibKYpgkm+Q2IX8rEYawnBbPMD4a/DnlGiosJ3KC22wdil
 jgZ4ITm9hXCBEIdbP9md4uQ2Fg4K7Dxdzqk/t0AtVALjVi6WN/GErI5JH
 5olZUhom5WpIBVFc8TZ0DW6SLffYzgjavcs+FeK0rs2a72rkCwAWjEJK5
 rLq5rkS0K1N58XyUtXR9imBMA4StNdIyBXdWdONtNVlkwfj3icRKYGeRa g==;
X-CSE-ConnectionGUID: 6e+155z3TjG174FmhC2Big==
X-CSE-MsgGUID: CPKXkdl2QuyjUAryh9KupQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12219336"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12219336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:25:24 -0700
X-CSE-ConnectionGUID: yXY5ZMnaRB6OUxL97mfqXw==
X-CSE-MsgGUID: 10qURxVaTTW08gFEZo2fFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21175539"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa009.jf.intel.com with ESMTP; 12 Apr 2024 03:25:22 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@intel.com
Subject: [PATCH v3 i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Date: Fri, 12 Apr 2024 15:55:45 +0530
Message-Id: <20240412102545.3931935-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Change in igt_assert_f function parameters so that it also validate for
property value equals to 0.

v2: use uint64_t for property_value,use bool __igt_sysfs_get_u64 in
igt_assert_f(Kamil)

v3: correcting format type for property value in igt_debug in test_defaults
function for uint64_t type(Kamil)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_sysfs_defaults.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index b1ab36589..fd7dea77b 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -28,7 +28,7 @@
 static void test_defaults(int xe, int engine, const char **property)
 {
 	struct dirent *de;
-	int property_value;
+	uint64_t property_value;
 	int defaults;
 	DIR *dir;
 
@@ -42,10 +42,10 @@ static void test_defaults(int xe, int engine, const char **property)
 
 		igt_debug("Checking attr '%s'\n", de->d_name);
 
-		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
+		igt_assert_f(__igt_sysfs_get_u64(defaults, de->d_name, &property_value),
 			     "Default value %s is not present!\n", de->d_name);
 
-		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
+		igt_debug("Default property:%s, value:0x%" PRId64 "\n", de->d_name, property_value);
 
 		igt_assert_f(!igt_sysfs_set(defaults, de->d_name, "garbage"),
 					    "write into default value of %s succeeded!\n",
-- 
2.34.1

