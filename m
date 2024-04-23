Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34A0C10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92510FC2E;
	Tue, 23 Apr 2024 12:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEJq9Izg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD8510F7FE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875578; x=1745411578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2IXNl9B4Fpds9A5bNTzP75UIy1lJqNs72C2ZOlGuvOQ=;
 b=PEJq9IzgC4jg5qiqP//wcIRt4TvqT2HghgStHegRWXOYh2g6rgnZpfXY
 nNXjEheF8UO3nv3c+MlUX7cyZ03umxx9FwlJbq7zmmLyKwfqssKyKL5gh
 0J2bVnMKME313GjWFog/crEj8sF2TCJGPuUgqoRg6DsKWhgPrwY9kCG4/
 R1JFxwcvs7KFiCs2/xa+ECrOX1D1MwBGbOk1so7H+Knkt44VzeZb1miXQ
 mbLTtQceiWBcvLjyStjFio6bbujlz+MhWQ9MViFRc5YnL5cPe+87mAUPy
 VEJvHOyp9uVEDxbaZhJA3yH2D5ytxH9pSlP246xXkF2b02x8Xg5q9jbqS g==;
X-CSE-ConnectionGUID: EQrH+BbkRByJsesdVI+ipA==
X-CSE-MsgGUID: +TcFpffWQ1qJfhUiR0AEdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067047"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:32:58 -0700
X-CSE-ConnectionGUID: SAI6+I77QiOtpYzIEvc+Dg==
X-CSE-MsgGUID: UnVrDFpeSwSLFVw4Xoe/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361322"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:32:56 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V4 1/7] lib/igt_kms: Update force joiner debugfs check
Date: Tue, 23 Apr 2024 17:56:30 +0530
Message-ID: <20240423122636.1241111-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
References: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
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

As we are using only connector name in the API, no need to
pass the igt_output struct, this patch will update the helper
accordingly.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c                | 14 +++++++++-----
 lib/igt_kms.h                |  2 +-
 tests/intel/kms_big_joiner.c |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 98d3fb79c..b36f19843 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6306,15 +6306,17 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 }
 
 /**
+ * igt_has_force_joiner_debugfs
+ * @drmfd: A drm file descriptor
+ * @conn_name: Name of the connector
+ *
  * Checks if the force big joiner debugfs is available
  * for a specific connector.
  *
- * @drmfd: file descriptor of the DRM device.
- * @output: output to check.
  * Returns:
  *  true if the debugfs is available, false otherwise.
  */
-bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
 {
 	char buf[512];
 	int debugfs_fd, ret;
@@ -6327,12 +6329,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
 		return false;
 
-	igt_assert_f(output->name, "Connector name cannot be NULL\n");
-	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	igt_assert_f(conn_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, conn_name, O_RDONLY);
 	if (debugfs_fd < 0)
 		return false;
+
 	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
+
 	return ret >= 0;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 01604dac9..979cf1300 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1215,7 +1215,7 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 4979cac06..7c370bc60 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -323,7 +323,7 @@ igt_main
 				data.big_joiner_output[data.big_joiner_output_count++] = output;
 				igt_output_override_mode(output, &mode);
 			} else {
-				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
+				if (igt_has_force_joiner_debugfs(data.drm_fd, output->name)) {
 					force_joiner_supported = true;
 					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 				}
-- 
2.43.2

