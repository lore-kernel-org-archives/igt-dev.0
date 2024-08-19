Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8CEC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A6310E229;
	Mon, 19 Aug 2024 09:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0rtgDmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4C110E228
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058868; x=1755594868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTW98F1WxyTHIGiBrq6U9EFFXG5UgDykH4UhyZEKfHw=;
 b=i0rtgDmoG4ySfwq0XAxf58k/nSq0vDV8umirB/zg/pM/89WwHeg8iwtN
 KrVUWvBW+0y7zDdAtd0Y7YO5D3fNh961TdKFqhmUVB6FpN6UMS0bz0v5r
 VG9Axz92wjxeje56LUbD3lOdIlZqQC0b+Wlo5T2GqC1RDK1f5mG+yfhKm
 RukkyXblUziXLbEhnEdt7k8rh1JybTYj362HuMrC7MPq3xd1f00QhSE8n
 aOw7GU6WFpLqKH/ycaER64NJNGv+7SrQSRITuuZ0372iaBeRNwg3nMsxI
 Qn8XMTO89ytE+yVuadfHCiZWsqDlFTvK0rSS9YQo0NF0k7mKWn9k/1aZk A==;
X-CSE-ConnectionGUID: npT6CYASQXuw4X/x/cRAvg==
X-CSE-MsgGUID: /UqLW0kOQWmwFpMpmpa2IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816316"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:28 -0700
X-CSE-ConnectionGUID: /1Lj64H5Svm9gI2bjkkeKA==
X-CSE-MsgGUID: lZG/uaAjRo2QwHQIhCnGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884177"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:26 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/12] lib/igt_kms: add function to check if retrain
 disabled
Date: Mon, 19 Aug 2024 14:56:09 +0530
Message-Id: <20240819092615.3669803-7-kunal1.joshi@intel.com>
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

add helper to check if retraining is disabled,
retraining will be disable if we are at the lowest
link parameters or the lowest mode supported on a panel

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f6ee7ab2e..1caf9df6e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6978,3 +6978,27 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
 			     value, sizeof(value));
 	close(dir);
 }
+
+/**
+ * igt_get_dp_link_retrain_disabled:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: True if link retrain disabled, false otherwise
+ */
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
+{
+	int dir, res;
+	char buf[512];
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir,
+				      "i915_dp_link_retrain_disabled",
+				      buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+	return strstr(buf, "yes");
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 43bfd4a67..39396ba40 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1259,5 +1259,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

