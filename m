Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B718FC5472C
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2D510E0C9;
	Sun, 25 Aug 2024 18:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXcDDTAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D54310E0A6
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608957; x=1756144957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JmKZfiy4w5+B7B/+JCGCs2VYlgNB4m2Z9gTSU9N85Ec=;
 b=FXcDDTARsd6O3Scwk4pjY/WgrvtqLMMBd/YO5KGobdFR0kjDL5boxuaJ
 tm+lsMg1YwQSZMEmd8+Cf5YwWEDNwAkG5ZUJOyWS/uATcaGYxWasTFMEa
 URcRqaW9EjiaX+R/jzzUvebLPL3oUeqzOXHminW7K/ek40Vbnj6MPBE3I
 0rbDdnPxq+ZvlbehNDgD6dhcFN+ip9kHx/Ad7UcCVzhNqidUxOozEXsqd
 jI3WFCTIf7wwX6xu8ZL8lNhRhZ/sBOpPCI0uCT5oftcEDwXW5sy1crDWu
 ClCmnoaGzX4ev+eYApLSEMDm2PWeSXH2CoOoiYV0YtHRAt4n6cmO24oh8 g==;
X-CSE-ConnectionGUID: htLFtWBTRca2yqBvqkzzFQ==
X-CSE-MsgGUID: m08QbKzTQaC2XyswMxIxaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917457"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:37 -0700
X-CSE-ConnectionGUID: sRYYL8C9Sl+Ccr+/O7Cxfw==
X-CSE-MsgGUID: HRq2lGEKRw6d4gehF0EinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488302"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:36 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force link
 training failure support
Date: Sun, 25 Aug 2024 23:44:17 +0530
Message-Id: <20240825181424.4034541-8-kunal1.joshi@intel.com>
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

add helper to check if platform support forcing
link training failures

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 25 +++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2720095d4..4ab47e2e9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6893,3 +6893,28 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
 	igt_require(res > 0);
 	return strstr(buf, "yes");
 }
+
+/**
+ * Checks if the force link training failure debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+{
+	int debugfs_fd, ret;
+	char buf[512];
+
+	igt_assert_f(output->name, "Invalid output\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	if (debugfs_fd < 0)
+		return false;
+	ret = igt_debugfs_simple_read(debugfs_fd,
+				      "i915_dp_force_link_training_failure",
+				      buf, sizeof(buf));
+	close(debugfs_fd);
+	return ret >= 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2d69d794a..5ae324f6f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1254,5 +1254,6 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

