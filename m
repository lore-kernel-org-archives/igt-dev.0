Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E418C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24AF10E2F7;
	Tue, 30 Jul 2024 21:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMBK0LT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7721310E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375349; x=1753911349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HDRTdwjWuip7qH1mrnLiTE22NCvFVlFOCixW72SJsnk=;
 b=LMBK0LT4a55g3b22HU0HilEVszKQK6PYCrrq2t/hVCuhQs14az7GWaC7
 gvqWCAlQWggwcKt9v7egKmU8LUBRvEaJa+5ZrU9uGj+s+0jK9a7l655pT
 8dFUplfdp4z6jHVCoKKdMf5ijjwLO/vnrGU6KcunxHyY7zX7Zr9xs6LSp
 b2x3fxXoPN/bywLibbKd783CD/nH0POdVHklz0+MvGpPDSCk+EGWFTg2l
 HTeOBX/33fZYifTByV+qnDGNoN0V4txhwwtYM9qtiKe9sfrkDcgL8zXZx
 621LeqfMZNQ3WW1xT6XydzX26TkQ8MlYg2OlR0RvwzPx70Ft+oa759dxW w==;
X-CSE-ConnectionGUID: 0M+iQ1XWQbCkjK08GsjCzw==
X-CSE-MsgGUID: zjJ5pV/5TiaYx5djp8tJ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694594"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:49 -0700
X-CSE-ConnectionGUID: VG22UunSTBSCAjYJuXpt3A==
X-CSE-MsgGUID: ZrA5h0EFSra26ek4RkC1cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321722"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/10] lib/igt_kms: add function to force link training
 failure
Date: Wed, 31 Jul 2024 02:43:35 +0530
Message-ID: <20240730211343.58703-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

[1] exposes interface which allows to force link training failure on
given connector.

writing below integer value does following action
1: retry current link paramaeter
2: reduce link rate/ lane count (in order respectively)

[1] https://patchwork.freedesktop.org/patch/594767/?series=133624&rev=3

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6d2144483..dd43d655a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6781,6 +6781,50 @@ bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
+static bool force_connector_link_training_failure(int drm_fd,
+						   drmModeConnector *connector,
+						   const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_force_link_training_failure",
+					  value, "0");
+}
+
+/**
+ * kmstest_force_connector_force_training_failure:
+ * @fd: drm file descriptor
+ * @connector: connector
+ *
+ * Force link training failure on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector *connector, int train_count)
+{
+	char value[2];
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	snprintf(value, sizeof(value), "%d", train_count);
+	if (!force_connector_link_training_failure(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
 /**
  * igt_get_dp_link_rate_set_for_output:
  * @drm_fd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4ffe03bfc..f5b3017d3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -292,6 +292,8 @@ bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
 					int lane_count);
 bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 				       int link_rate);
+bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector *connector,
+						   int train_count);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
-- 
2.43.0

