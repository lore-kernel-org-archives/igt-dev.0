Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A2EC88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567FE10E03E;
	Wed, 16 Sep 2026 04:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbGcLp6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C6910E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532805; x=1821068805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4yCazHjpVkZy4eCRalbpbu7qP18Pu8P+wxy4b/VB2uA=;
 b=lbGcLp6tlMq6g4n9GOHG7pFHaDy/xIfYMe4QPzxdR5JyeJNonMUzZ25c
 iAYrEv/CdN8IsNyPqX4PGexhdd+N79IYTFcQs1XX2yxirynGxV/CN6cjQ
 /GQDn7kpqxNR2BCi2WExCq0SppQlHCzQhBSMiJBjlr6ztSRZqUGA+aoob
 kaG7YpYDz6QhHJeUpIwF9Swqv6k43i82ffQFmQFE9KQBQw3sgrhqkQQNT
 yaEt8SqFBxKk7lGy6JHMTOlTaRwHoCgxERC+E7blmrgN2LsRJ88ucOoJG
 39PKZbY1VdqvFszRKLVPa0NCrieOiwfCCpOjMvoqq4vPssSCCPvYwXnL6 w==;
X-CSE-ConnectionGUID: sS7MyL+kQu2hoHJkvKG/bg==
X-CSE-MsgGUID: udM9hLDBR4GrlxNEsSHEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503254"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:44 -0700
X-CSE-ConnectionGUID: gbsBikGJTwC1VcvbbG1SPA==
X-CSE-MsgGUID: udPVYD2pTsGi3od/qa4k5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765063"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:44 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/13] tests/intel/kms_dp_link_training: Add per
 connector mode subtests
Date: Wed, 16 Sep 2026 10:17:58 +0530
Message-Id: <20260916044801.1279102-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

The four existing subtests cover whichever connector mode the machine
presents. On a machine with a Thunderbolt dock they train a tunneled
link, on one without they train a direct link, and the result is
identical either way, so a lab that never had a dock looks the same as
one where the tunnel works.

Add eight subtests selecting links by connector mode:

	uhbr-sst-tbtalt-train        non-uhbr-sst-tbtalt-train
	uhbr-mst-tbtalt-train        non-uhbr-mst-tbtalt-train
	uhbr-sst-direct-train        non-uhbr-sst-direct-train
	uhbr-mst-direct-train        non-uhbr-mst-direct-train

with the same per configuration dynamic subtests as the existing ones.
"direct" is native, DP alt mode and legacy together: they all take the
link clock from the PHY PLL, and only tbt-alt takes it from the
Thunderbolt PLL, so that is the only split that changes which driver
code runs. The raw mode stays in the inventory line, so dp-alt against
legacy is still diagnosable from a failing run.

The connector mode has to be in the static subtest name rather than a
dynamic one, because a dynamic subtest that skips is not counted as
executed: a container with one pass and twenty skips reports PASS, so a
lab with no dock would look green.

Keep the four existing names and their PHY agnostic scope. They are not
redundant: they are what to run on a machine nobody provisioned for
this matrix.

Expect most of the eight to skip on any one machine, since dp-alt and
tbt-alt are mutually exclusive on a port at a given moment. The skip
reasons name the connector mode so the two causes - no such link, and a
link that allows no configuration in the encoding class - stay
greppable apart.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 142 ++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index e6160cee5..229eb3d69 100644
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
@@ -606,7 +672,8 @@ static int discover_links(data_t *data, struct dp_link *links, int max_links)
 	return num_links;
 }
 
-static bool test_link_rate(data_t *data, bool mst, bool uhbr)
+static bool test_link_rate(data_t *data, bool mst, bool uhbr,
+			   enum phy_filter phy)
 {
 	struct dp_link links[MAX_LINKS];
 	bool ran_any_link = false;
@@ -628,6 +695,15 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
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
@@ -665,7 +741,7 @@ int igt_main()
 	igt_subtest_with_dynamic("uhbr-sst") {
 		igt_require_f(intel_display_ver(data.devid) > 13,
 			      "UHBR not supported on platform\n");
-		igt_require_f(test_link_rate(&data, false, true),
+		igt_require_f(test_link_rate(&data, false, true, PHY_ANY),
 			      "Didn't find any SST output with UHBR rates.\n");
 	}
 
@@ -673,22 +749,78 @@ int igt_main()
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

