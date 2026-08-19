Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC21C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 06:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405410E069;
	Wed, 19 Aug 2026 06:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL7fDMdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90E10E069
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 06:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787120865; x=1818656865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dV10ORnjKEewMnLDEQew7XCoTppS9o3GNrOKQqlkARk=;
 b=ZL7fDMdj488BW3TfGuNiPnfW/env1o5vIY/8FlxTxFo7MBHcFPg5rNxs
 uYtYS9MEJjcL6KCv+NmEtLMt7nz7Q0YDn7/s8vAOv5xbYxPyHBp7J5UfT
 1+MwW9f3u8zyhVJLXJcH8mZNe7pKhyekoh+sbbNwkVH6NX/+bcURR4Y9b
 IBIxr79+GmDaT0oe+PlCeLmfjNzIiEfLPlsc3mOjGoH67YDmIZTLLRcam
 eoJ2OsHFB6poIEPbZelCunO+HU4YDq1Yg+HLgRUI/Nqi0KL3/CR8W7NyG
 As+qfaIcTaXI5IWyhIdfxFfTanxXn+Neni6YGSexT2uqRqb3QRpdotSZ4 A==;
X-CSE-ConnectionGUID: //vBT+QUR/SqtX+4gLu1gQ==
X-CSE-MsgGUID: Js+0TGmWSuKX29XVHbNjCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87641699"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87641699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:27:45 -0700
X-CSE-ConnectionGUID: yWwT3QucQc2aENTWhCk3Bw==
X-CSE-MsgGUID: 7HLoh26iRoeMjTyVh8n0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="264132555"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 23:27:44 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 3/3] tests/intel/kms_dp_linktrain_fallback: Add
 UHBR-to-HBR fallback subtest
Date: Wed, 19 Aug 2026 11:57:30 +0530
Message-ID: <20260819062730.1116813-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819062730.1116813-1-sowmiya.s@intel.com>
References: <20260819062730.1116813-1-sowmiya.s@intel.com>
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

Add 'uhbr-to-hbr-fallback' to verify the 128b/132b->8b/10b encoding
transition on UHBR-capable DP connectors by pinning the link at the
highest sustainable UHBR rate, forcing LT_FAILURE_REDUCED_CAPS failures
and asserting the rate drops below UHBR10. Supports SST and MST.

v2: resets MST traversal state per test run (Kunal)
v3: - use i915_dp_is_uhbr_rate()/i915_dp_get_next_lower_rate()
      from lib
    - single UHBR capability gate using max_link_rate after reset
    - add igt_reset_connectors() on pin-loop early-return
    - hard-assert for 'fallback not reached'
    - remove dead run_dsc reset; merge run_* funcs
    - fix link rate log units (10 kbit/s).
    - Extend run_lt_fallback_test() with a force_uhbr parameter
    - and remove the duplicate run_uhbr_to_hbr_fallback_test()
      (Kunal)
    - commit display reset before fallback- Fold patch 4 here
      (Kunal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 199 +++++++++++++++++++++---
 1 file changed, 175 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 44b875ab9..4ceaad8b5 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -24,6 +24,15 @@
  *
  * SUBTEST: dsc-fallback
  * Description: Test fallback to DSC when BW isn't sufficient
+ *
+ * SUBTEST: uhbr-to-hbr-fallback
+ * Description: Verify fallback from UHBR (128b/132b, link rate >= 10 Gbps) to
+ *              HBR3 or lower (8b/10b) on a UHBR-capable DP connector by
+ *              pinning the link at the highest sustainable UHBR rate, forcing
+ *              repeated link training failures and checking that the rate
+ *              drops below UHBR10. Supports both SST and MST (topology-wide)
+ *              outputs; MST siblings share the physical link so fallback
+ *              applies to the whole topology.
  */
 
 #define RETRAIN_COUNT 1
@@ -347,7 +356,20 @@ static bool fix_link_status_and_recommit(data_t *data,
 	return true;
 }
 
-static void test_fallback(data_t *data, bool is_mst)
+/*
+ * test_fallback:
+ * @force_uhbr: when false (dp-fallback), the output is always counted as
+ *		exercised. When true (uhbr-to-hbr-fallback), the link is first
+ *		pinned at the highest sustainable UHBR rate; the return value
+ *		then reports whether the run was skippable (false, e.g. no
+ *		sustainable UHBR rate) so the caller can turn it into a SKIP.
+ *		A genuine failure (UHBR reached but never dropped to HBR) is
+ *		asserted here rather than returned.
+ *
+ * Returns: true if the output was exercised/verified, false for the
+ *	    skippable cases.
+ */
+static bool test_fallback(data_t *data, bool is_mst, bool force_uhbr)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
@@ -361,14 +383,85 @@ static void test_fallback(data_t *data, bool is_mst)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
-	i915_dp_reset_link_params(data->drm_fd, data->output);
-	if (!setup_outputs(data, is_mst, outputs,
-			   &output_count, modes, fbs,
-			   primaries))
-		return;
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_info("Testing link training fallback on %s\n",
-		 igt_output_name(data->output));
+	/*
+	 * For the UHBR-to-HBR fallback case, pin the link at the highest
+	 * sustainable UHBR rate before forcing failures. The caller
+	 * (run_lt_fallback_test()) has already reset the link params for the
+	 * UHBR gate, so i915_dp_get_max_link_rate() here returns the full
+	 * sink-negotiated max and not a value already reduced by an earlier
+	 * fallback. If the physical link can't sustain that rate (cable
+	 * limit), step down to the next-lower supported UHBR rate and retry.
+	 * Skip the test if no UHBR rate can be sustained.
+	 */
+	if (force_uhbr) {
+		int try_rate = i915_dp_get_max_link_rate(data->drm_fd,
+							 data->output);
+		char rate_str[16];
+		/* Preserve MST state for fallback retries. */
+		int saved_mst_count = traversed_mst_output_count;
+
+		curr_link_rate = 0;
+		while (i915_dp_is_uhbr_rate(try_rate)) {
+			/* Allow MST re-discovery on every UHBR-rate attempt. */
+			traversed_mst_output_count = saved_mst_count;
+
+			snprintf(rate_str, sizeof(rate_str), "%d", try_rate);
+			i915_dp_set_link_params(data->drm_fd, data->output,
+						rate_str, "auto");
+
+			if (!setup_outputs(data, is_mst, outputs,
+					   &output_count, modes, fbs, primaries)) {
+				i915_dp_reset_link_params(data->drm_fd,
+							  data->output);
+				igt_reset_connectors();
+				return false;
+			}
+
+			curr_link_rate = i915_dp_get_current_link_rate(data->drm_fd,
+								       data->output);
+			if (i915_dp_is_uhbr_rate(curr_link_rate)) {
+				igt_info("Link trained at UHBR (link rate %d) on %s\n",
+					 curr_link_rate,
+					 igt_output_name(data->output));
+				break;
+			}
+
+			igt_info("Link rate %d not sustained (got %d) on %s, trying next-lower UHBR\n",
+				 try_rate, curr_link_rate,
+				 igt_output_name(data->output));
+			igt_display_reset(&data->display);
+
+			try_rate = i915_dp_get_next_lower_rate(data->drm_fd,
+							       data->output,
+							       try_rate);
+		}
+
+		if (!i915_dp_is_uhbr_rate(curr_link_rate)) {
+			igt_info("Output %s cannot sustain any UHBR rate, skipping\n",
+				 igt_output_name(data->output));
+			i915_dp_reset_link_params(data->drm_fd, data->output);
+			return false;
+		}
+
+		/*
+		 * Clear the pin so the forced-failure loop below can reduce the
+		 * rate. This re-enables all link configs, so max_link_rate
+		 * (read next) is the full negotiated max, not the pinned rate.
+		 * The "curr == max" spurious-HPD escape below therefore won't
+		 * trigger on this path, which is fine - we only care that the
+		 * rate drops out of UHBR.
+		 */
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+	} else {
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+
+		if (!setup_outputs(data, is_mst, outputs,
+				   &output_count, modes, fbs,
+				   primaries))
+			return false;
+	}
 	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
 	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 	prev_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
@@ -389,8 +482,11 @@ static void test_fallback(data_t *data, bool is_mst)
 
 		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
 						      data->output)) {
+			igt_assert_f(!force_uhbr,
+				     "Link retrain disabled before UHBR to HBR fallback on %s\n",
+				     igt_output_name(data->output));
 			igt_reset_connectors();
-			return;
+			return false;
 		}
 
 		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
@@ -421,24 +517,57 @@ static void test_fallback(data_t *data, bool is_mst)
 			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
 			     "Fallback unsuccessful\n");
 
+		/*
+		 * This subtest only cares about the single UHBR -> HBR
+		 * transition (128b/132b to 8b/10b encoding). Stop as soon as
+		 * we've dropped below UHBR10, instead of cascading all the
+		 * way down through the legacy HBR/HBR2/HBR3 rates, which is
+		 * already covered by dp-fallback.
+		 */
+		if (force_uhbr && !i915_dp_is_uhbr_rate(curr_link_rate)) {
+			igt_info("UHBR to HBR fallback confirmed on %s: link rate %d -> %d\n",
+				 igt_output_name(data->output),
+				 prev_link_rate, curr_link_rate);
+			/*
+			 * Link params are already 'auto' (the pin was cleared
+			 * before this loop) and the per-output UHBR gate in
+			 * run_lt_fallback_test() resets again for the next
+			 * output, so this run is already self-contained.
+			 */
+			return true;
+		}
+
 		prev_link_rate = curr_link_rate;
 		prev_lane_count = curr_lane_count;
 	}
+
+	/*
+	 * force_uhbr: the loop only exits here if link retrain got disabled
+	 * before the rate ever dropped out of UHBR, i.e. we trained at UHBR and
+	 * forced failures but never saw the UHBR -> HBR transition. That is a
+	 * real failure, not a skip.
+	 */
+	igt_assert_f(!force_uhbr,
+		     "UHBR to HBR fallback not reached on %s (last link rate %d)\n",
+		     igt_output_name(data->output), prev_link_rate);
+
+	return true;
 }
 
-static bool run_lt_fallback_test(data_t *data)
+static bool run_lt_fallback_test(data_t *data, bool force_uhbr)
 {
 	bool ran = false;
 	igt_output_t *output;
 
 	/*
 	 * Reset per invocation so MST traversal state from a previous subtest
-	 * (e.g. dp-fallback followed by dsc-fallback) doesn't leak and cause
-	 * MST siblings to be silently skipped as "already visited".
+	 * doesn't leak into this run.
 	 */
 	traversed_mst_output_count = 0;
 
 	for_each_connected_output(&data->display, output) {
+		bool is_mst, tested;
+
 		data->output = output;
 
 		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
@@ -450,23 +579,40 @@ static bool run_lt_fallback_test(data_t *data)
 
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
 			igt_info("Skipping output %s as it's not DP\n", output->name);
+			continue;
+		}
+
+		if (force_uhbr) {
+			/*
+			 * Single UHBR-capability gate: reset first so the max
+			 * link rate reflects the full sink-negotiated caps and
+			 * not a value already reduced by an earlier fallback.
+			 */
+			i915_dp_reset_link_params(data->drm_fd, data->output);
+			if (!i915_dp_is_uhbr_rate(i915_dp_get_max_link_rate(data->drm_fd,
+									    data->output))) {
+				igt_info("Skipping output %s: does not support UHBR\n",
+					 igt_output_name(data->output));
 				continue;
+			}
 		}
 
-		ran = true;
+		is_mst = igt_check_output_is_dp_mst(data->output);
+		igt_info("Testing %s%s output %s\n",
+			 force_uhbr ? "UHBR-to-HBR fallback on " : "",
+			 is_mst ? "MST" : "DP",
+			 igt_output_name(data->output));
+
+		tested = test_fallback(data, is_mst, force_uhbr);
 
 		/*
-		 * Check output is MST
+		 * dp-fallback counts every capable output as exercised; the
+		 * UHBR subtest only counts outputs where fallback was actually
+		 * driven (test_fallback() returns false for the skippable
+		 * cases, e.g. no sustainable UHBR rate).
 		 */
-		if (igt_check_output_is_dp_mst(data->output)) {
-			igt_info("Testing MST output %s\n",
-				 igt_output_name(data->output));
-			test_fallback(data, true);
-		} else {
-			igt_info("Testing DP output %s\n",
-				 igt_output_name(data->output));
-			test_fallback(data, false);
-		}
+		if (!force_uhbr || tested)
+			ran = true;
 	}
 	return ran;
 }
@@ -644,7 +790,7 @@ int igt_main()
 	}
 
 	igt_subtest("dp-fallback") {
-		igt_require_f(run_lt_fallback_test(&data),
+		igt_require_f(run_lt_fallback_test(&data, false),
 			      "Skipping test as no output found or none supports fallback\n");
 	}
 
@@ -653,6 +799,11 @@ int igt_main()
 			      "Skipping test as DSC fallback conditions not met.\n");
 	}
 
+	igt_subtest("uhbr-to-hbr-fallback") {
+		igt_require_f(run_lt_fallback_test(&data, true),
+			      "Skipping test: no UHBR-capable DP output found\n");
+	}
+
 	igt_fixture() {
 		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
-- 
2.43.0

