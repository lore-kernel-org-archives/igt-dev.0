Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5C1D44148
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 12:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036EB10E128;
	Tue, 19 Nov 2024 12:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNd6Fgc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29FC10E128
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 12:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732019653; x=1763555653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=52ZJ5569qZ4hGMA7fvNjKUMKsro3B4e+L5MJjcxpcN0=;
 b=JNd6Fgc4+CyLcPIjqhJHa16aX+O2E3ZsTdtV2oZL83LJSgXaBrTJID5o
 iRn7/4+5cV8Tuu+uBYQ9zmWCV1DCvNPfWQ0K0HTgzYl7AZC5XRtri+FZ3
 disk5FHZ9aEOX8eCjHT/MSxTfGr/YI+GKPC4Iqrvssit51LnQjhbg8CwN
 0qHK0LDTyA1Q0XGtlQngVf7M2BxPAzVqFK1ZYOf+VPqOV19by14/K9dFI
 1qakvN0NbQss6//TQsv/Cpso+82hprKVeAU9mPLGeD77vScpQIV31T1jb
 smlLN2L19YSczwBbOuD+QkeTlniDiTOYmvwcObMenov3rlDaFaNxPH+65 A==;
X-CSE-ConnectionGUID: CMono2PnRTWLMjeZmOj8Aw==
X-CSE-MsgGUID: IAa8M/nRQwauPvDhEgEWYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35684457"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35684457"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:34:12 -0800
X-CSE-ConnectionGUID: jHwRgRK2SU6OPTkV6HmpsA==
X-CSE-MsgGUID: 1B1O61XTRYeyRDb4zsEDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89548283"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.5])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:34:11 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] lib/igt_psr: Dump out PSR status if waiting PSR entry or
 update fails
Date: Tue, 19 Nov 2024 14:33:24 +0200
Message-Id: <20241119123324.4070696-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are receiving reports from CI testing indication PSR entry of
update are failing. It would ease making conclusions on the reports if PSR
status when failure happened would be available. Solve this by printing out
PSR status if waiting PSR entry or update fails.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83c21e6ba..61feea9aa 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -88,10 +88,9 @@ static bool sink_status_checks(void)
 	return env && atoi(env);
 }
 
-static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
+static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output, char *buf, int buf_len)
 {
 	char debugfs_file[128] = {0};
-	char buf[PSR_STATUS_MAX_LEN];
 	drmModeConnector *c;
 	const char *state;
 	bool active;
@@ -113,7 +112,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	SET_DEBUGFS_PATH(output, debugfs_file);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
-				     buf, sizeof(buf));
+				     buf, buf_len);
 	if (ret < 0) {
 		igt_info("Could not read i915_edp_psr_status: %s\n",
 			 strerror(-ret));
@@ -137,11 +136,22 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
  */
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 20);
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
+	ret = igt_wait(psr_active_check(debugfs_fd, mode, output, buf, sizeof(buf)), 500, 20);
+
+	if (!ret)
+		igt_info("PSR not active within timeout. PSR status at the end of the wait:\n%s", buf);
+
+	return ret;
 }
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
 	/*
 	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
 	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
@@ -149,13 +159,21 @@ bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 	 */
 	if (output != NULL &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
+		ret = igt_wait(psr_active_check(debugfs_fd, mode, output, buf, sizeof(buf)), 40, 1);
 	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+		ret = igt_wait(!psr_active_check(debugfs_fd, mode, output, buf, sizeof(buf)), 40, 1);
+
+	if (!ret)
+		igt_info("PSR not inactive for update within timeout. PSR status at the end of the wait:\n %s", buf);
+
+	return ret;
 }
 
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
+	char buf[PSR_STATUS_MAX_LEN];
+	int ret;
+
 	/*
 	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
 	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
@@ -163,9 +181,14 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 	 */
 	if (output != NULL &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
+		ret = igt_wait(psr_active_check(debugfs_fd, mode, output, buf, sizeof(buf)), 500, 1);
 	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
+		ret = igt_wait(!psr_active_check(debugfs_fd, mode, output, buf, sizeof(buf)), 500, 1);
+
+	if (!ret)
+		igt_info("PSR not inactive for update within timeout. PSR status at the end of the wait:\n %s", buf);
+
+	return ret;
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.34.1

