Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB5C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E17510E02D;
	Thu, 30 Jan 2025 17:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVsdIVe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E4310E9B3
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256712; x=1769792712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qyMHibBzWYYeWSm40fEm+XJvDUY7OYTnm3Kr7Ooa1vo=;
 b=fVsdIVe+8XhxAhswAp3yz5Ih7NQTCdMZi/Z8e+GbSXoxhL/gJ9c6TVa/
 10FZzoQbJ8FkAf2D7mFCQEu8cLOk7blaaw3riNLmcO5ftx2djbf05p6tk
 mBeCHV7PNsRyme4N+kdVVf8yI5tzI0JbpZPuDHplhMIvP5zztwi6Oh/IZ
 ORcSSjKggtAl5ibIZuVdBFMaBGYO7aedF/sXPAqN1hPzixvXOofsUy8+u
 g96CW4H4d9vyUZRUopwg+fdH2ayTOwq+ltoRDSLnDisBnuifppU2gOdsE
 mjup6ERMy5VNy9ZKKJScCMtooMMjD6rNxqwl4CAY0XCoNNSMUeHUiacLl w==;
X-CSE-ConnectionGUID: O08MgsaRRmuGLmzRqx5Fmg==
X-CSE-MsgGUID: +J4ncXuBQcyYP9QIULryfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38953388"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38953388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:05:12 -0800
X-CSE-ConnectionGUID: 2E9Knhe6TBiCArysP+mdmg==
X-CSE-MsgGUID: /aVm7DkqRqKvLTKudIinfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241120"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:05:09 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Kunal Joshi <kunal1.joshi@intel.com>, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/6] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Date: Thu, 30 Jan 2025 22:50:28 +0530
Message-Id: <20250130172031.4126606-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

This patch introduces subtests in kms_feature_discovery.c
to validate both UHBR and non-UHBR link rates over SST
and MST configurations. It adds four new subtests
(uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst) that check if
the link rates match the expected UHBR or non-UHBR capability
and whether the outputs are MST or SST. The new test logic
integrates with recently introduced helpers
(kms_joiner_helper and kms_mst_helper) for display
setup and pipe assignment. The meson build script is also
updated to compile these helper sources for kms_feature_discovery.

v2: Add definition for UHBR_LINK_RATE

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_feature_discovery.c | 177 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   4 +
 2 files changed, 181 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5bca9ad76..48e655c6d 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -42,6 +42,8 @@
 #include "igt_psr.h"
 #include "igt_sysfs.h"
 #include "igt_types.h"
+#include "intel/kms_joiner_helper.h"
+#include "intel/kms_mst_helper.h"
 
 /**
  * SUBTEST: display
@@ -71,10 +73,164 @@
  * Test category: functionality test
  *
  * arg[1].values: 1, 2, 3, 4
+ *
+ * SUBTEST: uhbr-sst
+ * Description: Test we can drive UHBR rates over SST.
+ * Functionality: feature_discovery, uhbr, sst
+ * Test category: functionality test
+ *
+ * SUBTEST: uhbr-mst
+ * Description: Test we can drive UHBR rates over MST.
+ * Functionality: feature_discovery, uhbr, mst
+ * Test category: functionality test
+ *
+ * SUBTEST: non-uhbr-sst
+ * Description: Test we can drive non-UHBR rates over SST.
+ * Functionality: feature_discovery, sst
+ * Test category: functionality test
+ *
+ * SUBTEST: non-uhbr-mst
+ * Description: Test we can drive non-UHBR rates over MST.
+ * Functionality: feature_discovery, mst
+ * Test category: functionality test
+ */
+
+/*
+ * DP Spec defines 10, 13.5, and 20 Gbps as UHBR
+ * So considering all below as NON-UHBR
  */
+#define UHBR_LINK_RATE 1000000
 
 static igt_display_t display;
 
+static void setup_planes_fbs(int fd, igt_output_t *outputs[],
+			     int output_count, drmModeModeInfo * mode[],
+			     struct igt_fb fbs[], struct igt_plane *primarys[])
+{
+	int i;
+
+	for (i = 0; i < output_count; i++) {
+		mode[i] = igt_output_get_mode(outputs[i]);
+		igt_info("Mode %dx%d@%d on output %s\n",
+				mode[i]->hdisplay, mode[i]->vdisplay,
+				mode[i]->vrefresh,
+				igt_output_name(outputs[i]));
+		primarys[i] = igt_output_get_plane_type(outputs[i],
+				DRM_PLANE_TYPE_PRIMARY);
+		igt_create_color_fb(fd, mode[i]->hdisplay,
+				mode[i]->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0,
+				&fbs[i]);
+		igt_plane_set_fb(primarys[i], &fbs[i]);
+	}
+}
+
+static bool fit_modes_in_bw(void)
+{
+	bool found;
+	int ret;
+
+	ret = igt_display_try_commit_atomic(&display,
+			DRM_MODE_ATOMIC_TEST_ONLY |
+			DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret != 0) {
+		found = igt_override_all_active_output_modes_to_fit_bw(&display);
+		igt_require_f(found,
+				"No valid mode combo found for modeset\n");
+	}
+	return true;
+}
+
+static void do_modeset(int fd, igt_output_t *output,
+		       bool mst, bool uhbr)
+{
+	int output_count = 0, n_pipes = 0, i;
+	uint32_t master_pipes_mask = 0, valid_pipes_mask = 0, used_pipes_mask = 0;
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	drmModeModeInfo * modes[IGT_MAX_PIPES];
+	struct igt_fb fbs[IGT_MAX_PIPES];
+	struct igt_plane *primarys[IGT_MAX_PIPES];
+
+	for_each_pipe(&display, i) {
+		n_pipes++;
+		valid_pipes_mask = valid_pipes_mask | BIT(i);
+	}
+
+	if (mst)
+		igt_assert_f(igt_find_all_mst_output_in_topology(fd,
+					&display,
+					output,
+					outputs,
+					&output_count),
+				"Unable to find mst outputs\n");
+	else
+		outputs[output_count++] = output;
+
+	igt_assert_f(output_count > 0, "Require at least 1 output\n");
+	igt_set_all_master_pipes_for_platform(&display, &master_pipes_mask);
+	igt_assert_f(igt_assign_pipes_for_outputs(fd, outputs,
+				output_count, n_pipes,
+				&used_pipes_mask,
+				master_pipes_mask,
+				valid_pipes_mask),
+			"Unable to assign pipes for outputs\n");
+	igt_assert_f(fit_modes_in_bw(), "Unable to fit modes in bw\n");
+	setup_planes_fbs(fd, outputs, output_count, modes, fbs, primarys);
+	igt_display_commit2(&display, COMMIT_ATOMIC);
+}
+
+static bool run_link_rate_test(int fd, igt_output_t *output,
+			       bool mst, bool uhbr)
+{
+	bool is_uhbr, is_output_mst;
+
+	igt_display_reset(&display);
+	igt_reset_link_params(fd, output);
+
+	is_output_mst = igt_check_output_is_dp_mst(output);
+	is_uhbr = igt_get_max_link_rate(fd, output) >= UHBR_LINK_RATE;
+
+	if ((mst && !is_output_mst) || (!mst && is_output_mst)) {
+		igt_info("Skipping %s as test expects %s output and output is %s\n", output->name,
+				mst ? "mst" : "sst", is_output_mst ? "mst" : "sst");
+		return false;
+	}
+
+	if ((uhbr && !is_uhbr) || (!uhbr && is_uhbr)) {
+		igt_info("Test expects %s but output %s is %s\n",
+				uhbr ? "uhbr" : "non-uhbr", output->name,
+				is_uhbr ? "uhbr" : "non-uhbr");
+		return false;
+	}
+
+	do_modeset(fd, output, mst, uhbr);
+
+	if (uhbr)
+		return igt_get_current_link_rate(fd, output) >= UHBR_LINK_RATE;
+	else
+		return igt_get_current_link_rate(fd, output) < UHBR_LINK_RATE;
+}
+
+static bool test_link_rate(int fd, bool mst, bool uhbr)
+{
+	bool ran = false;
+	igt_output_t *output;
+
+	igt_skip_on_f(!is_intel_device(fd),
+			"Test supported only on intel platforms\n");
+
+	for_each_connected_output(&display, output) {
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+			ran = ran | run_link_rate_test(fd, output, mst, uhbr);
+		else
+			igt_info("Skipping non DisplayPort output %s\n", output->name);
+	}
+
+	return ran;
+}
+
 IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
 		     "The subtests here should only skip or pass, "
 		     "anything else means we have a serious problem.");
@@ -177,5 +333,26 @@ igt_main {
 			}
 			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
 		}
+
+		igt_describe("Test we can drive UHBR rates over SST");
+		igt_subtest("uhbr-sst")
+			igt_require_f(test_link_rate(fd, false, true),
+					"Didn't find any SST output with uhbr rates");
+
+		igt_describe("Test we can drive UHBR rates over MST");
+		igt_subtest("uhbr-mst")
+			igt_require_f(test_link_rate(fd, true, true),
+					"Didn't find any MST output with uhbr rates");
+
+		igt_describe("Test we can drive non uhbr rates over SST");
+		igt_subtest("non-uhbr-sst")
+			igt_require_f(test_link_rate(fd, false, false),
+					"Didn't find any SST output with non-uhbr rates");
+
+		igt_describe("Test we can drive non uhbr rates over MST");
+		igt_subtest("non-uhbr-mst")
+			igt_require_f(test_link_rate(fd, true, false),
+					"Didn't find any MST output with non-uhbr rates");
+
 	}
 }
diff --git a/tests/meson.build b/tests/meson.build
index 6e321649f..4a76b49a2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -367,6 +367,10 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_feature_discovery': [
+		join_paths ('intel', 'kms_joiner_helper.c'),
+		join_paths ('intel', 'kms_mst_helper.c')
+	],
 	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
 	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
-- 
2.25.1

