Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66EEDEC04
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 04:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3E10E0EA;
	Wed,  4 Mar 2026 04:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMEsCTri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316FD10E0EA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 04:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772599074; x=1804135074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hJMR3uzW+Kt2GV0rrwzIWbI6kmiTp34VQzW4OonXe5U=;
 b=IMEsCTripRuAKB0UjelWyhNjprWVKhiTX8Vy0972BxvJdaPZ/m9Fe4N5
 l1N+4iMC/K9X6q6TQ9Gas6qLGHVGaGoiY+IxZ8X9f2A2mmUuGz5hJsiLW
 4EKUFKNiDoGAHZk+WCw8+vZRbMb683zaPRreEnmr6WgzBhzJyT0mO42lj
 4sYhQdhM3h/kUuGvrDDitffshj5BAwtjvceaPyZ/BciQyOjV/+oSr9C5g
 dsRWiBzNyt1Atinw/mnrgrCdK5Zl8rwW9y4QXzotEMsfMWfvPT1fIxOHr
 2gh/JRpd/5YvE69h82BtG33n7K3o7ET+WM7XvQZBgikz2YoyvnM1m+sia w==;
X-CSE-ConnectionGUID: se/IwUQ/T76sHYkOrDU0Wg==
X-CSE-MsgGUID: gi7J+sfQSJCsZZZWN7zJFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73560244"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73560244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 20:37:54 -0800
X-CSE-ConnectionGUID: zmoBan+KSf+BRDIIgQ1qAQ==
X-CSE-MsgGUID: TsbjmwYVROedwdfSQeo99A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218332579"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:37:52 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_vrr: Add new test for DC3CO validation
 with LOBF
Date: Wed,  4 Mar 2026 10:08:04 +0530
Message-ID: <20260304043805.572087-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304043805.572087-1-jeevan.b@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 569000fee..f8b830cc0 100644
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
@@ -942,6 +946,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
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
@@ -1237,6 +1260,16 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
 			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
 		}
+
+		igt_describe("Test to validate DC3CO entry during link-off between active "
+			     "frames in non-PSR operation non-PSR operation.");
+		igt_subtest_with_dynamic("lobf-dc3co") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 35);
+
+			igt_require_dc_counter(data.debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+			run_vrr_test(&data, test_lobf_dc3co, TEST_LINK_OFF | IGT_INTEL_CHECK_DC3CO);
+		}
 	}
 
 	igt_fixture() {
-- 
2.43.0

