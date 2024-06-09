Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F31C27C77
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB110E2CA;
	Sun,  9 Jun 2024 21:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajtZdS0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3432610E2C3
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967630; x=1749503630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sHCEvj2R9H22U3bmumukAKqCe3v8vOidnVZQC9fAY3o=;
 b=ajtZdS0KNvFMt0bQRWUs53o8sFlBmGSIHTGdZnTn+3veF+kg6/kubi77
 cO3QxGRLlPQoNW+pmaYWd/KAhkIQhANapEdEeTAkRXxaCAMoH9bYCafLQ
 8QRydwmlSQy+j9SzY6QF7q3C4I4N9EHHsySQCszKRUdoyeEWzy1+eQcZA
 CaA6StPduCHt+fVdHmzuWx4lqGoptaVZ/7aYPjx/aYXzKUNlgX5G6vMSv
 Mp/wwUrkpX9HtB4wCRYjp0AhulDDO6tdvQI5BqoCutiE+9qrmSSgf0f1+
 8tAdD4JY4IGxv/IG+OvG6kRCayr3n9P+TGQYHdMYQU+8VsyqVQZh1xRDY A==;
X-CSE-ConnectionGUID: Zbfd10cATG+dNYDHOrKRRA==
X-CSE-MsgGUID: wzX+4klURNCGHKeuN9rseA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037487"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:50 -0700
X-CSE-ConnectionGUID: RiDCkkDER4KpOTZjyJ8A9g==
X-CSE-MsgGUID: qfixBDkdThSLe1zGTP9pWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991039"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/9] lib/igt_kms: add function to check force link
 training failure support
Date: Mon, 10 Jun 2024 02:55:33 +0530
Message-Id: <20240609212535.868832-8-kunal1.joshi@intel.com>
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

add function to check if output supports forcing link training failures

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4b354826d..be5d7d4fa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6933,3 +6933,26 @@ void igt_read_link_training_info(int drm_fd, igt_output_t *output,
 				&link_training_info->seq_train_failures) == 5);
 	link_training_info->retrain_disabled = strcmp(retrain_disabled_buf, "yes") == 0;
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
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_dp_force_link_training_failure", buf, sizeof(buf));
+	close(debugfs_fd);
+	return ret >= 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9301df1e2..58dd90b85 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1268,5 +1268,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_read_link_training_info(int drm_fd, igt_output_t *output,
 				 struct dp_link_training_info *link_training_info);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

