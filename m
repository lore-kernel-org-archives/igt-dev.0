Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8917AC5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F12D10E0A6;
	Sun, 25 Aug 2024 18:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVv4x+yb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F253210E0A6
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608956; x=1756144956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ao59kKsmWMdjuI38YW5L+lGJ/KS9yFQcC9RUIo+MmL0=;
 b=hVv4x+ybSc6uZvzQdsxZ8DutTP8EZE4HZ61ZWjp/8+XfuLAb1pyu5X2c
 9B0CLw9quT80AyBZoGlQa7BzIa52B8rcm/m0p7f9Uk0wFbXQ/uMVphs3t
 S+uEkTEWavIN4EGpv5ZrugkuDK3hNGzV/yE53V1p6o6dnu/LPo3IHztZ6
 PWz7JvvyTBnl+Frm7jmJUT9qWtYQIuKHLfsJfPk+ruG74FA+ffwR0VnU1
 yyClTABadtnetQC/h6WeYt5rA+7my5eXMvEekGSl3Q9b4BJh8Q3KQLk3q
 iUdctB0whYLWJlWxnUmb6NdXgK+/JjCNvPIgLoBKKPhxHbP5g6eOuQ5NN g==;
X-CSE-ConnectionGUID: O+/eav4rQ7+afCyH6ZYz2Q==
X-CSE-MsgGUID: qab+8A6ZRc+pyff3nX9bag==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917456"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:36 -0700
X-CSE-ConnectionGUID: DI8z0r/nSS+/OJ7iRFajyw==
X-CSE-MsgGUID: 75ZSyN1XQpGmooJuocRh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488298"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:34 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/14] lib/igt_kms: add function to check if retrain
 disabled
Date: Sun, 25 Aug 2024 23:44:16 +0530
Message-Id: <20240825181424.4034541-7-kunal1.joshi@intel.com>
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

add helper to check if retraining is disabled,
retraining will be disable if we are at the lowest
link parameters or the lowest mode supported on a panel

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 683989e84..2720095d4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6869,3 +6869,27 @@ void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
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
index 57829416a..2d69d794a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1253,5 +1253,6 @@ enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
 void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

