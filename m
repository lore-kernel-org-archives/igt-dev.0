Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D7D70E1A
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373F10ED8E;
	Fri, 29 Nov 2024 04:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lf7QBGHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182AC10ED92
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732853591; x=1764389591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vAB0WXUJzd2K4Ew5hfW8QvrF4W7d0ZAkqgevC6UJ3E=;
 b=Lf7QBGHY5yE1s38DnKbKdydTleaCAuu0xnX13/spWqDKaLve3oIAtaZL
 hacjdDsfgdn57ydYZY7zN8ePEdMS2SWCNDYisNXJ2Pq+SyAuRYf0nDuD1
 fcLE1OhprfqgWwW55V+nJVKBuPsz0os11heOEZQqm8m9iGpFb1jKUrrYw
 nzvi5RRX7LKIVgo0SdMfVQDkEkKg8l+JiC4iJXk2pbCnnhPagPeBtbZPZ
 jaLwpR3po8lZ3nlubHPHWqOcsSjCP2jlpEcptZxgEdGofZNlTs/dDeX//
 jT5VbP7VKNq78TgNOkxQoYdSDhGa/POjiVfmOh7zcjWXZ4hl0JOiCLJHX g==;
X-CSE-ConnectionGUID: zomAFKDxTJ6B7kMN8w1RHA==
X-CSE-MsgGUID: dEMF63KlRA+ZcFb9Y0f6vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43704028"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="43704028"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:13:10 -0800
X-CSE-ConnectionGUID: mm7TM2p4R8u5K0cQ45dPhA==
X-CSE-MsgGUID: atwWiFcFTHeLM6jwiAVXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92849071"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:13:09 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 4/4] lib/igt_kms: Add 6k resolution support for a single
 CRTC
Date: Fri, 29 Nov 2024 09:57:46 +0530
Message-Id: <20241129042746.701796-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129042746.701796-1-jeevan.b@intel.com>
References: <20241129042746.701796-1-jeevan.b@intel.com>
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

v2: Update fd to drm_fd and few minor styling fixes.

Bspec: 68858
Apart from lib following tests are modified:
tests/intel/kms_pm_lpsp.c
tests/kms_flip.c
tests/kms_setmode.c

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c             | 24 ++++++++++++++++--------
 lib/igt_kms.h             |  5 +++--
 tests/intel/kms_pm_lpsp.c |  4 ++--
 tests/kms_flip.c          |  4 ++--
 tests/kms_setmode.c       |  4 ++--
 5 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6fb5822ee..11245dd12 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6355,6 +6355,7 @@ int igt_get_max_dotclock(int fd)
 
 /**
  * igt_bigjoiner_possible:
+ * @drm_fd: drm file descriptor
  * @mode: libdrm mode
  * @max_dotclock: Max pixel clock frequency
  *
@@ -6363,10 +6364,15 @@ int igt_get_max_dotclock(int fd)
  *
  * Returns: True if mode requires Bigjoiner, else False.
  */
-bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
-		mode->clock > max_dotclock);
+	int max_hdisplay, dev_id;
+
+	dev_id = intel_get_drm_devid(drm_fd);
+	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+			HDISPLAY_5K_PER_PIPE;
+
+	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
 }
 
 /**
@@ -6387,10 +6393,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
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
@@ -6409,7 +6415,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  */
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
+	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
 		mode->clock > 2 * max_dotclock);
 }
 
@@ -6605,7 +6611,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+		if (pipes[i].force_joiner ||
+		    igt_bigjoiner_possible(display->drm_fd, pipes[i].mode, max_dotclock)) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i].idx),
 				 igt_output_name(pipes[i].output),
@@ -6632,7 +6639,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 			}
 		}
 
-		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
+		if ((i > 0) && (pipes[i - 1].force_joiner ||
+				igt_bigjoiner_possible(display->drm_fd, pipes[i - 1].mode, max_dotclock))) {
 			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
 				 kmstest_pipe_name(pipes[i - 1].idx),
 				 igt_output_name(pipes[i - 1].output),
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2fbbb5b0..8810123fb 100644
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
+bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 889da42de..74e9d799a 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
 	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
 		return false;
 
-	if (igt_bigjoiner_possible(mode, max_dotclock)) {
+	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
 		for_each_connector_mode(data->output) {
 			mode = &data->output->config.connector->modes[j__];
 
-			if (igt_bigjoiner_possible(mode, max_dotclock))
+			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
 				continue;
 
 			igt_output_override_mode(data->output, mode);
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 88cd41083..3ad4d0afb 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				 o->kconnector[i - 1]->connector_type_id);
 
 		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
+		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
 		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
 		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
 		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
+				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
 		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
 
 			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bc7b8fabb..d61cfeb9a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
 			 *   - current & previous crtcs are consecutive
 			 */
 			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
+			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
 			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
 			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
 			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
+					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
-- 
2.25.1

