Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE11C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4A10FE2F;
	Mon, 29 Apr 2024 09:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoiTsgKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F26710FE2B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382164; x=1745918164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7I5637p18JkulRvXfSOupy4CGB3VGRxBh9zNJyaQUc=;
 b=QoiTsgKcru2Tc7I5iFG9n2g+V8Dy6mfqrQCL+WdZxe6FjAGd8W1JJgSK
 jS6t2d89hxaWeABRlbyGiJxRaapM2ZVfZ4ga+Aoh0skSG4sCncxnFmoUG
 oeCHjiptF5GwuQyXasbAXRltqSNgCzvvgaq0GhJOtuWK1b/NT5kU9GoUG
 FFMHBDK1b26C+tqH5hVQ2zyL2G90QblBSyeWc567jH90kOkQo7xZX6KFk
 Zv0ZQKf+iAjQNdiWKVl7UN9YvDnBoVLl11xTgn7HE53KLO5JLZaMrnCe+
 8gj3YTmiERrbey0e+f+bePA4p9b+maG+Nmi2WJWPBqDaasX6Df6QWiu6/ g==;
X-CSE-ConnectionGUID: elj7MX99Q5GbBajRjKLdNA==
X-CSE-MsgGUID: N1fgYV4nSYSk7JbLFjBdQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428317"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:04 -0700
X-CSE-ConnectionGUID: 9RsNs8RKQlG22y4Y6w4GBA==
X-CSE-MsgGUID: 8luPOq+pSIqZHMlK87kp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059848"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:02 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 2/8] lib/igt_kms: Update force joiner debugfs check
Date: Mon, 29 Apr 2024 14:39:24 +0530
Message-ID: <20240429090930.1905110-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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
index 6a41b535b..743650321 100644
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

