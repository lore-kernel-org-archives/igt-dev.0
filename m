Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA3CCD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC9010ECB3;
	Thu, 18 Jun 2026 06:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOunPxSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AB910EC72
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764163; x=1813300163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KR356VUHv7B1YEvcMsqTOKP0Acf6NDw8c7I4WrDmsM=;
 b=YOunPxSZL+Inq5A0A0Rp0B4/ZtvCGImfCOwlQJM4xfXElxQJLTstfjlp
 6x6f8LK1T1q7FWOhnRnj4zt9TUHLfZYxRdDOHyGjvMw17EUhFSAc7q9+0
 4qAqFarU4Fb/OzCT6drZUPZoRc+0gyuvpVTgGnaC0zZ48u2mS+9Bl+jvM
 8VMig2PxxPgXbVsoUYyWaFiBVtOn1s9yV8Gdop/KLoLBABwkpi5KVhsJX
 X9zHx61G06Gt//8VlKPXY5MzaXI9oiS7A9QfIcgHx+Q1tsfNEquJbkJNo
 U66Gat20vuTlsj63NvxPSVxAy+DJuq8gczh3xHC0HoXE8CG/YFc4f0Rej Q==;
X-CSE-ConnectionGUID: TbkBQrYCT3SYPzapNqIORQ==
X-CSE-MsgGUID: GbKmsZUEThCC6oUEyANYpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485882"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:29:22 -0700
X-CSE-ConnectionGUID: wENXH9dDRZuLDahWBiEYWw==
X-CSE-MsgGUID: qjgixz+KRleIXxyizBjgFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245343015"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:29:21 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v10 4/7] tests/kms_vrr: Add new test for DC3CO
 validation with LOBF
Date: Thu, 18 Jun 2026 11:59:01 +0530
Message-ID: <20260618062904.2789476-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062904.2789476-1-jeevan.b@intel.com>
References: <20260618062904.2789476-1-jeevan.b@intel.com>
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

