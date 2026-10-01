Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37C8CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF7D10F5AB;
	Thu,  1 Oct 2026 07:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aupuvz27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC61410F59E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838998; x=1822374998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFzsZtf2pO8A0RxzJ0CikEE6B6Uu0B0bKSBzAH51MhA=;
 b=aupuvz27Wbn/Kpc3xgRIQksq4iIVdkleI4wlfzbMnAtt178x0+QhXcwk
 BNcSeM4GM2n6EjgUUuNVVWATeDae2BBj9GM3a/ePB17ymiAuQT2lSCCGU
 YUK2a8fU96+9QW0GGN5O9a8hjaNGGsjngtjWV0VkThPppekO/NNEPQUHT
 Y3pTpg2zpm9jiustF9GUaYtJxikg9nKBEEtE65g+zlc8VMBSdWQ2Dk9wu
 W0GOp1cFk7oczVd1/tda9R/8odeCEU4yWJQEB+HIESgz7Pv25z5le7/1w
 tTGQrk/PXmqm0HHusgNXuYfGHqIZC6GDJogNH8xk9oj7RYBQEzmQFE58O w==;
X-CSE-ConnectionGUID: slS+7F+AQMqarFUIRMCV4A==
X-CSE-MsgGUID: GUcPB+QKSa+p0iLcf3MeMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605997"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:56 -0700
X-CSE-ConnectionGUID: kmJNIiXwQFqt3S5ndb3I7g==
X-CSE-MsgGUID: T4Q1H7TwR+mJf3uoadFuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138336"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 10/13] tests/intel/kms_dp_link_training: add tbt-alt and
 direct link subtests
Date: Thu,  1 Oct 2026 13:07:00 +0530
Message-Id: <20261001073703.5067-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

The existing subtests pass the same with or without a Thunderbolt dock,
so there's no telling whether the tunneled path was tested at all.

Add {uhbr,non-uhbr}-{sst,mst}-{tbtalt,direct}-train subtests, which
filter the links by Type-C port mode. Only tbt-alt uses the Thunderbolt
PLL, so lump native, dp-alt and legacy together as direct.

The mode needs to be in the subtest name, not in the dynamic subtest
name. Otherwise, a missing dock would just mean fewer dynamic subtests,
and the subtest would still pass.

Keep the existing subtests for machines not set up for the new ones.
Expect most of the new ones to skip on any given machine.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_link_training.c | 142 ++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 477dc03ba..8f99f43f0 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -21,6 +21,40 @@
  * Description: Test we can drive non-UHBR rates over MST.
  */
 
+/**
+ * SUBTEST: uhbr-sst-tbtalt-train
+ * Description: Test we can drive UHBR rates over an SST link tunneled over
+ *              USB4/Thunderbolt.
+ *
+ * SUBTEST: uhbr-mst-tbtalt-train
+ * Description: Test we can drive UHBR rates over an MST link tunneled over
+ *              USB4/Thunderbolt.
+ *
+ * SUBTEST: uhbr-sst-direct-train
+ * Description: Test we can drive UHBR rates over a directly connected SST
+ *              link.
+ *
+ * SUBTEST: uhbr-mst-direct-train
+ * Description: Test we can drive UHBR rates over a directly connected MST
+ *              link.
+ *
+ * SUBTEST: non-uhbr-sst-tbtalt-train
+ * Description: Test we can drive non-UHBR rates over an SST link tunneled over
+ *              USB4/Thunderbolt.
+ *
+ * SUBTEST: non-uhbr-mst-tbtalt-train
+ * Description: Test we can drive non-UHBR rates over an MST link tunneled over
+ *              USB4/Thunderbolt.
+ *
+ * SUBTEST: non-uhbr-sst-direct-train
+ * Description: Test we can drive non-UHBR rates over a directly connected SST
+ *              link.
+ *
+ * SUBTEST: non-uhbr-mst-direct-train
+ * Description: Test we can drive non-UHBR rates over a directly connected MST
+ *              link.
+ */
+
 #include "i915/i915_dp.h"
 #include "igt.h"
 #include "igt_kms.h"
@@ -60,6 +94,38 @@ struct dp_link {
 	enum i915_dp_tc_mode tc_mode;
 };
 
+/*
+ * enum phy_filter - Which links a subtest selects.
+ *
+ * PHY_ANY is the PHY agnostic scope of the original subtests. The split
+ * between PHY_TBTALT and PHY_DIRECT is where the link clock comes from: only a
+ * tbt-alt link is clocked by the Thunderbolt PLL, native, DP alt mode and
+ * legacy all use the PHY PLL, so folding the latter three together does not
+ * change which driver code runs.
+ */
+enum phy_filter {
+	PHY_ANY,
+	PHY_TBTALT,
+	PHY_DIRECT,
+};
+
+static const char *phy_filter_name(enum phy_filter phy)
+{
+	return phy == PHY_TBTALT ? "tbt-alt" : "direct";
+}
+
+static bool link_matches_phy(const struct dp_link *link, enum phy_filter phy)
+{
+	switch (phy) {
+	case PHY_TBTALT:
+		return link->tc_mode == I915_DP_TC_TBT_ALT;
+	case PHY_DIRECT:
+		return link->tc_mode != I915_DP_TC_TBT_ALT;
+	default:
+		return true;
+	}
+}
+
 /*
  * check_condition_with_timeout - Polls check_fn until it returns 0
  * or until 'timeout' seconds elapse.
@@ -609,7 +675,8 @@ static int discover_links(data_t *data, struct dp_link *links, int max_links)
 	return num_links;
 }
 
-static bool test_link_rate(data_t *data, bool mst, bool uhbr)
+static bool test_link_rate(data_t *data, bool mst, bool uhbr,
+			   enum phy_filter phy)
 {
 	struct dp_link links[MAX_LINKS];
 	bool ran_any_link = false;
@@ -631,6 +698,15 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 			continue;
 		}
 
+		if (!link_matches_phy(&links[i], phy)) {
+			igt_info("Skipping %s: %s requested but it's %s.\n",
+				 igt_output_name(links[i].output),
+				 phy_filter_name(phy),
+				 i915_dp_tc_mode_name(links[i].tc_mode));
+			igt_info("----------------------------------------------------\n");
+			continue;
+		}
+
 		data->output = links[i].output;
 		igt_info("Running link training test for %s\n",
 			 igt_output_name(data->output));
@@ -668,7 +744,7 @@ int igt_main()
 	igt_subtest_with_dynamic("uhbr-sst") {
 		igt_require_f(intel_display_ver(data.devid) > 13,
 			      "UHBR not supported on platform\n");
-		igt_require_f(test_link_rate(&data, false, true),
+		igt_require_f(test_link_rate(&data, false, true, PHY_ANY),
 			      "Didn't find any SST output with UHBR rates.\n");
 	}
 
@@ -676,22 +752,78 @@ int igt_main()
 	igt_subtest_with_dynamic("uhbr-mst") {
                 igt_require_f(intel_display_ver(data.devid) > 13,
                               "UHBR not supported on platform\n");
-		igt_require_f(test_link_rate(&data, true, true),
+		igt_require_f(test_link_rate(&data, true, true, PHY_ANY),
 			      "Didn't find any MST output with UHBR rates.\n");
 	}
 
 	igt_describe("Test we can drive NON-UHBR rates over SST");
 	igt_subtest_with_dynamic("non-uhbr-sst") {
-		igt_require_f(test_link_rate(&data, false, false),
+		igt_require_f(test_link_rate(&data, false, false, PHY_ANY),
 			      "Didn't find any SST output with NON-UHBR rates.\n");
 	}
 
 	igt_describe("Test we can drive NON-UHBR rates over MST");
 	igt_subtest_with_dynamic("non-uhbr-mst") {
-		igt_require_f(test_link_rate(&data, true, false),
+		igt_require_f(test_link_rate(&data, true, false, PHY_ANY),
 			      "Didn't find any MST output with NON-UHBR rates.\n");
 	}
 
+	igt_describe("Test we can drive UHBR rates over a tunneled SST link");
+	igt_subtest_with_dynamic("uhbr-sst-tbtalt-train") {
+		igt_require_f(intel_display_ver(data.devid) > 13,
+			      "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, false, true, PHY_TBTALT),
+			      "No tbt-alt DP SST link allows a UHBR config\n");
+	}
+
+	igt_describe("Test we can drive UHBR rates over a tunneled MST link");
+	igt_subtest_with_dynamic("uhbr-mst-tbtalt-train") {
+		igt_require_f(intel_display_ver(data.devid) > 13,
+			      "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, true, true, PHY_TBTALT),
+			      "No tbt-alt DP MST link allows a UHBR config\n");
+	}
+
+	igt_describe("Test we can drive UHBR rates over a direct SST link");
+	igt_subtest_with_dynamic("uhbr-sst-direct-train") {
+		igt_require_f(intel_display_ver(data.devid) > 13,
+			      "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, false, true, PHY_DIRECT),
+			      "No direct DP SST link allows a UHBR config\n");
+	}
+
+	igt_describe("Test we can drive UHBR rates over a direct MST link");
+	igt_subtest_with_dynamic("uhbr-mst-direct-train") {
+		igt_require_f(intel_display_ver(data.devid) > 13,
+			      "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, true, true, PHY_DIRECT),
+			      "No direct DP MST link allows a UHBR config\n");
+	}
+
+	igt_describe("Test we can drive non-UHBR rates over a tunneled SST link");
+	igt_subtest_with_dynamic("non-uhbr-sst-tbtalt-train") {
+		igt_require_f(test_link_rate(&data, false, false, PHY_TBTALT),
+			      "No tbt-alt DP SST link allows a non-UHBR config\n");
+	}
+
+	igt_describe("Test we can drive non-UHBR rates over a tunneled MST link");
+	igt_subtest_with_dynamic("non-uhbr-mst-tbtalt-train") {
+		igt_require_f(test_link_rate(&data, true, false, PHY_TBTALT),
+			      "No tbt-alt DP MST link allows a non-UHBR config\n");
+	}
+
+	igt_describe("Test we can drive non-UHBR rates over a direct SST link");
+	igt_subtest_with_dynamic("non-uhbr-sst-direct-train") {
+		igt_require_f(test_link_rate(&data, false, false, PHY_DIRECT),
+			      "No direct DP SST link allows a non-UHBR config\n");
+	}
+
+	igt_describe("Test we can drive non-UHBR rates over a direct MST link");
+	igt_subtest_with_dynamic("non-uhbr-mst-direct-train") {
+		igt_require_f(test_link_rate(&data, true, false, PHY_DIRECT),
+			      "No direct DP MST link allows a non-UHBR config\n");
+	}
+
 	igt_fixture() {
 		igt_reset_connectors();
 		igt_display_fini(&data.display);
-- 
2.25.1

