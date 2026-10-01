Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF9BCA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5F110F59D;
	Thu,  1 Oct 2026 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMwNV6Ew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5C10F59F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838998; x=1822374998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H+ODMMKsValIhz5KGjJVPQZ0FTlxy5qH+3nd4IjXtgc=;
 b=FMwNV6EwsZHrjNPDDiZU2SCQ9RaXBl0hQgoOPttpjZ/2ga0BgtC7xcid
 k6t9M65z+UTtOztF61DliQMOVdOjGchAC12yTuzfw3R1emXlFbN3PG7jX
 wqq285Hvi6va4ikDFiNYIFcZMpRRCSeZwmBhaSXiflxWB/Jrr0/gmuwuj
 AtWYt7HmOl4H3fzBiJVCTjAAi1XmknAPdOT0N+Q6EEAm3p+Jqcc8K702Z
 /b3sDJJ5doIBqZvQ5V9TAPGCz29qFPZ1Bey1bEvpVMW1eoOHqw5YUt5Dz
 T8a342gOwlFYcKT0YBT9a1u7ZCDDTRpridNp3FoKFIRq+2ruLatbthiCz w==;
X-CSE-ConnectionGUID: azIlKP1YQtC0gCiIAiXRhw==
X-CSE-MsgGUID: OibXhq6rTW6rcReII/cQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605993"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:52 -0700
X-CSE-ConnectionGUID: VDuaPaiVQtGnbm+vHdmg6Q==
X-CSE-MsgGUID: UpQXeFN8Qu+FiMh46DxIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138327"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:51 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 07/13] lib/i915/i915_dp: add i915_dp_get_tc_mode()
Date: Thu,  1 Oct 2026 13:06:57 +0530
Message-Id: <20261001073703.5067-8-kunal1.joshi@intel.com>
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

A DP link tunneled over USB4/Thunderbolt (tbt-alt) is clocked by the
Thunderbolt PLL, while the others use the PHY PLL. Add
i915_dp_get_tc_mode() to tell them apart, so tests can cover both, and
i915_dp_tc_mode_name() for logging. We'll be adding a user in
follow-up.

The driver reports the Type-C port mode, pin assignment and max lane
count in i915_display_info:

	TC Port TC1: mode: tbt-alt, pin assignment: D, max lanes: 4

MST stream connectors have the TC Port line too, so any stream will do.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/i915/i915_dp.c | 111 +++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h |  24 ++++++++++
 2 files changed, 135 insertions(+)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index aba6aa8d5..89d1dbd4d 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -35,7 +35,9 @@
 
 #include "i915_dp.h"
 #include "igt_core.h"
+#include "igt_debugfs.h"
 #include "igt_kms.h"
+#include "igt_sysfs.h"
 
 /*
  * The driver allows at most 10 link rates over 3 lane counts, i.e. 30 entries
@@ -527,3 +529,112 @@ int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate)
 
 	return next;
 }
+
+/**
+ * i915_dp_tc_mode_name:
+ * @mode: Connector mode
+ *
+ * Returns: The driver's name for @mode, for use in a log line
+ */
+const char *i915_dp_tc_mode_name(enum i915_dp_tc_mode mode)
+{
+	switch (mode) {
+	case I915_DP_TC_DISCONNECTED:
+		return "disconnected";
+	case I915_DP_TC_LEGACY:
+		return "legacy";
+	case I915_DP_TC_DP_ALT:
+		return "dp-alt";
+	case I915_DP_TC_TBT_ALT:
+		return "tbt-alt";
+	default:
+		return "native";
+	}
+}
+
+/**
+ * i915_dp_get_tc_mode:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @pin_assignment: Where to store the Type-C pin assignment, or NULL
+ * @max_lanes: Where to store the Type-C max lane count, or NULL
+ *
+ * Read the connector mode of @output out of the TC Port line the driver
+ * prints for every connected Type-C connector in the i915_display_info
+ * debugfs file:
+ *
+ *	TC Port TC1: mode: tbt-alt, pin assignment: D, max lanes: 4
+ *
+ * @pin_assignment and @max_lanes are only written when the line is present.
+ *
+ * Returns: The connector mode, or I915_DP_TC_NONE when @output has no TC Port
+ * line, i.e. it is on a combo or native PHY
+ */
+enum i915_dp_tc_mode i915_dp_get_tc_mode(int drm_fd, igt_output_t *output,
+					 char *pin_assignment, int *max_lanes)
+{
+	enum i915_dp_tc_mode mode = I915_DP_TC_NONE;
+	char marker[32];
+	char mode_str[32];
+	char *info, *block, *next_block, *line;
+	char pin;
+	int lanes;
+	int dir;
+
+	dir = igt_debugfs_dir(drm_fd);
+	igt_assert_fd(dir);
+	info = igt_sysfs_get(dir, "i915_display_info");
+	close(dir);
+	igt_assert_f(info, "Unable to read i915_display_info\n");
+
+	/*
+	 * i915_display_info is a per-device file that lists the CRTCs first
+	 * and the connectors after them. The CRTC section names the connectors
+	 * of every active output, so the search has to start at the connector
+	 * section, or an active output's first match is that reference rather
+	 * than the connector's own block and the TC Port line is never
+	 * reached. The block ends where the next connector's begins.
+	 */
+	snprintf(marker, sizeof(marker), "[CONNECTOR:%d:",
+		 output->config.connector->connector_id);
+
+	block = strstr(info, "Connector info");
+	if (!block)
+		goto out;
+
+	block = strstr(block, marker);
+	if (!block)
+		goto out;
+
+	next_block = strstr(block + strlen(marker), "[CONNECTOR:");
+	if (next_block)
+		*next_block = '\0';
+
+	line = strstr(block, "TC Port ");
+	if (!line)
+		goto out;
+
+	if (sscanf(line,
+		   "TC Port %*[^:]: mode: %31[^,], pin assignment: %c, max lanes: %d",
+		   mode_str, &pin, &lanes) != 3)
+		goto out;
+
+	if (!strcmp(mode_str, "tbt-alt"))
+		mode = I915_DP_TC_TBT_ALT;
+	else if (!strcmp(mode_str, "dp-alt"))
+		mode = I915_DP_TC_DP_ALT;
+	else if (!strcmp(mode_str, "legacy"))
+		mode = I915_DP_TC_LEGACY;
+	else
+		mode = I915_DP_TC_DISCONNECTED;
+
+	if (pin_assignment)
+		*pin_assignment = pin;
+	if (max_lanes)
+		*max_lanes = lanes;
+
+out:
+	free(info);
+
+	return mode;
+}
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index c818b3937..883ac346d 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -23,6 +23,27 @@ struct i915_dp_link_config {
 	int link_rate;
 };
 
+/**
+ * enum i915_dp_tc_mode:
+ * @I915_DP_TC_NONE: not a Type-C port, i.e. a combo or native PHY
+ * @I915_DP_TC_DISCONNECTED: Type-C port with nothing connected
+ * @I915_DP_TC_LEGACY: fixed DP connection on a Type-C port
+ * @I915_DP_TC_DP_ALT: USB-C DP alt mode, driven by the PHY PLL
+ * @I915_DP_TC_TBT_ALT: DP tunneled over USB4/Thunderbolt, driven by the
+ *			Thunderbolt PLL
+ *
+ * The connector mode of a DP output, as reported by the i915_display_info
+ * debugfs file. Only I915_DP_TC_TBT_ALT takes its link clock from the
+ * Thunderbolt PLL; every other value uses the PHY PLL.
+ */
+enum i915_dp_tc_mode {
+	I915_DP_TC_NONE,
+	I915_DP_TC_DISCONNECTED,
+	I915_DP_TC_LEGACY,
+	I915_DP_TC_DP_ALT,
+	I915_DP_TC_TBT_ALT,
+};
+
 /**
  * i915_dp_is_uhbr_rate:
  * @link_rate: DP link rate in 10 kbit/s units, as reported by the
@@ -58,5 +79,8 @@ int i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t *output,
 				     struct i915_dp_link_config *configs,
 				     int max_configs);
 int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate);
+enum i915_dp_tc_mode i915_dp_get_tc_mode(int drm_fd, igt_output_t *output,
+					 char *pin_assignment, int *max_lanes);
+const char *i915_dp_tc_mode_name(enum i915_dp_tc_mode mode);
 
 #endif
-- 
2.25.1

