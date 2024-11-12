Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D6CD42BA5
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 16:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456110E32A;
	Tue, 12 Nov 2024 16:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alwjKgb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5344510E32A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731428414; x=1762964414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2j39Fkxo1lPBAYVjGbo5Atwe8l01S7jNWEjVXWVjzgw=;
 b=alwjKgb/RLiaUVgqhWk9SlFYQkR3f6tjevxv80TgYvv7mBpz2/Pd0BQo
 LoU8/VkFXIB7j4a4HQn3bW9aiVTX4ob3HRhHp4/NzcnbC8jrViC76L3jo
 pgTQrSPcAvRR1k6VDfJleYnr4WxSIwwasO/LGttZPJ2EFENV3+E141BVE
 AtCd/mIWdTi78+XTACiX+J7hiyh/Avn4fXsbjEUKy6MsqUSlf8+Gdes2q
 ea4FP8uZU7Upbl0XICBW/p8p/gBd/jZNSsxtrT8ERUHWaUYYjpq3vqhuv
 9tWpzTp5DZNNgDS5l9llKLO6ss2ZX73ddAfay7F21qDCqnNds1JMeen03 g==;
X-CSE-ConnectionGUID: NellARRKQ02WtKmeDoH0NA==
X-CSE-MsgGUID: qCuIwaFTTAG+JpCZ51xUNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30677761"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="30677761"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:14 -0800
X-CSE-ConnectionGUID: OX0LK2JoRXapQfeXAM4P8g==
X-CSE-MsgGUID: vQ4zGO1iQ/SPIKoJ8QXrYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="125036687"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 08:20:12 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] Fix bigjoiner compatibility checks for connector
 modes
Date: Tue, 12 Nov 2024 22:04:35 +0530
Message-Id: <20241112163435.1351560-3-jeevan.b@intel.com>
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

fix bigjoiner compatibility checks by adding drm_fd argument.
added unsupported config checks for bigjoiner modes in display tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 4 ++--
 tests/kms_display_modes.c | 6 ++++++
 tests/kms_flip.c          | 4 ++--
 tests/kms_setmode.c       | 4 ++--
 4 files changed, 12 insertions(+), 6 deletions(-)

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
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f1d8ab03d..0950cc483 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -318,6 +318,12 @@ igt_main
 		igt_display_require_output(&data.display);
 
 		for_each_connected_output(&data.display, output) {
+			drmModeConnector *connector = output->config.connector;
+			drmModeModeInfo mode;
+			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
+
+			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
+				      "Big Joiner Connector Found Unsupported Config\n");
 			data.mst_output[count++] = output;
 			if (output_is_dp_mst(&data, output, dp_mst_outputs))
 				dp_mst_outputs++;
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index cbabbe74f..17da10e2e 100755
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

