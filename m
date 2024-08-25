Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1576BC5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AFD10E092;
	Sun, 25 Aug 2024 18:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNUvOaZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0F110E090
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608952; x=1756144952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DI7Q1a1cMdxitxCGF1dVXFORfsJoj6y0WbDH9IWogCA=;
 b=VNUvOaZybJoIDh57p3U7X8xI4a6rh6fRSHDkAJGiXOhWnwn8Jfsz50lI
 fsf4Ga391JXohb0mA1HAlodEbJRstp3b1CQuxDMz54ANH+d9JV75a10i8
 OThx1MABkY7i3C2VwzfDOWkMPIhMPex28RwLajA037Ucj1+UanQk/sy1H
 U1ILh1ZOWZdSMIBYamLU8Cpc2yAXj8F7cGX30kHpDo9e2NmV4wodXZidS
 xpwEhgTe+PBYfRXb6vTxxiKfDyEcHdNWFwpNtao3ZESx0PyWzprYm8nyK
 IRoaZjvOxXDzI5CLgd3GelbAdSdzu4wHsbXkDfUHFq0D9Seb4I5W/R69q Q==;
X-CSE-ConnectionGUID: 7av6psXLRAqdQ+wLuBM3Ew==
X-CSE-MsgGUID: Cxv/9DGOSvKvBsLS7VTnnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917452"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:31 -0700
X-CSE-ConnectionGUID: H/iZ1B+fRya/fj1XnYef/g==
X-CSE-MsgGUID: KC1mvwHLTe2mhfVJoXhybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488285"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:30 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/14] lib/igt_kms: add function to get max link
 rate/lane count
Date: Sun, 25 Aug 2024 23:44:13 +0530
Message-Id: <20240825181424.4034541-4-kunal1.joshi@intel.com>
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
2.43.0

