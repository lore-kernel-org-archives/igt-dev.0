Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5926C0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 05:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B4210E334;
	Tue, 28 Jan 2025 05:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+LrpzI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9425310E0D0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 05:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738041785; x=1769577785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4RK95klo1Oj26fH0QhrIxVH/VxOJqLRnlGj1PNExpBU=;
 b=L+LrpzI8jsbqV1NDpWR+SRCMwNI/rSlv7ipW0bwoHIKnMfq9GLKN66tx
 aC4fkiDcswXa1AfHTBmwWJMG+BZNiYENhv+4ELQIx0BZRGzbqRi+yGcgH
 /4RNpVzgaxyCPJjs3NSyZiy6NIJDOzVYzkwiEo5vCdTQVCIUAbBY4o5gL
 bm1njqJ5/CxTLfsG0e0anbwtRB3CxtQDub+5NyIFfQCR2rWt0KmJPpC70
 PVF5KNokxlyyTByDLKztHctYrKUCDiqTG+FkTM8cZds4RHs1+NxKQxQ8x
 Q75s4/Il1wnx88WkL/coxrfQtTFMo4tiPCslefZvh/ocfoU+cW0S+kOHH w==;
X-CSE-ConnectionGUID: vpqJazfASRmA/5RHWtCWwg==
X-CSE-MsgGUID: zpYyRYyGRBCUPIsFZ+dVpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49502991"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="49502991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 21:23:04 -0800
X-CSE-ConnectionGUID: EFCca0IfQDKXhsWvWbtVMQ==
X-CSE-MsgGUID: aJfEk79OSZmM5agOZ9M34Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="113644375"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2025 21:23:02 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
Date: Tue, 28 Jan 2025 10:58:25 +0530
Message-Id: <20250128052825.424586-1-pranay.samala@intel.com>
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

This test is getting killed due to exceeding disk usage
limit on CI environment because its logging to many logs.

So dynamically reducing the debug log level to 10.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_cursor_legacy.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1f082df2d..533972cd4 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -40,6 +40,7 @@
 #include "igt_psr.h"
 #include "igt_rand.h"
 #include "igt_stats.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: %s-%s
@@ -1840,6 +1841,7 @@ igt_main
 	};
 
 	igt_fixture {
+		int dir, current_log_level;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1850,6 +1852,15 @@ igt_main
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
+
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			current_log_level = igt_drm_debug_level_get(dir);
+			close(dir);
+
+			if (current_log_level > 10)
+				igt_drm_debug_level_update(10);
+		}
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

