Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3609FDEE31
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 17:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948E610F1E7;
	Thu, 23 Apr 2026 17:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAxLycY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09910E36B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776965768; x=1808501768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyMMf4o7RvDV7bu19GULs2/4uMV8wx4slHDsyiPFdmo=;
 b=FAxLycY0ap4EVKzaaUP6Mnanh2F2Q9O2O+/7+tIi/52qbleMTJ/bfKG2
 utTN2xS9Gx1X1hh4A++hQ5QEJDhrXAarW2Z5xqf//Zw9utQgWi3TJ6wIa
 T/DV3pUiqfcUF6PqoeGsn9gzP3TGgn7o+Bi2D5EZqTYg8AIxQaYQXc3gY
 mgrsW2gb3cMW9bWpE/ZBgwqSfHsD01DMtqFSTrfWyeYnVkaJ78c6nsoR1
 /4oZRSjP3xDWz0Vl/ZQOmVwaXI3fDKeNWJtnX3J20evyuKFhDRS/+GKYk
 KU0MKEQMNWmHaRV8IwlYSjToaMUYVVobBygzjGOllKRA7gm1kDltzOg1i w==;
X-CSE-ConnectionGUID: ZWfVpGcFTe6aljtgUDQmsA==
X-CSE-MsgGUID: FV6QubkvTmaMYjFXjPI1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78134706"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="78134706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:36:08 -0700
X-CSE-ConnectionGUID: DHYLD40TRRuWR0JKxcbo6A==
X-CSE-MsgGUID: TOmpV5AhSfWTUJxsPYTvoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="229527367"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 10:36:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 4/6] tests/kms_vrr: Add new test for DC3CO validation
 with LOBF
Date: Thu, 23 Apr 2026 23:04:01 +0530
Message-ID: <20260423173403.123706-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423173403.123706-1-jeevan.b@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
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

Add lobf-dc3co subtest to validate DC3CO entry during link-off
between frames.

v2: Fix the flow logic.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 30bda3244..b98672520 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -29,6 +29,7 @@
  */
 
 #include "igt.h"
+#include "igt_pm.h"
 #include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
@@ -80,6 +81,9 @@
  *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
+ *
+ * SUBTEST: lobf-dc3co
+ * Description: Test DC3CO entry during LOBF.
  */
 
 #define NSECS_PER_SEC (1000000000ull)
@@ -947,6 +951,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
 }
 
+static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
+			    igt_output_t *output, uint32_t flags)
+{
+	unsigned long dc3co_count_before, dc3co_count_after;
+
+	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
+						 IGT_INTEL_CHECK_DC3CO);
+
+	test_lobf(data, crtc, output, flags);
+
+	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
+						IGT_INTEL_CHECK_DC3CO);
+
+	igt_assert_f(dc3co_count_after > dc3co_count_before,
+		     "DC3CO should be entered during link-off periods. "
+		     "Before: %lu, After: %lu\n",
+		     dc3co_count_before, dc3co_count_after);
+}
+
 static void
 test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	  uint32_t flags)
@@ -1242,6 +1265,16 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
 			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
 		}
+
+		igt_describe("Test to validate DC3CO entry during link-off between active "
+			     "frames in non-PSR operation.");
+		igt_subtest_with_dynamic("lobf-dc3co") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 35);
+
+			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+			run_vrr_test(&data, test_lobf_dc3co, TEST_LINK_OFF);
+		}
 	}
 
 	igt_fixture() {
-- 
2.43.0

