Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEDDE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 13:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822610E67C;
	Tue, 31 Dec 2024 13:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAw4H9ru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FAE10E2A4
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735653588; x=1767189588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdsKHRisksQ3JbyPSHi2dVuuSRbH5ffW9SRrup1JPkQ=;
 b=OAw4H9ruKhKS/PqfYV/uALZPuydkNh2VpLfgo5uW82UHaJwrSz6uBx4j
 rlZ6RI9s9NrdTnveKswbuUfy2JTaVtDOL7VdZkHYm2ttu65kk5IgrZBPX
 GNBCo2+XjwMiJeWEUeGh5aVYjcF9PIopzvcYra6qO55eZSjdp0J9HnIBL
 OgaAZabiNs/AttJlukmp2becSbeQkCMksyg18/5JllmbaSIh6N1/jXom4
 1NqlpNIt20xqAuS1aRpkwf6ckFXUGgQSPJ2jUTHqm0FEOh1rUcDJOxy7B
 eQq8dCdDZBmfghdL4B0Npmp/t4FBh+ER8onEpRJtQfvOlFE3uwEoDlutS A==;
X-CSE-ConnectionGUID: 8E8jWccFTYaPXmxfqVvq0w==
X-CSE-MsgGUID: B093+I/RQfyualLO4IL4Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36047318"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36047318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 05:59:48 -0800
X-CSE-ConnectionGUID: i5RzcHsXS/ucfIO5vjC3OQ==
X-CSE-MsgGUID: 130UlUhCQmm/mmsDQPCw6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="100820140"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:59:46 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Date: Tue, 31 Dec 2024 19:45:17 +0530
Message-Id: <20241231141518.765212-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231141518.765212-1-kunal1.joshi@intel.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_feature_discovery.c | 171 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   4 +
 2 files changed, 175 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5bca9ad76..150c10fba 100644
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
@@ -71,10 +73,158 @@
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
  */
 
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
+	is_uhbr = igt_get_max_link_rate(fd, output) > 810000;
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
+		return igt_get_current_link_rate(fd, output) > 810000;
+	else
+		return igt_get_current_link_rate(fd, output) <= 810000;
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
@@ -177,5 +327,26 @@ igt_main {
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
index ffbe1211e..db8919ebc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -366,6 +366,10 @@ extra_sources = {
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

