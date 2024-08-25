Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19394C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AF510E0D9;
	Sun, 25 Aug 2024 18:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cynsgeAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F05E10E0D7
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608958; x=1756144958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cz7vOSdSeD0Zfd3LqBKx7To/MBwCfFDzWhR+obcmON4=;
 b=cynsgeAgedHkTlj0n70Rr0qYLSj2tVxT3hvvp2PCq+jRQMKK0ONKxA7U
 RiT2bAV0sGh7elGORxj8XqGujIm/H+C186M6mxLnLftB/7FB538U6r45m
 ny24J48lrLBvBf/kbeG1w8dsdYRRZK3A3v/vmvqxbwHNKUQRBTTMHPlu5
 C/pJ+5J7qmTsgGEQAtwYZvluqfszeA6tT71W1AwpvVIR3QftJxAb3WF94
 LjmT7bA55znkFB8PWFlykVbqtJa0IXTF9Ht9QOtmylgaPojY9qqWaV2Qr
 Rgyngh7HxoAxSTqc4/eFdt2J8DFOmnazKs7oZsMzwiOOBL9OyURY719uJ Q==;
X-CSE-ConnectionGUID: PWWs8lQoR+O2fws9dGDcwQ==
X-CSE-MsgGUID: 64PKjb7FQIqak+XUISMZUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917458"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:38 -0700
X-CSE-ConnectionGUID: MO8a0kOiR2mnbe5MxWqJaw==
X-CSE-MsgGUID: o0DJIrd1SmGy8xJzI26Juw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488306"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:37 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 08/14] lib/igt_kms: add helper to get pending lt failures
Date: Sun, 25 Aug 2024 23:44:18 +0530
Message-Id: <20240825181424.4034541-9-kunal1.joshi@intel.com>
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

i915_dp_force_link_training_failure can be written to
written to trigger link trainig failures on retrain.
add helper to get pending link training failure count.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4ab47e2e9..727fa83f1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6918,3 +6918,26 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 	close(debugfs_fd);
 	return ret >= 0;
 }
+
+/**
+ * igt_get_dp_pending_lt_failures:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link training failures.
+ */
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
+{
+	int dir, res, ret;
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_training_failure", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5ae324f6f..07dbcb263 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1255,5 +1255,6 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

