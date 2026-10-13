Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E98CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A46510E5E5;
	Tue, 13 Oct 2026 19:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F59110E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918501; x=1823454501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVG8BJvsJf+jfYOhFMkbQJn4TBbVCPPUkFUaglbr2w0=;
 b=YxA9S/a2ndOLrfjSSgxPp6eW8xZLNukcIjhKhE8R+GreXWlTVX4+50BA
 b7YHTVlZ/cFsHEaZC+yLozVl4SpbZj9h7DUbBs6TLoN9HGcVXlj8TJYWy
 VigEtOEtUXZmCiKTHERG+KkG3EK0swZ113hJpwdVtnWEup3m0/9RrJn4j
 EHo7uQ6x3NWv3Rgv+oDQZTOE9zgyBDoypn7JwiZ8KyD2/yC7AYThGtSuW
 r7vDCiYdSO157mAZdsQzlExpx75sw3sOziqHIYSoSHgAqzd0DmB9RZwt3
 o6UUD+6lsq11uFC9z+DlO9OTMFDQjdCzSrnpKRr5rL0SGGYmoMzaIoCco w==;
X-CSE-ConnectionGUID: OECy9Kp0SdOdaPeMEwGk8g==
X-CSE-MsgGUID: WSqoHkO4SsOmF3VXmJD9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687321"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687321"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:21 -0700
X-CSE-ConnectionGUID: QXbghMsRSPaSpKGl1luRPw==
X-CSE-MsgGUID: Zp0LnlimR2WwFi+mEqhxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004518"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:08:17 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Date: Wed, 14 Oct 2026 00:36:51 +0530
Message-Id: <20261013190651.897241-11-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Add support to verify the CRI GPU and skips test gracefully
on non-cri platforms

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5: Renamed the CRI GPU check function
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 796b4d696..46d9f7f42 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -20,6 +20,7 @@
 
 #include "igt.h"
 #include "lib/igt_drm_ras_nl.h"
+#include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
@@ -597,6 +598,14 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
 	CLEANUP_ON_ERROR(ctx, fw_handle);
 }
 
+static void require_cri_gpu(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
 enum xe_err_injection_type {
 	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
 	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
@@ -647,6 +656,11 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
 			      "forcewake_all is not available in debugfs\n");
+		require_cri_gpu(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
 		xe_mmio_access_init(fd, &mmio);
 		igt_require_f(xe_mmio_is_initialized(&mmio),
 			      "Failed to initialize Xe MMIO access\n");
-- 
2.34.1

