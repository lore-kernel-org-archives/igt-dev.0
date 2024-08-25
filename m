Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEEDC5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FC510E0DF;
	Sun, 25 Aug 2024 18:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ey2TKOHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109D10E0DF
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608962; x=1756144962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qb2+KQNr4yh6a4MOnwpDtHcMSrDIyO5n3n2llx9ykUI=;
 b=ey2TKOHBrVCbIPUSe01/fPdB5mn3WhMSIluUEDVF5lPYfNaZ2gNTKAZZ
 OIw+d503yaaTyUj3a+NWe455/URpPI0KVr6wGyDlXxjj1RHLnv6r2nKb8
 WpP1ON9Wzz55ISnMFQGFGBXnUYvR5VDgPz4sQWPVljkCeuyHOxnMz55kX
 LkFJR2moqB/QeUYpe+57CcF3jJtyieOS51VvthOBgagGCtdW4Z+bexKs5
 Vu/CCYwqqGpBR3V54ylzAPRQ9u0lxP+diGcZh+f4z08WGM44gFLuXVQv9
 f1GfjU6SI+2BiKZDGoRqC5TRQmIuG9Jl82TYY3utIWyRukp7HkmdSZMu4 g==;
X-CSE-ConnectionGUID: EtUzIqeJTSGdh7/VQWVvKw==
X-CSE-MsgGUID: WT+4YUc/QTmT7z36LLSgIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917462"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:42 -0700
X-CSE-ConnectionGUID: DC+VdVbWTLSmgtaLtHHyEQ==
X-CSE-MsgGUID: 23pgvzq/RgeGzpqor2GuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488317"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 11/14] lib/igt_kms: add function to reset link params
Date: Sun, 25 Aug 2024 23:44:21 +0530
Message-Id: <20240825181424.4034541-12-kunal1.joshi@intel.com>
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

Writing auto to i915_dp_force_(link_rate/lane_count) and retraing
afterwards sets max link param's supported by sink.Reset link rate
and lane count to auto, also installs exit handler to set link rate
and lane count to auto on exit
---
 lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0533f6ae..b7511ccfc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7000,3 +7000,39 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
+						    "auto", "auto");
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_lane_count",
+						    "auto", "auto");
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_link_retrain",
+						    "1", "1");
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
index 3d7842b36..847609379 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1259,5 +1259,6 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
+void igt_reset_link_params(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

