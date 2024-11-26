Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB900D3B9AC
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683E010E921;
	Tue, 26 Nov 2024 16:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIGZ0yyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D949710E921
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637736; x=1764173736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gOsek3TwUYv1yLKtKsKec3QrBaucEQwj6/XxGfBRoCU=;
 b=ZIGZ0yyDpA1pzh2ut5JA4dV8v0H8Ta+OFydiYZXxpfblLe6QBxZRTlUK
 dqEXhRqqRDJP97ykHr6C1NLnEyJ+JYpzWJ4Gx38zAIwZLcLUjduZqoQAL
 eBI1BpxozOYJiWeHuTMBlE+sTwRo5elbSgVvuuXz4d1Hr4Iv0lbFiUjIs
 Ri/kGesf78RZ2Ym4AANzfcJM+l7RSmdZw1oCECOgKCf9W9l8FbbM9RPjV
 ImS+I189AVJrj9nkvvvaFqXaisy8pGABT42lk7greUE0RoV7cD5fcz8KV
 IQpCaOpy6EEuQdco61cyhftX/V9wsvEP9YwZI1YrGb9LBc/7Tt33dajCJ w==;
X-CSE-ConnectionGUID: J+8itVJkQli1/bFhh0whHA==
X-CSE-MsgGUID: lmWjXyagSdGydvX0j7oryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43468115"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43468115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:36 -0800
X-CSE-ConnectionGUID: bCUytpSxTQWgN2D71xY9Ng==
X-CSE-MsgGUID: aMIuZlxLTGK1+bJUoLYoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129179957"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:34 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/5] Add 6k resolution support for a single CRTC
Date: Tue, 26 Nov 2024 22:00:18 +0530
Message-Id: <20241126163021.458991-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126163021.458991-1-jeevan.b@intel.com>
References: <20241126163021.458991-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++--------
 lib/igt_kms.h |  5 +++--
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6fb5822ee..f1f198379 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6363,10 +6363,14 @@ int igt_get_max_dotclock(int fd)
  *
  * Returns: True if mode requires Bigjoiner, else False.
  */
-bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
-		mode->clock > max_dotclock);
+	int max_hdisplay, dev_id;
+
+	dev_id = intel_get_drm_devid(fd);
+	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+			HDISPLAY_5K_PER_PIPE;
+	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
 }
 
 /**
@@ -6387,10 +6391,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
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
@@ -6409,7 +6413,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  */
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
+	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
 		mode->clock > 2 * max_dotclock);
 }
 
@@ -6605,7 +6609,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd,
+		    pipes[i].mode, max_dotclock)) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i].idx),
 				 igt_output_name(pipes[i].output),
@@ -6632,7 +6637,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 			}
 		}
 
-		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
+		if ((i > 0) && (pipes[i - 1].force_joiner ||
+		    igt_bigjoiner_possible(display->drm_fd, pipes[i - 1].mode, max_dotclock))) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i - 1].idx),
 				 igt_output_name(pipes[i - 1].output),
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2fbbb5b0..a5ceaf116 100644
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
@@ -1241,7 +1242,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
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

