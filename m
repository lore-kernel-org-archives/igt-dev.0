Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB706CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6DF10EDB9;
	Tue, 29 Sep 2026 09:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g63HAu3A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A899B10EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672716; x=1822208716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nD57ZNlQHYMlSrPv0pw4DKAR7uaJiMRkBG/E4Bx+j6A=;
 b=g63HAu3AvMNmbgN7scRkNCJaxIE1HZpwixwEU5P1lFsOhOselNgxc6Vj
 BWL2/9NM/WMTqJ9G0exY7ppfz6hqkrXH4TgPBxl5j2E8stHtXJbsO5Rpn
 UEOtZN8WdKBuvJYHa85Ga2rGsHu0WXqDFkX6BYfvPDFfspQ1Tpik4MGbO
 BDHHl5D02dGI4RiGUsHsd9dwXYULJUcfhii96dQf4DJ7GGdrw3GygRih1
 /xCWS9+YwsBuNywUfLO1Ingh231e8V99zzYNhP32CgOV4bhMgp6JBjjJC
 Vv/SbYus9Ne6orV8Nbo6sRCSwBnWKcEal5keDFhel+jrq1A7cL3wcWtQd g==;
X-CSE-ConnectionGUID: h4q48k/XTwuA3/AOTht/6A==
X-CSE-MsgGUID: 4kHdXyqCQgKC+ne+CF1PGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483795"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:15 -0700
X-CSE-ConnectionGUID: sURgvCqQS7+BJFH3BeN8OQ==
X-CSE-MsgGUID: n/hqa/GwRZGUwRw0ax5xOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275463009"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:14 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
Date: Tue, 29 Sep 2026 14:34:50 +0530
Message-ID: <20260929090454.2796967-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929090454.2796967-1-sowmiya.s@intel.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
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

Add the alpm-lobf subtest: verifies LOBF (Link-Off Between Frames) can
be enabled on an eDP output once PSR/PSR2/Panel Replay are disabled,
and that Panel Replay stays off while LOBF is active. LOBF is eDP
only, so DP outputs are skipped during enumeration for this subtest.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
 tests/intel/kms_alpm.c | 177 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
index 700d5fb50..914b594bd 100644
--- a/tests/intel/kms_alpm.c
+++ b/tests/intel/kms_alpm.c
@@ -30,12 +30,42 @@
  *              eDP: Panel Replay may use either aux-wake or aux-less ALPM.
  *              On both connector types, LOBF must stay off while Panel
  *              Replay is active.
+ *
+ * SUBTEST: alpm-lobf
+ * Description: Verify LOBF can be enabled on an eDP output once PSR/PSR2/
+ *              Panel Replay are disabled, and that Panel Replay stays off
+ *              while LOBF is active.
  */
 
 #define ALPM_INFO_FILE		"i915_edp_lobf_info"
+#define ALPM_DEBUG_FILE		"i915_edp_lobf_debug"
 #define ALPM_INFO_MAX_LEN	512
 #define ALPM_TIMEOUT_MS		100
 
+/*
+ * LOBF needs longer to settle than PR/aux-less ALPM: after Panel Replay is
+ * disabled and the modeset happens, the link visibly bounces between
+ * aux-wake-only and aux-less-only for a while before the LOBF bit actually
+ * latches, unlike PR which comes up inside ALPM_TIMEOUT_MS. Observed taking
+ * several seconds on a NovaLake eDP panel.
+ */
+#define ALPM_LOBF_TIMEOUT_MS	5000
+
+/*
+ * Mirrors I915_PSR_DEBUG_DISABLE and I915_PSR_DEBUG_PANEL_REPLAY_DISABLE
+ * from intel_display_types.h. intel_alpm_lobf_compute_config_late() kills
+ * has_lobf whenever crtc_state->has_psr is true, and has_psr is set by
+ * intel_psr_compute_config() (intel_psr.c) if *either* Panel Replay or
+ * classic PSR/PSR2 succeeds - so LOBF needs both disabled, not just PR:
+ * DISABLE alone (mode 0x1) only gates classic PSR/PSR2, leaving
+ * panel_replay_global_enabled() untouched (PR keeps winning); PANEL_
+ * REPLAY_DISABLE alone (0x40) only blocks PR, and PSR2 then takes over and
+ * keeps has_psr true instead. Both bits have to be set together.
+ */
+#define PSR_DEBUG_FILE			"i915_edp_psr_debug"
+#define PSR_DEBUG_DISABLE		0x1
+#define PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
+
 /*
  * The kernel gates creation of the ALPM debugfs files on
  * intel_alpm_source_supported(): external DisplayPort needs display ver 35,
@@ -79,6 +109,7 @@ typedef struct {
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	struct igt_fb fb;
+	bool psr_needs_restore;
 } data_t;
 
 static bool output_is_dp(igt_output_t *output);
@@ -296,6 +327,26 @@ static bool alpm_read_status(int drm_fd, igt_output_t *output,
 	return true;
 }
 
+/*
+ * alpm_is_enabled() alone isn't enough here: aux-less-only ALPM (no LOBF)
+ * shows up as "enabled" too, and the trace on a NovaLake eDP panel shows
+ * the link bouncing through exactly that state - and through aux-wake-only
+ * and briefly missing debugfs entirely during the transition - before LOBF
+ * itself latches. Wait on the LOBF bit specifically, with the longer budget
+ * that settling needs.
+ */
+static bool alpm_lobf_active(int drm_fd, igt_output_t *output)
+{
+	struct alpm_status status;
+
+	return alpm_read_status(drm_fd, output, &status) && status.lobf;
+}
+
+static bool alpm_wait_lobf_enabled(int drm_fd, igt_output_t *output)
+{
+	return igt_wait(alpm_lobf_active(drm_fd, output), ALPM_LOBF_TIMEOUT_MS, 50);
+}
+
 /*
  * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under the
  * device debugfs dir. Some kernels only ever expose the legacy single-eDP
@@ -342,6 +393,43 @@ static void alpm_dump_status(int drm_fd, igt_output_t *output)
 		 status.lobf ? "enabled" : "disabled");
 }
 
+/*
+ * The debug knob holds intel_dp->alpm.lobf_disable_debug, consumed by
+ * intel_alpm_lobf_compute_config() at atomic check time. Writing it therefore
+ * has no effect until the next modeset.
+ *
+ * Since "drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf" ties
+ * has_alpm to has_lobf, this is also the only userspace control that can take
+ * ALPM itself down on an otherwise idle DP link.
+ */
+static bool alpm_set_disable_debug(int drm_fd, igt_output_t *output,
+				   bool disable)
+{
+	const char *val = disable ? "1" : "0";
+
+	return igt_debugfs_write_connector_file(drm_fd, output->name,
+						ALPM_DEBUG_FILE,
+						val, strlen(val)) == 0;
+}
+
+/*
+ * i915_edp_psr_debug is global (one file for the whole display, applied to
+ * every PSR-capable encoder), not per-connector - see the FIXME in
+ * lib/igt_psr.c's psr_write(). "0x0" restores I915_PSR_DEBUG_DEFAULT.
+ */
+static bool set_psr_pr_disable_debug(int debugfs_fd, bool disable)
+{
+	char val[8];
+	int ret;
+
+	snprintf(val, sizeof(val), "0x%x",
+		 disable ? (PSR_DEBUG_DISABLE | PSR_DEBUG_PANEL_REPLAY_DISABLE) : 0);
+
+	ret = igt_sysfs_write(debugfs_fd, PSR_DEBUG_FILE, val, strlen(val));
+
+	return ret == (int)strlen(val);
+}
+
 /*
  * Light the output up. ALPM on an idle link is reached via LOBF, which
  * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the mode is
@@ -374,7 +462,27 @@ static void test_cleanup(data_t *data)
 	igt_output_t *output = data->output;
 	igt_plane_t *primary;
 
-	/* Clear any output mode override left behind by the mode under test. */
+	/*
+	 * Clear the debug override unconditionally. A subtest that fails
+	 * midway would otherwise leave it set, suppressing ALPM for
+	 * everything that runs afterwards on this machine.
+	 */
+	if (alpm_has_debugfs(data->drm_fd, output))
+		alpm_set_disable_debug(data->drm_fd, output, false);
+
+	/*
+	 * test_alpm_lobf() sets PSR_DEBUG_DISABLE | PSR_DEBUG_PANEL_REPLAY_
+	 * DISABLE in the global i915_edp_psr_debug file. That write outlives
+	 * this dynamic subtest (all of them share one process), so every
+	 * later output/subtest would run with PSR/PR forced off unless it is
+	 * put back here.
+	 */
+	if (data->psr_needs_restore) {
+		set_psr_pr_disable_debug(data->debugfs_fd, false);
+		data->psr_needs_restore = false;
+	}
+
+	/* Clear any output mode override, matching the debug-state resets above. */
 	igt_output_override_mode(output, NULL);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -471,6 +579,55 @@ static void test_alpm_panel_replay(data_t *data)
 		 output->name, alpm_mode_str(output, &status));
 }
 
+/*
+ * LOBF is eDP only (DP2.1 ALPM only ever runs through Panel Replay, see
+ * test_alpm_panel_replay()). intel_alpm_lobf_compute_config_late() (kernel
+ * intel_alpm.c) unconditionally clears has_lobf whenever crtc_state->has_psr
+ * is true, and intel_psr_compute_config() (intel_psr.c) sets has_psr from
+ * *either* Panel Replay or classic PSR/PSR2 succeeding - so both have to be
+ * disabled together, not just PR: PSR_DEBUG_DISABLE alone leaves Panel
+ * Replay's own enable check untouched (PR keeps winning), and PSR_DEBUG_
+ * PANEL_REPLAY_DISABLE alone just lets PSR2 take over and keep has_psr true
+ * instead. psr_disable()'s plain I915_PSR_DEBUG_DISABLE write is therefore
+ * the wrong knob here.
+ */
+static void test_alpm_lobf(data_t *data)
+{
+	igt_output_t *output = data->output;
+	struct alpm_status status;
+
+	igt_require_f(!output_is_dp(output), "%s: LOBF is eDP only\n", output->name);
+
+	require_no_audio(data, output);
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output)) {
+		igt_require_f(set_psr_pr_disable_debug(data->debugfs_fd, true),
+			      "%s: failed to write %s\n", output->name, PSR_DEBUG_FILE);
+		data->psr_needs_restore = true;
+	}
+
+	test_setup(data);
+
+	alpm_dump_status(data->drm_fd, output);
+
+	igt_require_f(alpm_wait_lobf_enabled(data->drm_fd, output),
+		      "%s: LOBF not enabled after modeset\n", output->name);
+
+	igt_require(alpm_read_status(data->drm_fd, output, &status));
+
+	igt_assert_f(status.lobf,
+		     "%s: ALPM enabled but not via LOBF\n", output->name);
+
+	igt_assert_f(!psr_panel_replay_enabled(data->debugfs_fd, output),
+		     "%s: Panel Replay must not be active while LOBF is enabled\n",
+		     output->name);
+
+	igt_info("%s: LOBF active, ALPM mode %s\n",
+		 output->name, alpm_mode_str(output, &status));
+}
+
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_output_t *output;
@@ -481,6 +638,18 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		if (!output_is_alpm_capable_type(output))
 			continue;
 
+		/*
+		 * LOBF never latches on DP: has_lobf is unconditionally
+		 * cleared whenever has_psr is set, and DP always sets has_psr
+		 * via Panel Replay (see test_alpm_lobf()). Skip enumeration
+		 * entirely instead of creating a dynamic subtest that always
+		 * SKIPs.
+		 */
+		if (test == test_alpm_lobf && output_is_dp(output)) {
+			igt_info("%s: skipping, LOBF is eDP only\n", output->name);
+			continue;
+		}
+
 		for_each_crtc(&data->display, crtc) {
 			igt_display_reset(&data->display);
 			igt_output_set_crtc(output, crtc);
@@ -526,6 +695,12 @@ int igt_main()
 	igt_subtest_with_dynamic("alpm-panel-replay")
 		run_test(&data, test_alpm_panel_replay);
 
+	igt_describe("Verify LOBF can be enabled on an eDP output once PSR/PSR2/"
+		     "Panel Replay are disabled, with Panel Replay staying off "
+		     "while LOBF is active.");
+	igt_subtest_with_dynamic("alpm-lobf")
+		run_test(&data, test_alpm_lobf);
+
 	igt_fixture() {
 		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
-- 
2.43.0

