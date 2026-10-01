Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C36DCA5FD2
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E8310F5A8;
	Thu,  1 Oct 2026 07:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9ekS+B0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4202910F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838996; x=1822374996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZJN/G6zTie2iYbT8EoFFlo9rs8d9c68NyXavsA0Ffc=;
 b=S9ekS+B0MuyR4054iNmIkDac2TL7rmdiWbbdFEsgR//4AA4pp7B07IOT
 58g3g8vL/QuBhBM7TlOrx+oWyn2OGcNjNdf38jO4qEXHhhKKj3mAjdlHD
 xlXkUxDs2IsAlQex2XG+RI6U9OWNybj0T29DNmSkR1DM3myONKtuZoSN9
 G9N5rqVrbt7ILQkrnjJyS4SsCM9sDGZoOp9TurrdyXCGa/cO3JfsicWbo
 nw6/zOPIXTLyUetTLrUyJEqLsjLTfW8OwLe4Y+W6OwR/PkOSPKxfgOQYc
 +ny4HvZMONy6QLw8UbJhmpI2sQ5QuB8ueJwrkU0/4mHIVGIJhAJYfm4a0 w==;
X-CSE-ConnectionGUID: 5bN5BumyRpywjFmB14OMqg==
X-CSE-MsgGUID: D7fbaFmdTfKESxqAmwaRew==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605984"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:44 -0700
X-CSE-ConnectionGUID: h/I/dnPETRmcuomdCvt7hw==
X-CSE-MsgGUID: 0Zbtn5wBR1yjYlYi6p2GPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138301"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:43 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 01/13] lib/i915/i915_dp: add helpers for the allowed
 link configs debugfs
Date: Thu,  1 Oct 2026 13:06:51 +0530
Message-Id: <20261001073703.5067-2-kunal1.joshi@intel.com>
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

The existing helpers don't tell which link configs can actually be used.
i915_dp_get_max_supported_rate() parses i915_dp_force_link_rate, which
only lists the source rates, and the driver silently clamps a forced
rate the sink doesn't support.

The intel_dp_allowed_link_configs connector debugfs file lists the lane
count and link rate combos the driver picks from. Add
i915_dp_get_allowed_link_configs() to read them, and
i915_dp_has_allowed_link_configs_debugfs() to check the file exists.
We'll be adding a user in follow-up.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/i915/i915_dp.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_dp.h | 17 ++++++++++
 2 files changed, 98 insertions(+)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 3d570f7cc..aba6aa8d5 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -37,6 +37,12 @@
 #include "igt_core.h"
 #include "igt_kms.h"
 
+/*
+ * The driver allows at most 10 link rates over 3 lane counts, i.e. 30 entries
+ * of at most "4x2000000 ", so 1024 has plenty of room to spare.
+ */
+#define LINK_CONFIGS_BUF_SIZE	1024
+
 /**
  * i915_dp_parse_marked_value:
  * @buf: Buffer containing the content to parse
@@ -391,6 +397,81 @@ int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
 	return max_rate;
 }
 
+/**
+ * i915_dp_has_allowed_link_configs_debugfs:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Checks if the allowed link configs debugfs is available for a specific
+ * output.
+ *
+ * Returns: True if the debugfs is available, false otherwise
+ */
+bool i915_dp_has_allowed_link_configs_debugfs(int drm_fd, igt_output_t *output)
+{
+	char buf[LINK_CONFIGS_BUF_SIZE];
+
+	return igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					       "intel_dp_allowed_link_configs",
+					       buf, sizeof(buf)) == 0;
+}
+
+/**
+ * i915_dp_get_allowed_link_configs:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @configs: Array to store the allowed link configurations in
+ * @max_configs: Number of entries in @configs
+ *
+ * Read the link configurations the driver currently allows on @output, i.e.
+ * the intersection of the source rates, the rates the sink advertises and the
+ * current link limits.
+ *
+ * The driver lists them in the order it would pick them, which differs between
+ * SST and MST and depends on earlier link training results, so callers have to
+ * treat the result as an unordered set.
+ *
+ * Returns: The number of configurations stored in @configs
+ */
+int i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t *output,
+				     struct i915_dp_link_config *configs,
+				     int max_configs)
+{
+	char buf[LINK_CONFIGS_BUF_SIZE];
+	char *token, *saveptr = NULL;
+	int count = 0;
+	int res;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "intel_dp_allowed_link_configs",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/intel_dp_allowed_link_configs\n",
+		     igt_output_name(output));
+
+	/* An empty set of allowed configurations reads back as a bare newline. */
+	buf[strcspn(buf, "\n")] = '\0';
+
+	for (token = strtok_r(buf, " ", &saveptr); token;
+	     token = strtok_r(NULL, " ", &saveptr)) {
+		int lane_count, link_rate;
+		char extra;
+
+		igt_assert_f(count < max_configs,
+			     "More than %d link configs on %s\n",
+			     max_configs, igt_output_name(output));
+		igt_assert_f(sscanf(token, "%dx%d%c", &lane_count, &link_rate,
+				    &extra) == 2 && lane_count > 0 &&
+			     link_rate > 0,
+			     "Failed to parse link config '%s'\n", token);
+
+		configs[count].lane_count = lane_count;
+		configs[count].link_rate = link_rate;
+		count++;
+	}
+
+	return count;
+}
+
 /**
  * i915_dp_get_next_lower_rate:
  * @drm_fd: A drm file descriptor
diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
index 5d17713e2..c818b3937 100644
--- a/lib/i915/i915_dp.h
+++ b/lib/i915/i915_dp.h
@@ -10,6 +10,19 @@
 /* DP link rates are in 10 kbit/s units; UHBR10 is 10 Gbps. */
 #define I915_DP_UHBR10_LINK_RATE	1000000
 
+/**
+ * struct i915_dp_link_config:
+ * @lane_count: Number of lanes
+ * @link_rate: Link rate in 10 kbit/s units
+ *
+ * A single link configuration, as listed by the intel_dp_allowed_link_configs
+ * connector debugfs file.
+ */
+struct i915_dp_link_config {
+	int lane_count;
+	int link_rate;
+};
+
 /**
  * i915_dp_is_uhbr_rate:
  * @link_rate: DP link rate in 10 kbit/s units, as reported by the
@@ -40,6 +53,10 @@ void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
 void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
 			     const char *link_rate, const char *lane_count);
 int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
+bool i915_dp_has_allowed_link_configs_debugfs(int drm_fd, igt_output_t *output);
+int i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t *output,
+				     struct i915_dp_link_config *configs,
+				     int max_configs);
 int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate);
 
 #endif
-- 
2.25.1

