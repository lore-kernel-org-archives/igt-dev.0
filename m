Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420BEC3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B2310E300;
	Tue, 30 Jul 2024 21:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lm12FsMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258B410E300
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375351; x=1753911351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vifCCr7/BwPrFdzZM6hpDIQSPZ+LRfRcmGupdo7c0UM=;
 b=lm12FsMKfzhhKzZkeVpmv5jHUtbt2nfUj8FczRabIWkqsd7Q60eUi3vP
 GJnVdBMBVPhtLzVPCdSeMNoyHsAg03lGou9vixSqccxq1iZ+LvNxfNmUd
 A80eufMePNDQAr8veb83jZ8DFayzi/eDrunHASkgih6bQhTjuyXSRuhXa
 VRB6toNLeLCLNlt4T1TO3FjxYvoMNjeRpKfEJ2vtu4TFlCMJwVQ3W8FKN
 PZecU+5HqTP5G++zk634xClkFa5P7rTbVl5G8TSg5vFc1zbyhYJPXX7Kt
 GJoHo0X3Qo+D2o7+5LGumMNKLqNYslRdi4RoM6z9sOnWR9LtVhlZ78VJ2 g==;
X-CSE-ConnectionGUID: vEQc5Ns9RM6pkZA1EZbxmw==
X-CSE-MsgGUID: Ex0c5VjbQPimfwOCm9OIzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694596"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:51 -0700
X-CSE-ConnectionGUID: pzvQq4xBSMSFBRngTi28Sw==
X-CSE-MsgGUID: f2Wo/q61SWeOrcZnN4oDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321725"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:50 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 05/10] lib/igt_kms: add function to force link retrain
Date: Wed, 31 Jul 2024 02:43:36 +0530
Message-ID: <20240730211343.58703-6-kunal1.joshi@intel.com>
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

[1] exposes interface which can be utilized to apply previously
set link rate/lane count or force link training failures

[1] https://patchwork.freedesktop.org/patch/594772/?series=133624&rev=3

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd43d655a..a5bc0adff 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6825,6 +6825,50 @@ bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector
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
index f5b3017d3..310b835f6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -294,6 +294,8 @@ bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 				       int link_rate);
 bool kmstest_force_connector_link_training_failure(int drm_fd, drmModeConnector *connector,
 						   int train_count);
+bool kmstest_force_connector_retrain(int drm_fd, drmModeConnector *connector,
+				     int retrain_count);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
-- 
2.43.0

