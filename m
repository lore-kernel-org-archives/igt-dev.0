Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C240FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 05:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBAC10E425;
	Thu, 30 Apr 2026 05:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+02Yeyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6143610E423
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 05:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777525731; x=1809061731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zk8CjBU+sWdQVwVFA0L2v8dR82eJTAVkjWwY8RQDsGs=;
 b=Q+02YeyxYjG7yxgYoQjU23YQEbWOuXy4JfeS+Oj3IVmiLnlDPZevhoCv
 TMLCnxDk1oUgIDfK+pkRkfKZ5XxJ1RwZebvfodacx7GIFwhMfQl/jyI0X
 KM5yhHMOEkiTYLIHUhkyoHem/Hh0UIZ12gh6u/uV1pP7PRBajrd6I2C6W
 wXT16PBMhgVhNQECGDfCTG0v5htkNlDuqHR405w6t3LcFSQwpVsWm0DNy
 RQdQvAaTqDfp3Gx35f6KaSFJ51HH57xAf2pYa35+hfpMGmyqQqdNOEOGt
 pyydV434GjCV5N3PpzDO6g2hPeUw/hMOf2SfVNNGVmqn1jn2v0xjUDzCx Q==;
X-CSE-ConnectionGUID: Bru9xP43Svu5S8rEeB3c3w==
X-CSE-MsgGUID: pVfCz1ipSWeo/HzGfhZsmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82330765"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="82330765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:08:50 -0700
X-CSE-ConnectionGUID: 2UtYUDgYS663y5Vw97tHHA==
X-CSE-MsgGUID: /ZHEsJfKQReMbParQBQCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234502587"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:08:49 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v3] tests/intel/xe_oa: Wa_14026633728
Date: Thu, 30 Apr 2026 10:38:41 +0530
Message-ID: <20260430050841.3787299-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

For MERTOA in CRI, oa buffer can be in device memory. Because of slower
device mem access, OA exponent values lower than 8 can result in buffer
overflows. Bump the OA exponent value.

v2: Fix commit title, description and code description.
v3: Check if the wa exists and reuse it, also, fix a warning for C90
rule about using variables before all declaration statements are
executed.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..c7e756426 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,6 +24,7 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_wa.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
@@ -2643,8 +2644,15 @@ test_buffer_fill(const struct drm_xe_oa_unit *oau)
 static void
 test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
-	/* ~20 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	/*
+	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
+	 * Because of slower device mem access, OA exponent values lower than 8 can
+	 * result in buffer overflows.
+	 * By default, use ~20 micro second period.
+	 */
+	int oa_exponent = max(max_oa_exponent_for_period_lte(20000),
+			      (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
+			       igt_has_intel_wa(drm_fd, "14026633728") > 0) ? 8 : 0);
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
-- 
2.53.0

