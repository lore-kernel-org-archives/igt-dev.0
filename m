Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2874EEE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878B410EADB;
	Thu, 12 Sep 2024 06:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHLvUeGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1A10EAD5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121809; x=1757657809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TuPM2hYDWjfKy6MRjkoJ39WkvHzekek9OZKNPHzv6U4=;
 b=MHLvUeGLAcO9IiKm2ceXgLSEFwBGixRMYUwVTTbMpRMKw/JIOYnExOX6
 zYp2WydnqyRqVlk54JBtGu7mSKg8IyuIK3ZJktjBKP0RGL1/PgGvGU/oA
 4ukceg/toKGGIjVph18PwGyMav5EOksTvtHh4OzqVOfGiU7VitUJUOyYX
 FubPvAQHaObPSu+7mFgs2bkGmTBtluAuBGfEofwS/nG1TtiAw26ae6EW7
 xKCZU+5jijBZFIIREpMGKqDRaMusvrFRRJjr/+dWqZv8TB+hvsSzMELxo
 aYhT8k68fMhhH+gCT4uydmUuWylLPGnIlR1x1UMkOGReSGM4ERY3kFCpJ A==;
X-CSE-ConnectionGUID: n0RT4WphRUSc6QeBdVOy7w==
X-CSE-MsgGUID: gsOk/9iAQQCP2uQegs+prA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25056619"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25056619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:16:49 -0700
X-CSE-ConnectionGUID: FkEOeOhORWObvo7vmkO/LQ==
X-CSE-MsgGUID: 9iOrfQ4RT5qr+KHg3b9ruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="98310278"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:16:47 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/6] lib/igt_kms: add function to reset link params
Date: Thu, 12 Sep 2024 11:58:37 +0530
Message-Id: <20240912062839.760661-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

Writing auto to i915_dp_force_(link_rate/lane_count) and retraing
afterwards sets max link param's supported by sink.Reset link rate
and lane count to auto, also installs exit handler to set link rate
and lane count to auto on exit

v2: no need to do link retraining (Imre)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a7f8d0f83..f841a69da 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6957,3 +6957,36 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
 	sscanf(buf, "%d", &ret);
 	return ret;
 }
+
+/**
+ * igt_reset_link_params:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Reset link rate and lane count to auto, also installs exit handler
+ * to set link rate and lane count to auto on exit
+ */
+void igt_reset_link_params(int drm_fd, igt_output_t *output)
+{
+	bool valid;
+	drmModeConnector *temp;
+
+	igt_require_f(output->name, "Invalid output");
+	valid = true;
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_link_rate",
+						    "auto", "auto", true);
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_lane_count",
+						    "auto", "auto", true);
+	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
+	drmModeFreeConnector(temp);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9dca09d93..3c867031e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1236,5 +1236,6 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
+void igt_reset_link_params(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

