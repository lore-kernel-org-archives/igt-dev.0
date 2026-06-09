Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5748CD6E79
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0C10E077;
	Tue,  9 Jun 2026 03:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJBm2lK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56DA10E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976828; x=1812512828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KR356VUHv7B1YEvcMsqTOKP0Acf6NDw8c7I4WrDmsM=;
 b=cJBm2lK/fqLFfM/wVoAH6D/JfnIKW9RF3xXNsng1owQQt5SeKeETgb23
 u2L1CBd7Po16xUVvjtlHXEZMcMtv1glG3RQhB3iVNMIQSUAWrtFcG7nLb
 2kwjB8xPW4kH+RzrU8HVUqz4bCLsQVVYe5urJxy9hEtNP9HryrVMdxI9f
 gS9ohrSiG5naqLcsLvc5NPqZS9EOqiumv6I0buQwrBN5TphVgBuUBCRRm
 ktfwwLZU9x3MIqJx54TRa2QPq9SmcFjVosnmR6Jm9m+GahqHin2esC9AG
 3EWFwk+bTq5B5v5IeYm4iVWbfezb5AiR3BPOvZIvsi5VM7XFYYTlWuIMs Q==;
X-CSE-ConnectionGUID: 9uBBtDbHT9mYlzD9+ZmAZg==
X-CSE-MsgGUID: FRyw21XGQvqDt5H9BtTqNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050898"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:08 -0700
X-CSE-ConnectionGUID: yxsruHEFTTaEwPh4HwArSg==
X-CSE-MsgGUID: vFe6k3uiRaWV23ItHQARdQ==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:47:06 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 4/7] tests/kms_vrr: Add new test for DC3CO validation
 with LOBF
Date: Tue,  9 Jun 2026 09:16:47 +0530
Message-ID: <20260609034650.2281712-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_vrr.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1..82eb8554a 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -29,6 +29,7 @@
  */
 
 #include "igt.h"
+#include "igt_pm.h"
 #include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
@@ -76,6 +77,9 @@
  *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
+ *
+ * SUBTEST: lobf-dc3co
+ * Description: Test DC3CO entry during LOBF.
  */
 
 #define NSECS_PER_SEC (1000000000ull)
@@ -873,6 +877,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
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
 static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_crtc_set_prop_value(crtc,
@@ -1112,6 +1135,17 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
 			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
 		}
+
+		igt_describe("This test validates DC3CO entry during LOBF (Link-Off Between "
+			     "Frames) periods while VRR is active and PSR is disabled.");
+
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

