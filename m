Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB21DC5472F
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6632110E090;
	Sun, 25 Aug 2024 18:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJx9t3Hh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C31E10E090
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608950; x=1756144950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y58S5iggY4/WFNTAgf0lhWaq+893kwTiqL8istLBsfg=;
 b=XJx9t3HhNBK5f8zc5j+N68UEsMxLvJWb5NGPba4zv9j83oWl1CLNPGwx
 IEUYAJ9yuN0FyvbXNmpNp6uN1eMfjGC7dkrZKg/AQxEgh67Rkh+lGu+tB
 K8fV10Mero3QzusA8n9vcmDTxXRnNH+Nj7L/e5iaHApba6K66/4zoETyS
 89sDLZ2T0fq0AH4pu6KpFD9CpoyPt3Otp3I/8HP1Q3ykXbB+k9cbwLV0o
 PyKTkG1avIzEsxn1R4AtB6Tr45B5Zs7RpY+JNORp/9z2g7CIWLR2N4iGD
 +cPWb4Z8k9Z51FBLtgjdfG+nPxoDPJWPhvdmJoVLnZR7wXzGmInLuMeYd Q==;
X-CSE-ConnectionGUID: ph4em3J5Tp6pZDQnPgXS3A==
X-CSE-MsgGUID: yUSX66cYTiKJLwgyc9LlEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917451"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:30 -0700
X-CSE-ConnectionGUID: nHaiYAaYQCOF+tjVLl2uUg==
X-CSE-MsgGUID: C1ComiAQS8WuAgx7BDxHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488281"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:29 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link rate/
 lane count for connector
Date: Sun, 25 Aug 2024 23:44:12 +0530
Message-Id: <20240825181424.4034541-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
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

i915_dp_force_(lane_count/link_rate) debugfs files expoose
current link rate/lane count for connector.add helper to get
current link rate/ lane count for connector

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd530dbab..4ef7f4d7f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6705,3 +6705,61 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 
 	return num_scalers;
 }
+
+/**
+ * igt_get_dp_link_rate_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Link rate set for the output.
+ */
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int link_rate;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) == 1);
+
+	return link_rate;
+}
+
+/**
+ * igt_get_dp_lane_count_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Lane count set for the output.
+ */
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int lane_count;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) == 1);
+
+	return lane_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 999921f9f..9d42a2b35 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1247,5 +1247,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

