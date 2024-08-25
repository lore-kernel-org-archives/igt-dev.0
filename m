Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DC6C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C836610E0A4;
	Sun, 25 Aug 2024 18:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHho7zpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E3410E097
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608954; x=1756144954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVsU2TH7hhaXKXqDRdI6VBYzUXfg4xJrEOAx3h6KCmg=;
 b=mHho7zpAEt/uQ1AiaR5JRspthqGFCxo25NgaBPipa0whUXit+jpzllCA
 x0hGsce0wct3qmBmevVyWhlFUvgH+inVkdxy1QOutmd5MYzSX20tafHAk
 vgam4R3aEFy+H/IWxJyJZi5nw0VmrZY35l7g1GPU3UmVaKE9+U5I97f0K
 7DxfnwXokCwpGeXFKiCuPizhr7mlPfLlkbYGqWZ1w0jC+7Twg2k3YNAEk
 I1KISUUZ8IAjPaGn2ji3BfylK67ZZcSnQJzxAYt3x7h7ozhA0hcpjwwrj
 P/KrTR3FYBWYmWwo7AITA6l/BA3I/bt6n5F62SV+F06kS5lTphXpdF9vD A==;
X-CSE-ConnectionGUID: w9V9oKIqT/KjipcSTDVM9Q==
X-CSE-MsgGUID: k1zkWvZoTYy5Rd5sqnwE3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917455"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917455"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:34 -0700
X-CSE-ConnectionGUID: C2ibQirPT7Gr00xEGqk2xQ==
X-CSE-MsgGUID: TWXNBD/VQTK56Kx2nolGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488291"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:33 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/14] lib/igt_kms: add function to force link training
 failure
Date: Sun, 25 Aug 2024 23:44:15 +0530
Message-Id: <20240825181424.4034541-6-kunal1.joshi@intel.com>
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

i915_dp_force_link_training_failure debugfs
file is used to force link training failure.
add a function to force link training failure.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 553a08f2f..683989e84 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6843,3 +6843,29 @@ void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
 	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
 	close(dir);
 }
+
+/**
+ * igt_force_lt_failure:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @failure_count: 1 for same link param and
+ *                2 for reduced link params
+ *
+ * Force link training failure on the output.
+ * @failure_count: 1 for retraining with same link params
+ * 				   2 for retraining with reduced link params
+ */
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+{
+	int dir;
+	char value[2];
+
+	snprintf(value, sizeof(value), "%d", failure_count);
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	igt_sysfs_write(dir, "i915_dp_force_link_training_failure",
+			     value, sizeof(value));
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9ba8c6394..57829416a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1252,5 +1252,6 @@ enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

