Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68278C27C55
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5714710E2CF;
	Sun,  9 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO47HsDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92C710E2C3
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967628; x=1749503628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7hxxAoWYmD2OSzT8DEZA13Vkx3HiY06O1MNbKkYXb8=;
 b=AO47HsDLvBXxYtaV1pDKkV151lClwgHGJduZeYWKwzgeT5nLAegIXK/i
 h3LC18XIbJWGEpZ2FKt4scklQ/QSdtIbgHnlBsRDzLu+mmYpMslfi/OSm
 I7iUnpo2SBKEtnMWmVKh3m1FxTJB21/mHeb7jANF0hD8MKas92foboXZS
 i2nbbLcV2rrtDm8HPRutrh4NHUTv0T7iEySdQjuyxDhtHolun22AzJO61
 AqgDxKPlobYuH+y5ntlvyCDvpwEhw0HZ7/pxkfhhQXXJZwuGwOxIFE/Ni
 IaOKIvCjW2h4OX3QUH9nSpKkIx3MzyK8W45pt15N1QFkXfrWg84peC48b A==;
X-CSE-ConnectionGUID: xR/JYSNGTc+Pc5nEmdqPFg==
X-CSE-MsgGUID: Eh/n3f7KToeoa720ay+TvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037482"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:48 -0700
X-CSE-ConnectionGUID: GzV6Aui9R1+EYdLZesruGw==
X-CSE-MsgGUID: j91EKjDpQgeyzcjPNwrt6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991026"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:46 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/9] lib/igt_kms: add function to force link retrain
Date: Mon, 10 Jun 2024 02:55:31 +0530
Message-Id: <20240609212535.868832-6-kunal1.joshi@intel.com>
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

[1] exposes interface which can be utilized to apply previously
set link rate/lane count or force link training failures

[1] https://patchwork.freedesktop.org/patch/594772/?series=133624&rev=3

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 91cc5a347..1bd6c31a7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6744,6 +6744,50 @@ bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector
 	return true;
 }
 
+static bool force_connector_retrain(int drm_fd,
+					  drmModeConnector *connector,
+					  const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_force_link_retrain",
+					  value, "0");
+}
+
+/**
+ * kmstest_force_connector_force_retrain:
+ * @fd: drm file descriptor
+ * @connector: connector
+ *
+ * Force retraining on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_retrain(int drm_fd, drmModeConnector *connector, int retrain_count)
+{
+	char value[2];
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	if (!force_connector_retrain(drm_fd, connector, value))
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
index 5b4afec87..d58676a1e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -302,6 +302,8 @@ bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 				       int link_rate);
 bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector *connector,
 						   int train_count);
+bool kmstest_force_connector_retrain(int drm_fd, drmModeConnector *connector,
+				     int retrain_count);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
-- 
2.43.0

