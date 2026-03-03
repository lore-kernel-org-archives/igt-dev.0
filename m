Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E034EC0463
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910D10E13E;
	Tue,  3 Mar 2026 09:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2xstG+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBC310E754
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772530760; x=1804066760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IwVKfxTn/d/oykgDrmGWGyWctSjNxVIs955appjYjw4=;
 b=B2xstG+otfdCE+z0m+XDe9Gvkr+/NDl+ylo7uzmnDZU63gL1+V33E0tS
 xsFatqat/wPq79VMXGn8m/1fo5+DxusrisrJNdEh6rvtgLj7BbmtRppcs
 P87BJt942J8kQQmr0tCd3pnB/ZYxSSZ4Ts+mIxRWf64YjUi6yuxwvtI3l
 SXVGxK1D3rCvL7MMQFXo+D9oIxjzz4UsWFJyQWVRASZNskz/SjkGejbXH
 5EIR49rYj7Cz0pKSUABH+yynD4Z8hKKnPC8aOfQLHN/tHKDs2iYMUBr2d
 nLRxzenlZ4gKAPnx5OoMoCF1QBHdj2MYc/m/qEEczxLhzBzT8/eebJXmw Q==;
X-CSE-ConnectionGUID: 3rbA0xJ9Rhqe/yatV87Dow==
X-CSE-MsgGUID: W+ano4/6TFG9zzU3kNIdyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76160017"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="76160017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:39:20 -0800
X-CSE-ConnectionGUID: sf1ScEQaQceXWrPtbgLDag==
X-CSE-MsgGUID: FZN98bGYTIShmvJ7FFqUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222097852"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:39:18 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, mohammed.thasleem@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_vrr: Add new test for DC3CO validation
 with LOBF
Date: Tue,  3 Mar 2026 15:09:27 +0530
Message-ID: <20260303093928.569925-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303093928.569925-1-jeevan.b@intel.com>
References: <20260303093928.569925-1-jeevan.b@intel.com>
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
 tests/kms_vrr.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 569000fee..1f2b4ada8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -29,6 +29,7 @@
  */
 
 #include "igt.h"
+#include "igt_pm.h"
 #include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
@@ -942,6 +943,25 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
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
@@ -1237,6 +1257,16 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
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

