Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7AEC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F05E10E51D;
	Thu,  3 Sep 2026 07:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYoZcHOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A3310F424
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420876; x=1819956876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0O75oRE+GH3cZPVYEwEfh8EjOopJ+VlZ55YgPxISXu8=;
 b=LYoZcHObIPX1wkul1ndtpR6P1q+PpXT8RFXSkQFbZy4tHJl5hrEtPNVy
 ZgMmAcEjpDe5IH8tqEqCalYQKEmraU4TjAHePaRsm6+jjyFwvZthVXABL
 tecEEE5mJm6DLoXTCqR4j/d2M2KOSurOBJwKNBlpnzRol7udIhqJ+hVCX
 tqH/9ICT7Lea3b1g/apsF+jK1uNmapt3RAkyarmLheb81i/UePfXWPr01
 aAxbKSmYSx0/ie0tU1JjXRNPnItySqhJ+il/cLJhCccmlUL9o8n+GI5mI
 ZEdo7aekEdG2/IRU+knuo+rpJ7Ru+PcIPWuyCTSJTnAkPaXjhfWClHCEu A==;
X-CSE-ConnectionGUID: LlLf6gYTR4+54hfas8aB0A==
X-CSE-MsgGUID: 8SvVhQGVS9ezwrWUT+z6nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655731"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:35 -0700
X-CSE-ConnectionGUID: YikSrgWIQDyGJdVz3t9Rgw==
X-CSE-MsgGUID: 29mlYV+aQ8aitJ01hpZJ9g==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:33 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Date: Thu,  3 Sep 2026 13:03:35 +0530
Message-Id: <20260903073335.339540-11-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index cdf15f70b..5492c0b9a 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -20,6 +20,7 @@
 
 #include "igt.h"
 #include "lib/igt_drm_netlink.h"
+#include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
@@ -569,6 +570,14 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
 	CLEANUP_ON_ERROR(ctx, fw_handle);
 }
 
+static void igt_require_cri(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info("Starting Error Injection test: %s\n", injection);
@@ -600,6 +609,11 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
+		igt_require_cri(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
 		xe_mmio_access_init(fd, &mmio);
 		igt_require(xe_mmio_is_initialized(&mmio));
 	}
-- 
2.34.1

