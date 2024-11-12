Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81142D42BA4
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 16:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752410E160;
	Tue, 12 Nov 2024 16:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFZRxYn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ABF10E160
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731428410; x=1762964410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cvKSvsd14n020g9HPxLB0a3awBaqazxYLEVQjvsJAg8=;
 b=AFZRxYn2ozZou4L2d3yykqr4o/4TxXPmV/aD3Sf2yyxgrSDqJS7ZPEVs
 8ir0aHQtGQW5O0aRO8EEHnpgHSAs0vJZ9CFnTIhIm4FaDaK7t/BcDfrAk
 FOpkvIK4gTLUh0rVpmsHu5FIas2gFtSj8Bsy2ePyVHxO4sLBLJ0C9b+jD
 6ZHH6hdIR5lu7zmY035HGrDGVB2GG4H9tzHeSGcx9HnDfkj6FFKck9783
 XD3llIcahieJt+UtoVIYGb4Bm1YAmOxRrZcelx9gSVxoOsEVOXyPdFJKH
 +9CpqMpZU08FPG2p9zi/UnudaKOV3LHHo2rNr+2hLGw12wMyKXlkuv3Hx Q==;
X-CSE-ConnectionGUID: dDqfDoUeQ2+OB/I+kHgPiQ==
X-CSE-MsgGUID: qgJJ6SMaRIuJGqQMUeMhwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30677740"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="30677740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:10 -0800
X-CSE-ConnectionGUID: KZYReBx8Q/WWMAfrphRw2Q==
X-CSE-MsgGUID: NzFcFgaqRoupQM4SD1ZjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="125036666"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:09 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a single
 CRTC
Date: Tue, 12 Nov 2024 22:04:34 +0530
Message-Id: <20241112163435.1351560-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112163435.1351560-1-jeevan.b@intel.com>
References: <20241112163435.1351560-1-jeevan.b@intel.com>
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

increase big_joiner limitation to 6k from 5k for display version
greater than 30.

Bspec: 68858

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++--------
 lib/igt_kms.h |  5 +++--
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5d8096a17..ca7f90ca8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6330,6 +6330,7 @@ int igt_get_max_dotclock(int fd)
 
 /**
  * igt_bigjoiner_possible:
+ * @fd: drm file descriptor
  * @mode: libdrm mode
  * @max_dotclock: Max pixel clock frequency
  *
@@ -6338,10 +6339,13 @@ int igt_get_max_dotclock(int fd)
  *
  * Returns: True if mode requires Bigjoiner, else False.
  */
-bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
-		mode->clock > max_dotclock);
+	int max_hdisplay, dev_id;
+	dev_id = intel_get_drm_devid(fd);
+	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+							   HDISPLAY_5K_PER_PIPE;
+	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
 }
 
 /**
@@ -6362,10 +6366,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	bool found = false;
 
 	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
 	if (!found) {
 		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
+		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
 	}
 	if (found)
 		*mode = connector->modes[0];
@@ -6384,7 +6388,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  */
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
+	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
 		mode->clock > 2 * max_dotclock);
 }
 
@@ -6549,7 +6553,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
+		    max_dotclock)) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i].idx),
 				 igt_output_name(pipes[i].output),
@@ -6576,7 +6581,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 			}
 		}
 
-		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
+		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
+		    pipes[i - 1].mode, max_dotclock))) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i - 1].idx),
 				 igt_output_name(pipes[i - 1].output),
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bd154d1c1..a1d2b8632 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
 const char *kmstest_dsc_output_format_str(int output_format);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
-#define MAX_HDISPLAY_PER_PIPE 5120
+#define HDISPLAY_6K_PER_PIPE 6144
+#define HDISPLAY_5K_PER_PIPE 5120
 
 int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
@@ -1238,7 +1239,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
-bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
-- 
2.25.1

