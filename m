Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46AECDD1B3
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839C10EC50;
	Fri, 27 Sep 2024 13:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LReCBFUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDD910EC50
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445031; x=1758981031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIv7vB223D96QQ1n3fgDTbeWUUtE5JXDhtOqsEnlElw=;
 b=LReCBFUT9LQicQakabowHsol4jkKChs4a3cC8VxQiSVAJ+8oIYRryNin
 qYpbB1acetWntNLujruV8E6MVK6tgmyfxN3QEZTugl4/HnhssyLp2d0uG
 l//IyJWbkxI4nfzsSd1EHgJq6mFdulf+77CNz49rDluhnSELtRbu9FFjE
 Su0lkQKIMBtxTdQfaBtYvAfSpw2vTDxyQVERPbAp8GaILdIhCyvXkCzdE
 btJWwZjXnAtqHWSLIGGVJ1Z97JioAyOJGORjVBpB4y+Yy6qfiCAgFeV8H
 3YPaMQLUdxMJmkh+1TbeoHO5bSh+PzOXPXOfXZSb1pkgbPRcNnFgXQbdY Q==;
X-CSE-ConnectionGUID: A7443mJ3Q0W7IVRNcFPQqg==
X-CSE-MsgGUID: 8p/QyZOxTSeE1EU1k3Jsqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49116004"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49116004"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:28 -0700
X-CSE-ConnectionGUID: wGS7i/p5TCyHy5sLPOyQBA==
X-CSE-MsgGUID: nQYNCiKTTKec9XR9LZv64g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850024"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:26 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_kms: add function to reset link params
Date: Fri, 27 Sep 2024 19:32:19 +0530
Message-Id: <20240927140222.1688565-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927140222.1688565-1-kunal1.joshi@intel.com>
References: <20240927140222.1688565-1-kunal1.joshi@intel.com>
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
index c219aa0b1..18744055d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7025,3 +7025,35 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
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
2.40.1

