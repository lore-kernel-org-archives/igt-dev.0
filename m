Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61144C27C53
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3F110E2C6;
	Sun,  9 Jun 2024 21:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akp8Cviu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B832A10E2C6
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967629; x=1749503629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3p6jXQAvl/ftRVWRDJzIleT5KRHIFnQntmzF6DY/vs=;
 b=Akp8CviuggZ160BsyKpeibWeAjPWAwrk14MoCqv96HkU051qXK2yMs0f
 TYCXdMGSTSPEqVafuOWqXWrd7S1+1rpKg8ZEgp8z8OGrCHzVn2lMuqH3y
 jirHx9kLZ5w5WHL/rzEuIbk+t9nkTpygZJTffTeO72eJx62tTCguovI3i
 5KGyLX5bZK3zidN21xuJgQAiqzTJ17dvxpbS7MtIAEurqhfCMvqoVqi3B
 maJWnnL38SCmZBAUjJvbmuoezVmkuh96SluLKL5L7iIdYQpPzskYXPbWy
 vC+Ct0MkOVxkcd1CARcb54bM43oatP5XSsPdi7BimH/malCO6/pXJhB3V A==;
X-CSE-ConnectionGUID: CU7FOkzCSeafHWkXIqQrig==
X-CSE-MsgGUID: 4T6CS5OwRresq4vjI6iIYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037485"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037485"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:49 -0700
X-CSE-ConnectionGUID: fUZJ24ntSTSabat2GpXFXA==
X-CSE-MsgGUID: 1tFwqrmOT56AGe6/aJkGXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991035"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:47 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/9] lib/igt_kms: add function to get link training info
Date: Mon, 10 Jun 2024 02:55:32 +0530
Message-Id: <20240609212535.868832-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

[1] exposed information like retrain_disabled, train_count, retrain_count
all_train_failures, seq_train_failures, add function to retrieve and
store it in struct dp_link_training_info

[1] https://patchwork.freedesktop.org/patch/594771/?series=133624&rev=3
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1bd6c31a7..4b354826d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6901,3 +6901,35 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
 
 	return max_lane_count;
 }
+
+/**
+ * igt_read_link_training_info:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @link_training_info: Link training info to be filled
+ *
+ * Returns: Sets link training info.
+ */
+void igt_read_link_training_info(int drm_fd, igt_output_t *output,
+		 struct dp_link_training_info *link_training_info)
+{
+	int dir, res;
+	char retrain_disabled_buf[4];
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_link_training_info", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	igt_assert(sscanf(buf, "retrain_disabled: %s\ntrain_count: %d\nretrain_count: %d\nall_train_failures: %d\nseq_train_failures: %d",
+				retrain_disabled_buf,
+				&link_training_info->train_count,
+				&link_training_info->retrain_count,
+				&link_training_info->all_train_failures,
+				&link_training_info->seq_train_failures) == 5);
+	link_training_info->retrain_disabled = strcmp(retrain_disabled_buf, "yes") == 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d58676a1e..9301df1e2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1266,5 +1266,7 @@ enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
+void igt_read_link_training_info(int drm_fd, igt_output_t *output,
+				 struct dp_link_training_info *link_training_info);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

