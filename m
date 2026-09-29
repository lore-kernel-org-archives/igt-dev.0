Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C94CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC210EDBB;
	Tue, 29 Sep 2026 09:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu4Bq/cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E2C10EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672714; x=1822208714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qwq/2Q0d9ddNsG2tXeaJYu9ACMLi3RLJzzo+t8ZhzZw=;
 b=mu4Bq/clahS0d/r7sSihJ/SNXaPNRRyPY4xXQm+V//T6TfexfKs0WTJI
 Ae35uknafgM2L5lZzuykGRNaz8Gykc67prSk6YUoRpYOHuXDNHWVajtBH
 mHh+MnirWPswLd015uqZwt0ETxNj20/1Q7dnz23sQ9sY3kTTiNy9XECjv
 xLEAZEG3JsIONDH0dal99+wvwRv+MWivBSFsxnWjBkN9dTDBSKp6V9eHv
 gPaBx5Z2elo0VBib7FTN8Xb27Mm8w5Yc8hAVrQe6MN/KI/R6ksSvoX6yD
 33u4I8EKWHaHR6CCM1CGtgRZ6SZVkgjtcZB9RAhc/rt0vXgDZKgl9BHft g==;
X-CSE-ConnectionGUID: 8uHZUedbSyeKZylQvbyFWw==
X-CSE-MsgGUID: 9P082rHnR0qhritS6tif6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483794"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:14 -0700
X-CSE-ConnectionGUID: uUe9VLn4Q6OE6WGNkqka0A==
X-CSE-MsgGUID: VrUbPCuzSc+0LnW4y3E6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275462990"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:12 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 4/5] tests/intel/kms_alpm: add ALPM Panel Replay
 subtest
Date: Tue, 29 Sep 2026 14:34:49 +0530
Message-ID: <20260929090454.2796967-5-sowmiya.s@intel.com>
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

Add a new kms_alpm test covering ALPM (Advanced Link Power Management)
on eDP and DP 2.1 outputs, with the alpm-panel-replay subtest: verifies
ALPM is reached via Panel Replay after a modeset, using aux-less ALPM
on DP and either aux-wake or aux-less on eDP, with LOBF staying off
while Panel Replay is active.

alpm_dump_status(), require_no_audio(), test_setup() and run_test()
are all called for the first time here (directly or via
test_alpm_panel_replay() and its igt_main() wiring), so their
__maybe_unused markers from the previous patches are dropped.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
 tests/intel/kms_alpm.c | 85 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
index b38e7f8ce..700d5fb50 100644
--- a/tests/intel/kms_alpm.c
+++ b/tests/intel/kms_alpm.c
@@ -23,6 +23,15 @@
 #include "igt_sysfs.h"
 #include "intel_chipset.h"
 
+/**
+ * SUBTEST: alpm-panel-replay
+ * Description: Verify ALPM is reached via Panel Replay after a modeset.
+ *              DP 2.1: Panel Replay must use aux-less ALPM.
+ *              eDP: Panel Replay may use either aux-wake or aux-less ALPM.
+ *              On both connector types, LOBF must stay off while Panel
+ *              Replay is active.
+ */
+
 #define ALPM_INFO_FILE		"i915_edp_lobf_info"
 #define ALPM_INFO_MAX_LEN	512
 #define ALPM_TIMEOUT_MS		100
@@ -287,7 +296,34 @@ static bool alpm_read_status(int drm_fd, igt_output_t *output,
 	return true;
 }
 
-__maybe_unused
+/*
+ * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under the
+ * device debugfs dir. Some kernels only ever expose the legacy single-eDP
+ * "i915_edp_psr_status" at the top level instead (no connector
+ * subdirectory) - confirmed on a NovaLake box where the connector-scoped
+ * path 404s but /sys/kernel/debug/dri/0/i915_edp_psr_status has the real
+ * "PSR mode: Panel Replay ... enabled" line. Fall back to that legacy path
+ * (psr_get_mode(fd, NULL)) whenever the connector-scoped read comes back
+ * disabled, so this works on both layouts.
+ */
+static bool psr_panel_replay_enabled(int debugfs_fd, igt_output_t *output)
+{
+	enum psr_mode mode = psr_get_mode(debugfs_fd, output);
+
+	if (mode == PSR_DISABLED)
+		mode = psr_get_mode(debugfs_fd, NULL);
+
+	return mode == PR_MODE || mode == PR_MODE_SEL_FETCH ||
+	       mode == PR_MODE_SEL_FETCH_ET;
+}
+
+static bool psr_wait_panel_replay_enabled(int debugfs_fd, igt_output_t *output,
+					  bool enabled)
+{
+	return igt_wait(psr_panel_replay_enabled(debugfs_fd, output) == enabled,
+			ALPM_TIMEOUT_MS, 1);
+}
+
 static void alpm_dump_status(int drm_fd, igt_output_t *output)
 {
 	struct alpm_status status;
@@ -312,7 +348,6 @@ static void alpm_dump_status(int drm_fd, igt_output_t *output)
  * committed without ever setting VRR_ENABLED; the driver still runs the VRR
  * timing generator on the platforms that support ALPM.
  */
-__maybe_unused
 static void test_setup(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -390,7 +425,6 @@ static void require_alpm_capable(data_t *data, igt_output_t *output)
  * subtests would report a failure on the large majority of real DisplayPort
  * monitors.
  */
-__maybe_unused
 static void require_no_audio(data_t *data, igt_output_t *output)
 {
 	igt_require_f(!sink_supports_audio(data->drm_fd, output),
@@ -398,7 +432,45 @@ static void require_no_audio(data_t *data, igt_output_t *output)
 		      output->name);
 }
 
-__maybe_unused
+/*
+ * Covers "alpm_init() for DP2.1", "Replace is_edp() with alpm_is_possible()"
+ * and "Introduce has_alpm to decouple from pr/psr2/lobf": on an external DP
+ * link none of the ALPM programming happens at all before those patches.
+ *
+ * DP only has one legal ALPM mechanism (Panel Replay, aux-less); eDP may
+ * reach ALPM via Panel Replay (either aux flavor) or via LOBF, but never
+ * both, so this subtest only cares that Panel Replay is what came up and
+ * that LOBF stayed off while it did.
+ */
+static void test_alpm_panel_replay(data_t *data)
+{
+	igt_output_t *output = data->output;
+	struct alpm_status status;
+
+	require_no_audio(data, output);
+
+	test_setup(data);
+
+	alpm_dump_status(data->drm_fd, output);
+
+	igt_require_f(psr_wait_panel_replay_enabled(data->debugfs_fd, output, true),
+		      "%s: Panel Replay not enabled after modeset\n", output->name);
+
+	igt_require(alpm_read_status(data->drm_fd, output, &status));
+
+	igt_assert_f(!status.lobf,
+		     "%s: LOBF must not be enabled while Panel Replay is active\n",
+		     output->name);
+
+	if (output_is_dp(output))
+		igt_assert_f(status.aux_less,
+			     "%s: DP must use aux-less ALPM under Panel Replay\n",
+			     output->name);
+
+	igt_info("%s: Panel Replay active, ALPM mode %s\n",
+		 output->name, alpm_mode_str(output, &status));
+}
+
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_output_t *output;
@@ -449,6 +521,11 @@ int igt_main()
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Verify ALPM is reached via Panel Replay after a modeset, "
+		     "with LOBF staying off while it is active.");
+	igt_subtest_with_dynamic("alpm-panel-replay")
+		run_test(&data, test_alpm_panel_replay);
+
 	igt_fixture() {
 		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
-- 
2.43.0

