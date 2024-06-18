Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2131C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815710E5E3;
	Tue, 18 Jun 2024 08:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao6PpN/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5710E5DD
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699457; x=1750235457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IulcTualU95Ns1HYPGKbBTy8qxjVjPldRUUsbtl/uT0=;
 b=ao6PpN/V924mIzs2O0DziNxIomeRze5qF/W1pu+PE+Y/QZ9CkGpqWtPz
 Ho4kPuWl/N2RGZmVByDIMjBxxfgyfOVGeRMhgmAY1c9H6qSyG68z92oDJ
 Hut0NK69hQhLHW+x1iQ2yDGP1Tqfq8PA42U5oEzTD1O0Rykw2zw4pZQG+
 zsrPk7Nrjf9Vf+lqMcmMPbC/QafDh82x/4FmmqoOqeZg4Txp6EQTGBXOn
 ZrEw3/pDW+4ISCPE53bGRruOSU2E5zSzsbphB7mRWBbLKlbXCdPqbkGwY
 YT4CgNJQtXn7ZSZIVozTjfDA4qQvC+FJZflraeR0Ox/+igi+oX2NiK+lW A==;
X-CSE-ConnectionGUID: GtufGS09TQC7sIVWd55Xtw==
X-CSE-MsgGUID: SJmb47TPQoOLjg3+y8GZfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082170"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:57 -0700
X-CSE-ConnectionGUID: csQGa8tVR1O6UwBowlz5Ow==
X-CSE-MsgGUID: fb77iY5nRrm9QOYGiGwTDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699545"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:54 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V6 2/8] lib/igt_kms: Update force joiner debugfs check
Date: Tue, 18 Jun 2024 13:52:42 +0530
Message-ID: <20240618082248.4070611-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c                | 14 +++++++++-----
 lib/igt_kms.h                |  2 +-
 tests/intel/kms_big_joiner.c |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5a1e47183..c0aa92eb5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6325,15 +6325,17 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
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
@@ -6346,12 +6348,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
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

