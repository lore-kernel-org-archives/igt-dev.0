Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A8ECA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E128D10F59D;
	Thu,  1 Oct 2026 07:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYtEB2Kq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81610F59E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838998; x=1822374998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAaYwJLZKg+2Vz7zo/ghhkNUR99kiJ7Xr8dGAAqZT98=;
 b=mYtEB2Kq7a3noTrpr2MBQRQap8dx4IMRU43wToj3JirTxY3/gJfz5F9M
 gbpglHPg5SwtXnzWqo9KV3sOgicC/d4bySHkpicD5BUndeTremdAHpMtf
 G26e1gjVQKwUJ7giK2pOB35UoTMq/v591mmxWXoEnpG3HnPpkjIP2O55T
 jIXHq7BK674lXs6arxOuAX8bbIgxNBormz3iApwcik+kmTPoKcb0PLsyJ
 rrRQFHcQoo3rti9al2JHLth2Y5WvF3RW2GBCZPSRY45xxqEec88/wN5vE
 a4k2SNhVN4UPH8BfIgKp74N0zI+4IOSRpp/Hqgz7ZFueOY/168XjtLmkw g==;
X-CSE-ConnectionGUID: MlGK4JqdQta3utuNPgeg+g==
X-CSE-MsgGUID: VpPjEXMtRnyenQ8IW77pUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91606007"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91606007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:16:00 -0700
X-CSE-ConnectionGUID: 60GmXRiqQUO9XFJFExTKlg==
X-CSE-MsgGUID: ldA/wRCiQUOYGR0tIgnH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138347"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:16:00 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 13/13] tests/intel/kms_dp_link_training: check the link
 from the sink side
Date: Thu,  1 Oct 2026 13:07:03 +0530
Message-Id: <20261001073703.5067-14-kunal1.joshi@intel.com>
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

All the checks so far are based on what the driver reports. After
training, also check the sink's DPCD. The channel coding must be
128b/132b for UHBR and 8b/10b otherwise, and all the lanes in use must
be locked.

If the DPCD can't be read, skip rather than pass on the driver side
checks alone. If there's no AUX device at all, only log it, and carry
on without the sink side checks. CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV
isn't enabled by default, and its absence says nothing about the link.

For MST, use the AUX of the root connector. The stream connector's AUX
goes to the far end sink via sideband messages, not the link partner.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_link_training.c | 91 +++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 8f99f43f0..c1f5d45df 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -55,8 +55,11 @@
  *              link.
  */
 
+#include <string.h>
+
 #include "i915/i915_dp.h"
 #include "igt.h"
+#include "igt_dp.h"
 #include "igt_kms.h"
 #include "intel/kms_joiner_helper.h"
 #include "intel/kms_mst_helper.h"
@@ -80,6 +83,7 @@ typedef struct {
 	uint32_t devid;
 	igt_display_t display;
 	igt_output_t *output;
+	int aux_fd;
 } data_t;
 
 /*
@@ -325,6 +329,79 @@ static void assert_link_retrain_not_disabled(data_t *data,
 	} while (elapsed < LINK_RECOVERY_TIMEOUT);
 }
 
+/*
+ * open_link_aux - Open the AUX device at the near end of the link.
+ *
+ * An MST stream connector's AUX reaches the far sink over sideband rather than
+ * the link partner, which is the end of the link being trained, so for MST it
+ * is the topology's root connector that has to be asked. The root reads
+ * disconnected while MST is active, so it is found by id rather than by
+ * walking the connected outputs.
+ */
+static int open_link_aux(data_t *data, bool mst)
+{
+	igt_output_t *output = data->output;
+
+	if (mst) {
+		int root_id = igt_get_dp_mst_connector_id(data->output);
+		int i;
+
+		output = NULL;
+
+		for (i = 0; i < data->display.n_outputs; i++) {
+			igt_output_t *root = &data->display.outputs[i];
+
+			if (root->config.connector &&
+			    root->config.connector->connector_id == root_id) {
+				output = root;
+				break;
+			}
+		}
+
+		if (!output)
+			return -ENOENT;
+	}
+
+	return igt_dp_aux_open(data->drm_fd, output);
+}
+
+/*
+ * assert_sink_agrees - Ask the sink whether the link is really up.
+ *
+ * Everything else the test checks is read back from the driver. This is the
+ * only check that the sink agrees, and the only direct evidence of which
+ * channel coding reached the wire.
+ *
+ * A DPCD the test could open but cannot read leaves the case unverified, so
+ * skip rather than report it as trained. A missing AUX device does not: AUX is
+ * out of band and answers whether or not the link trained, so a read that
+ * fails once the device is open is a result in itself, while
+ * CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV not being enabled - it is not by default -
+ * says nothing about the link and would take every driver side check down with
+ * it.
+ */
+static void assert_sink_agrees(data_t *data,
+			       const struct i915_dp_link_config *config)
+{
+	bool uhbr = i915_dp_is_uhbr_rate(config->link_rate);
+	int ret;
+
+	if (data->aux_fd < 0)
+		return;
+
+	ret = igt_dp_channel_coding_ok(data->aux_fd, uhbr);
+	igt_skip_on_f(ret < 0, "Unable to read the sink's channel coding: %s\n",
+		      strerror(-ret));
+	igt_assert_f(ret, "Sink is not set to %s at rate %d\n",
+		     uhbr ? "128b/132b" : "8b/10b", config->link_rate);
+
+	ret = igt_dp_link_status_ok(data->aux_fd, config->lane_count, uhbr);
+	igt_skip_on_f(ret < 0, "Unable to read the sink's link status: %s\n",
+		      strerror(-ret));
+	igt_assert_f(ret, "Sink does not report %d lanes locked at rate %d\n",
+		     config->lane_count, config->link_rate);
+}
+
 /*
  * train_link_config - Force one link configuration, re-establish the link and
  * check that the configuration took effect and survived training.
@@ -368,6 +445,8 @@ static void train_link_config(data_t *data, bool mst,
 	 * count resets the recovery state, which would mask the failure.
 	 */
 	assert_link_retrain_not_disabled(data, config);
+
+	assert_sink_agrees(data, config);
 }
 
 /*
@@ -569,6 +648,11 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 							       data->output),
 		      "Kernel has no intel_dp_allowed_link_configs debugfs\n");
 
+	data->aux_fd = open_link_aux(data, mst);
+	if (data->aux_fd < 0)
+		igt_info("%s: no AUX device (%s), sink side checks are skipped\n",
+			 igt_output_name(data->output), strerror(-data->aux_fd));
+
 	/*
 	 * Enumerate with the forced parameters reset, or the set being read is
 	 * the forced one rather than the one the driver would pick from.
@@ -606,6 +690,11 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 		igt_info("Output %s allows no %sUHBR link config\n",
 			 igt_output_name(data->output), uhbr ? "" : "non-");
 
+	if (data->aux_fd >= 0) {
+		close(data->aux_fd);
+		data->aux_fd = -1;
+	}
+
 	igt_info("----------------------------------------------------\n");
 	return num_dynamics > 0;
 }
@@ -721,7 +810,7 @@ IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
 
 int igt_main()
 {
-	data_t data = {};
+	data_t data = { .aux_fd = -1 };
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.25.1

