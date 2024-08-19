Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6102C54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D61A10E225;
	Mon, 19 Aug 2024 09:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyapphpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58C310E225
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058863; x=1755594863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nkq4N3n9E03mjkYHjWtIB6srzbNmAuyD9QwLX0Hm1uk=;
 b=iyapphpqi6FFPODDH0HxVlrwVOWIffD6Dc+ksfNqY5H08uZVXyyJ9jJy
 rQKmbYWQT4km+I8P3pdU60E8DdJ191gtjydeemxf7LLY+bdAINkEwyLeJ
 H7hS1QC6+ZwEOAwKxyDnsG4ekHU4OwCOUwfRmEQkRnwh0gNXckM9Qj9BZ
 bTROKvlvZz4K9WIvFOf4KZHViIIjouVKo5a8kW54pD7z8eUtUD6dqokKB
 XSgEQaeqB3pXKM1dR1N/tVXuorn/pCg4yWvUAS/JxDUutwVROX0/+nOrX
 LeVQKXgwgEVWNGbhwMqItwK7aCahtsqNxC/UaNwxOoZZcSUMdY3nxu3pr g==;
X-CSE-ConnectionGUID: cv9BQuiRT1meBf0P7ksuPw==
X-CSE-MsgGUID: K/PNojbVQ72507xuT5cIdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816302"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:23 -0700
X-CSE-ConnectionGUID: TBMOsJcaQNmr8gqpv1Vtbg==
X-CSE-MsgGUID: A8sBxNFYQSCj31Fo2hArlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884161"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:20 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 03/12] lib/igt_kms: add function to get max link
 rate/lane count
Date: Mon, 19 Aug 2024 14:56:06 +0530
Message-Id: <20240819092615.3669803-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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

[1] allows to get max link rate/lane count for a particular
connector. add functions to retrieve data via newly
exposed interface

[1] https://patchwork.freedesktop.org/patch/594763/?series=133624&rev=3

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  2 ++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 183cb134a..1115a0b93 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6812,7 +6812,7 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 {
 	char buf[512];
 	int dir, res;
-	int lane_count = DP_LANE_COUNT_4;
+	int lane_count;
 
 	igt_require_f(output->name, "Invalid output");
 	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
@@ -6829,3 +6829,61 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 
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
index 2dd8c1bff..b65c478c9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1253,5 +1253,7 @@ int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

