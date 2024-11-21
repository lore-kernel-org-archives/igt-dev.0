Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C794D743C9
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA1F10E8DC;
	Thu, 21 Nov 2024 10:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpTApr2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74410E8DC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732185056; x=1763721056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjnbJErp8zFSlQlLxPw49l6pXI2lBZWZutWZYOugf04=;
 b=WpTApr2kKyTWeGMJHUAa0vD1cMn0eJg0kwTaeJM/mlK6YAZs+o3HSf+r
 cp4njCTqHTDpocd5THKbc8KHLkCSECerlaGSwuF4HL0PYmUtfFdBZBiYy
 84qbOVYj9l8+96SZfaj8U8lPF/U3fvkxMGs8Ot+juxzc2ZKb5UKU/SY90
 6Y+P2wF2AxJSuXwHMynDkMCdufHJ4dSG0ova5SWMNu8ugoo+7RNH68Mvw
 PSo7sChKFHHcBhQVm8NyH8MkZYKQrVNlqIsVQLuOliMd978/rNv7dHRv6
 jKY4YHMwiAXUQMNekFTJUBHeamkzunU8VqAiXSKSoCM0jUYhEzlC50eg6 A==;
X-CSE-ConnectionGUID: unZXWp5sSJmJdhxxqJ20ag==
X-CSE-MsgGUID: /Igw4R8rSEmVOxpyhgC6qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43685037"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43685037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:30:56 -0800
X-CSE-ConnectionGUID: Gap7cG4nQ7WUIMXmFVGp8w==
X-CSE-MsgGUID: 7k9dwZmUQDewTQ1A4GK9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90155556"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:30:55 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a single
 CRTC
Date: Thu, 21 Nov 2024 16:15:53 +0530
Message-Id: <20241121104554.65366-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121104554.65366-1-jeevan.b@intel.com>
References: <20241121104554.65366-1-jeevan.b@intel.com>
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
index 76f32e1e0..fe5cea33d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6355,6 +6355,7 @@ int igt_get_max_dotclock(int fd)
 
 /**
  * igt_bigjoiner_possible:
+ * @fd: drm file descriptor
  * @mode: libdrm mode
  * @max_dotclock: Max pixel clock frequency
  *
@@ -6363,10 +6364,13 @@ int igt_get_max_dotclock(int fd)
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
 
@@ -6574,7 +6578,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
+		    max_dotclock)) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i].idx),
 				 igt_output_name(pipes[i].output),
@@ -6601,7 +6606,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 			}
 		}
 
-		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
+		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
+		    pipes[i - 1].mode, max_dotclock))) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i - 1].idx),
 				 igt_output_name(pipes[i - 1].output),
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 301f370df..547b45ae8 100644
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

