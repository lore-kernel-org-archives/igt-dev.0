Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED8DCCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3C10E84C;
	Wed, 25 Sep 2024 18:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOlVKhLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2BD10E84C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288270; x=1758824270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2O3OIYP9b7zRDD50IBZxaZ/zzsmHIPV8xA6CSwmoSdI=;
 b=iOlVKhLqQdL+RKMoKC7qUxc8Ct9rqkHh1MUbWGjCRYT3om/ShWmuRSMd
 vsrjrnQkby/gb0hEpRi8btmMzTtWtJM8RRQXwmD2ugw0VbeJuZmrJxWaH
 UjjErzp6UqdWapNsyhseogjN1cuBKukuB/AGRt/ooSwzO6VJL0PpsfYTR
 /Dol8DUxrJj5ITLGxB9B63gaOKPysrMCbk8AJCzMGm31mgIRjOlfNMNWK
 nH2Cgs3BnEqEMVG6675eRWPC14WbvUawjWhcVj25OVxnm0udOZN9w2/jg
 5eL6HlqZRpOo7iRILOsa0CqjRyC6rRljMx5B+Jujqo+Xh+zSx8W89LAjH A==;
X-CSE-ConnectionGUID: rUpYpIlITHyFkaLDISwjsQ==
X-CSE-MsgGUID: eRwP/J46QPe3BQz2Os7JUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032360"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:49 -0700
X-CSE-ConnectionGUID: NDIoq5uXS0m1GN6irXIFSg==
X-CSE-MsgGUID: qmiPRdU/S0iPl7j5tR9TpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324315"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 3/7] lib/igt_kms: add function to reset link params
Date: Wed, 25 Sep 2024 23:59:40 +0530
Message-Id: <20240925182944.1603015-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0582d4d25..2d8a6f54c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7022,3 +7022,35 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
index 7d9c28d81..f0f105f4d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1234,5 +1234,6 @@ bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
 bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
+void igt_reset_link_params(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

