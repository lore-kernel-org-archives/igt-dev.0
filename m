Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AABC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33A10E0B0;
	Wed, 16 Sep 2026 04:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVgHVkgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AEA10E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532801; x=1821068801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6B3x8AxVjnRICMcjPegc0ZwPRrrTP13q1WN8groLaHg=;
 b=iVgHVkggOI2FIKMaPIiRbzElbb+alSBMzUkR2ckZTpvqWDYf6PooZtxf
 lBHd3ZLXFRGZ0eT08zibCHJzhzYaTfacAo0CrHoVLoNZbI5gWuHpMdhel
 9iEXKEMdkb9nTv0/T7ZftHaXqmv7oCfpd+efn+hf4Y4nmxfzkYn0paDaM
 UuRuv9r7tkSOJN7iA55+MrMCRKDOm+C7B+bRmhLd6cOGo6TK9Gbm36+q8
 yC5gPvMPKhl8ralaxCrGB9hC3JV4XKZgJSyWtl+G50r7Knzil5eykDQZY
 k6yjv0pB515zudT3O+gjLvRvm2u14tiwMd4M1oOk8o+v++kzKn5vYykvi A==;
X-CSE-ConnectionGUID: q+TE73W5QWCnaDQeO+jqiQ==
X-CSE-MsgGUID: RrL+izWzTraD44XP2vSzNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503245"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:41 -0700
X-CSE-ConnectionGUID: DT2BpPz7RN2NDcOfAHy/pg==
X-CSE-MsgGUID: zryQlaPpSBiuny/bEl5V7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765051"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/13] lib/i915/i915_dp: Add a Type-C port mode query
Date: Wed, 16 Sep 2026 10:17:55 +0530
Message-Id: <20260916044801.1279102-8-kunal1.joshi@intel.com>
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

Whether a DP link is tunneled over USB4/Thunderbolt decides where its
link clock comes from: a tbt-alt link is clocked by the Thunderbolt
PLL, every other mode by the PHY PLL. A test that wants to cover the
tunneled path has to be able to tell them apart, and nothing in IGT
can today.

The driver already reports it. For every connected Type-C connector
intel_connector_info() prints

	TC Port TC1: mode: tbt-alt, pin assignment: D, max lanes: 4

in the i915_display_info debugfs file, with the mode being one of
disconnected, tbt-alt, dp-alt or legacy. A connector with no TC Port
line is on a combo or native PHY.

Add i915_dp_get_tc_mode() returning that mode as an enum, optionally
along with the pin assignment and the Type-C max lane count, which are
worth having in a log line, and i915_dp_tc_mode_name() to get the
driver's spelling back for the same purpose.

i915_display_info is a per-device file listing the CRTCs first and the
connectors after them, so find the [CONNECTOR:<id>: block belonging to
the output and terminate it at the next [CONNECTOR: marker. Without
that second step a connector on a combo PHY picks up the TC Port line
of whichever connector comes after it.

Start the search at the "Connector info" heading. The CRTC section
names the connectors of every active output, so for an active output
the first [CONNECTOR:<id>: match is intel_encoder_info()'s reference to
it, not its own block. Parsing would then stop before ever reaching the
TC Port line and report a tbt-alt connector as having no Type-C port at
all.

Read the file with igt_sysfs_get(), which sizes the buffer from the
file, rather than the fixed 16 KiB and 8 KiB stack buffers the existing
readers in lib/igt_kms.c use without checking for truncation.

Note that MST stream connectors do report the TC line, since both
branches of intel_connector_info() resolve the digital port with
intel_attached_dp(), so an MST topology can be classified from any of
its streams without finding the root. Disconnected connectors return
early and print no TC line at all, which is why the root connector of
an active MST topology has none.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
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

