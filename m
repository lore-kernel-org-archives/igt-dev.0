Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16F4E91287
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 07:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9898D10E7D1;
	Thu,  5 Feb 2026 07:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YS+a4nPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977B210E7D1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770275087; x=1801811087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9kBXj7yD3ZtlkgN13qvW7wt5JMwIv8BJAfztTLixnM=;
 b=YS+a4nPbjY+1yMQtSihqmFokF9JYJ5Sn9XCmEfQjZoapD4bnx6dq2C9f
 KXxPJA0PRrO/W0x7siK5vU33mu+Sb17mgoDvaSHdSD30oZyh4H4LqDuGF
 18y9zkNYPRYAP8p4MLA9Ca02JBCtMWlhGpzsETDmBTZoGpL7oMmrG37CE
 AQ1vm67YwIZt1nppEee9RA9XcHaYtsPUnhMJT4iAlHVL3OGyaSK5jB8bR
 Pp5yU+RYPSIWi09pNlJN0BE/WZrqIG7UeTHZa0iDieF97tIW1x9laaNdL
 Ts1vxhnwkl2VIvZ6EDHshuFsnp1KqPb8RdKtv9bt7/UYL10uRlfQc9u7B g==;
X-CSE-ConnectionGUID: qTTGd0I8QqONfQYwtK04kA==
X-CSE-MsgGUID: 7hqwYTZITU2qTcb4aVwUIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70486956"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70486956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:47 -0800
X-CSE-ConnectionGUID: dxPNBcTITOqZ7ibnuwjy0w==
X-CSE-MsgGUID: QQ1PqBWqQ+Gz4tFRwtYQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210495580"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.51])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 23:04:46 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
Date: Thu,  5 Feb 2026 09:04:24 +0200
Message-ID: <20260205070425.300934-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205070425.300934-1-jouni.hogander@intel.com>
References: <20260205070425.300934-1-jouni.hogander@intel.com>
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

There are some restrictions in pipe usage for PSR2/PR Selective
Fetch. Implement helper to checks these restrictions and use it to figure
out if pipe/PSR/PR combo in data_t is valid. Also check if used output
supports PSR/PR.

v3:
  - use data->devid instead of intel_get_drm_devi
  - changed IS_ALDERLAKE_S to !IS_ALDERLAKE_P
v2: rebase and commit message updated

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 133 ++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 56 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 53565ada1..e537af121 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1084,18 +1084,36 @@ static bool check_pr_psr2_sel_fetch_support(data_t *data)
 	return status;
 }
 
+static bool sel_fetch_pipe_combo_valid(data_t *data)
+{
+	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->pipe != PIPE_A)
+		return false;
+
+	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
+	    data->pipe != PIPE_A && data->pipe != PIPE_B)
+		return false;
+
+	return true;
+}
+
 static bool
-pipe_output_combo_valid(igt_display_t *display,
-			enum pipe pipe, igt_output_t *output)
+pipe_output_combo_valid(data_t *data)
 {
-	bool ret = true;
+	bool ret = psr_sink_support(data->drm_fd, data->debugfs_fd,
+				    data->psr_mode, data->output);
+	if (!ret)
+		return ret;
+
+	ret = sel_fetch_pipe_combo_valid(data);
+	if (!ret)
+		return ret;
 
-	igt_display_reset(display);
+	igt_display_reset(&data->display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
-	if (!intel_pipe_output_combo_valid(display))
+	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
-	igt_output_set_crtc(output, NULL);
+	igt_output_set_crtc(data->output, NULL);
 
 	return ret;
 }
@@ -1268,11 +1286,12 @@ int igt_main()
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i], outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 
@@ -1294,11 +1313,12 @@ int igt_main()
 							   append_psr_subtest[z],
 							   op_str(data.op)) {
 					for (i = 0; i < n_pipes; i++) {
-						if (!pipe_output_combo_valid(&data.display,
-									     pipes[i], outputs[i]))
-							continue;
 						data.pipe = pipes[i];
 						data.output = outputs[i];
+
+						if (!pipe_output_combo_valid(&data))
+							continue;
+
 						igt_assert_f(set_sel_fetch_mode_for_output(&data),
 							     "Selective fetch is not supported\n");
 						if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1319,12 +1339,12 @@ int igt_main()
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1341,12 +1361,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1363,12 +1383,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1385,12 +1405,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1407,12 +1427,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1430,12 +1450,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1451,12 +1471,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1473,12 +1493,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1495,11 +1515,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display, pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1517,12 +1538,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
@@ -1542,12 +1563,12 @@ int igt_main()
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
 				for (i = 0; i < n_pipes; i++) {
-					if (!pipe_output_combo_valid(&data.display,
-								     pipes[i],
-								     outputs[i]))
-						continue;
 					data.pipe = pipes[i];
 					data.output = outputs[i];
+
+					if (!pipe_output_combo_valid(&data))
+						continue;
+
 					igt_assert_f(set_sel_fetch_mode_for_output(&data),
 						     "Selective fetch is not supported\n");
 					if (!check_psr_mode_supported(&data, psr_status[z]))
-- 
2.43.0

