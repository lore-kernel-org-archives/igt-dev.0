Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B9C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546E110E108;
	Sun, 25 Aug 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiZSeW2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D410E103
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615661; x=1756151661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XGqDzjhYRQdD1nXmpvQs1BXiqWMwTTmawq4vUmHfyc=;
 b=OiZSeW2hLYhoS0SyMV0KImLJ90j4V3/u/zqIL7aoZdZIqlqk/2mz4RdW
 EUnShPFBcpmX8L1J1TEFbjXpYkrId8ARZIAZWhtRpfGMB2lYOL5lLs4+r
 n//Uw9YQnZ9dwYeUdzboCzzBK/8jj3Hik3LmC6FHLYRyhCx36SXpQRmcm
 Arlbmiay73NRnRzcBm3VRqYS2mUFEklJwroirjH9mO0HhIm3JeYDhklKC
 FvZzRViD6uEZRSvZnMulWzht2TFIbbgWT8k5OmwRzQh3afuUfi3KaLt1N
 3h3QuE9jWBUeV0e6g7rtAN3gvgLdvkCsT8h2PjqI1UuziWcn+JZaMLxkZ w==;
X-CSE-ConnectionGUID: GDiBsCmJT76Rg0DLbtikDA==
X-CSE-MsgGUID: Hl3bR01gStO7c3TMl5w8gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591453"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:20 -0700
X-CSE-ConnectionGUID: cUF/AWjTTVesVsVvPfo16w==
X-CSE-MsgGUID: Bxw2KfhiRPCxYMnOCE/Umg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283644"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:19 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Date: Mon, 26 Aug 2024 01:36:01 +0530
Message-Id: <20240825200612.4036178-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

i915_dp_max_(lane_count/link_rate) debugfs files expose max link
rate/lane count for connector.add function to get max link rate/lane
lane count for connector

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4ef7f4d7f..21ea8550c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6763,3 +6763,61 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 
 	return lane_count;
 }
+
+/**
+ * igt_get_dp_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: The output to query
+ *
+ * Get the max link rate supported by the sink.
+ *
+ * Returns: Max link rate supported by the sink.
+ */
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int max_link_rate;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_max_link_rate",
+								  buf, sizeof(buf));
+	close(dir);
+	igt_require_f(res > 0, "Couldn't read i915_dp_max_link_rate");
+
+	igt_assert(sscanf(buf, "%d", &max_link_rate) == 1);
+
+	return max_link_rate;
+}
+
+/**
+ * igt_get_dp_max_lane_count:
+ * @drm_fd: A drm file descriptor
+ * @output: The output to query
+ *
+ * Get the max lane count supported by the sink.
+ *
+ * Returns: Max lane count supported by the sink.
+ */
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int max_lane_count;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_max_lane_count",
+								  buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	igt_assert(sscanf(buf, "%d", &max_lane_count) == 1);
+
+	return max_lane_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9d42a2b35..1d3226c5c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1249,5 +1249,7 @@ int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
 enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.34.1

