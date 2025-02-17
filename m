Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8373FC021A6
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AC10E36C;
	Mon, 17 Feb 2025 06:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZ6xfM0I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25110E36C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739773626; x=1771309626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q6tEeaDG9UC6w1hhrldUQ3x0dDiKfSEWgSJ8GwtiZxk=;
 b=IZ6xfM0IeNwAtSdESVG1ws8vF0iVLe0UGcpTX2EeKqWGgoCDqmsrb4CU
 8+mKFPgmCu/UnN4oZwI2oTKM+H38BEB6Rg5gwaomE8Hhczn1z5T1iM6YU
 1i+zdPvFh9cXrdVESu9Sm8x1kk1jFxBfzQrRAObwYjNZSg06YWwM/CAql
 MnJI8qoLkJ3AhfV5gtskZpjF9t2i4xPQmcYka6zvXlgDXSmMU4M/OoQHs
 PdUvFdO+E78x7df1FbYcmA5svprkUFJiRI4ELrDWFaiaUEg1PoGn2WodZ
 Fmt9HHQi5B9EkX6NayW0yidIYUxtvDWthJd0SJUbg5dF2j/rMeIgpt0Wp A==;
X-CSE-ConnectionGUID: DyEkJY6eQn+UbMcl2bR3fw==
X-CSE-MsgGUID: qoRlyUipQLiDAZPbKCTkVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40149657"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40149657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:27:06 -0800
X-CSE-ConnectionGUID: DH2W/YJXRsWWEdVyBQiQcQ==
X-CSE-MsgGUID: 198f/YjGQEiqLNTd8zWtbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114661963"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 22:27:05 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 3/4] lib/igt_kms: add function to set link params
Date: Mon, 17 Feb 2025 12:12:38 +0530
Message-Id: <20250217064239.2019316-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217064239.2019316-1-kunal1.joshi@intel.com>
References: <20250217064239.2019316-1-kunal1.joshi@intel.com>
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

add function to force link rate and lane count
for given output, install exit handle to set auto
at exit

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0ba1afb08..bc46487c5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7269,6 +7269,39 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
 	drmModeFreeConnector(temp);
 }
 
+/**
+ * igt_set_link_params:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * set link rate and lane count to given value, also installs exit handler
+ * to set link rate and lane count to auto on exit
+ */
+void igt_set_link_params(int drm_fd, igt_output_t *output,
+			   char *link_rate, char *lane_count)
+{
+	bool valid;
+	drmModeConnector *temp;
+
+	valid = true;
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_link_rate",
+						    link_rate, "auto", true);
+	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
+						    "i915_dp_force_lane_count",
+						    lane_count, "auto", true);
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
+
 /**
  * igt_backlight_read:
  * @result:	Pointer to store the result
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7227f0b0e..31b9820cb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1271,6 +1271,8 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
 int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
+void igt_set_link_params(int drm_fd, igt_output_t *output,
+			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
-- 
2.25.1

