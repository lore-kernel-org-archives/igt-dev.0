Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E33CF9C69
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCB210E356;
	Sun, 22 Sep 2024 21:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5u6I+Gs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E5810E356
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039637; x=1758575637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SXL2SEk+Ut2l6F1dZLXw+JNVDkn8JOgqKiG5YwVsEQo=;
 b=a5u6I+GsT05m3OAua6sU+qHvvA/UHRQl9jiSwsDL0a+9cxKhR3Co2H1k
 9td1kn7dz0U26C/k0DZAdHM8qKsV51/EYNpgeMSpNiBI5ExKYrcf8+Xj0
 BjQ4uKxK/fRY7kstfICRQ1H3O8WzxgZVROw7pSFJdE+zaLTxJoV7To1+Q
 QlogMkSGboEne5Y3LWeCsSr4rFXmFS9GZiJk8RJG/ClkYW4BY4JiesyWN
 jM1qZ2tGrvH6Hn4wq2Meoe3Frv+Qb3jrL1icM7gWrQtI5cgLdXkJHaNYT
 /gzLqY2hIWZ0p0726go0CN5YiGGCmILebNk9RtbPKX6VFK5V9QVJeNS17 Q==;
X-CSE-ConnectionGUID: jPKdar+OTq24bL5NfAGpRA==
X-CSE-MsgGUID: xztfbpWwQUiCEcX8GRlMYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641012"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:13:56 -0700
X-CSE-ConnectionGUID: klZEqVbyR7OKAcELVNXOAw==
X-CSE-MsgGUID: HmBRhCxHSiWppPptBOPBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188110"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:13:55 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_kms: add function to reset link params
Date: Mon, 23 Sep 2024 02:55:46 +0530
Message-Id: <20240922212549.1361889-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922212549.1361889-1-kunal1.joshi@intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
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
 lib/igt_kms.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 011f3768a..96da33a48 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7062,3 +7062,35 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
index 34a671bce..264de4bb9 100644
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

