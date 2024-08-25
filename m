Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EA4C5472C
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEC910E109;
	Sun, 25 Aug 2024 19:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuAWgvc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4049810E109
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615666; x=1756151666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oD3E2Isyc4W2nsXUXPg5hVEVF0PnbIaePw9HhPyjXe4=;
 b=QuAWgvc4z20r1qh83yfxxliqPXT+3oDVORioEpbnWUCDyezCKVWpOVHu
 mRVC7yTh1mgT+XMlho32V44YJ9wvZM9+OhdQQ/0wHKa0vZUD7JVI9Rjpr
 uNvsTGvjfGFsmISLqALD3mfCxXoWC51aC2o9ZGGxga5E1Hqiuy7BeDAwq
 C1w9wHblLQV1DxqTnD8nItrf03ZzCLGUtgFz5riPG6S2ek1VUwHf7mUzt
 emUod21+uOfku2uFnOXHklEOjSl68dtBUmmmvwhhBrVMfIT/jFG+kvrby
 B4WGkPNLYS3jhecBbeJ2/UxG93mWOYbiF4xBut7MIq+g0+Ol2HKKYxLFu A==;
X-CSE-ConnectionGUID: TqpIbBNdReCRnSdllfiM3w==
X-CSE-MsgGUID: 4rxMIM+4SCqrqHuW2ZKf/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591479"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:26 -0700
X-CSE-ConnectionGUID: yMjcByb+QDuG+EQqdwpWPw==
X-CSE-MsgGUID: 9715pkhCTBSi+6speZ4pHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283675"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:25 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 07/14] lib/igt_kms: add function to check force link
 training failure support
Date: Mon, 26 Aug 2024 01:36:05 +0530
Message-Id: <20240825200612.4036178-8-kunal1.joshi@intel.com>
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
2.34.1

