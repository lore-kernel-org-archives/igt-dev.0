Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37736C27C5E
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C810910E2C0;
	Sun,  9 Jun 2024 21:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqeuGYDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEED310E2C0
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967627; x=1749503627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7aX9XgY0IhmRcN/vE2bpgBGIMOZTOWpyLsRcTv1pW4=;
 b=kqeuGYDxfwOK15F52PqscDVWn4p7Fuf2a9rtoc47I0oiE3wUvV+9Vb27
 zEqCKtiE1Uc4UF7a5lHf6+E6Dw8/z6Q9dEKe0dsWGCvI5F+dY1f1NiJ81
 BGEPmcCrJPGc3Okr6ixrq1T3oXu3SR7SWb2v/rR/nn36IsQxG2Pr4b9Tm
 Cb59qO6ZPrRJXrHyc+wuWOX+Z+lmWApOw3yEdBU6iCZF5O4ejEIeR72Sh
 HphME++/84UVfuq8Xy2Mxlz7OpuxZpLnkRJ3GBmqw+q7gOvWqozMUFzuP
 7qsqTZJFrPoAscx10J+0CCqcVsE3ocojEUyl3IW+44FlVh0G4rQasJDok w==;
X-CSE-ConnectionGUID: wRYTqiK0SJufTB8jaDUfOg==
X-CSE-MsgGUID: P8J6DCUzSw+RD8ycC83cAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037481"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037481"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:47 -0700
X-CSE-ConnectionGUID: hHEDrxLcT1+cZEf1SVouzA==
X-CSE-MsgGUID: j2pkGs62SvqcQFH4kloEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991023"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:44 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/9] lib/igt_kms: add function to force link training
 failure
Date: Mon, 10 Jun 2024 02:55:30 +0530
Message-Id: <20240609212535.868832-5-kunal1.joshi@intel.com>
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
index 922982ef0..91cc5a347 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6700,6 +6700,50 @@ bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
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
index 794059e3d..5b4afec87 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -300,6 +300,8 @@ bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
 					int lane_count);
 bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 				       int link_rate);
+bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector *connector,
+						   int train_count);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
-- 
2.43.0

