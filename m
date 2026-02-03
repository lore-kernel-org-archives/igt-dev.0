Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D68AE83058
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 06:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A33710E54D;
	Tue,  3 Feb 2026 06:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7kcJqAk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDD610E54D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770099061; x=1801635061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VE0czl6m4qL7BV5pTX0pI8O+StAjtmBYfXIEK1p+uzg=;
 b=h7kcJqAkcKbq+g1lS/WMit5hJx0D39RNCzB3bjaNYJWr7Sv+R7TrHDz6
 HAUWteGQmJB6Hovgg5648PKzYq+7Yr6eR6fkq1b2Qy8NGTTXVTQt0nJve
 CEigzK9vFqOaxFczaN78vBWk+gRJKwf5jcolTi1xwhzleBuaCjBs60lqP
 jgfNdNU3bAI6V5PE8YElpkdC81iyIK+UtUTeJWb8FgCudYDYf6/NE9z0G
 8zh0AlFXFpkjwvj89xMwCzTm7NrWM85MPm1CAUBLe3rkgpW8M1TjubePr
 6m7HVHwCbYiwWwg1D4a2u1nDqd8MVqDIgj0Tpyuc5w9e3n527I9TWRnFq g==;
X-CSE-ConnectionGUID: xpmbUotLQWa1BdzK/UqBgA==
X-CSE-MsgGUID: w9/4cf0YRbWfgPVnw7rGVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82000708"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82000708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:11:00 -0800
X-CSE-ConnectionGUID: l/X7j634RNaKPqQ37wF1Jg==
X-CSE-MsgGUID: b4dhXIvzQQabRQTNsdCqsQ==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.186])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:10:59 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel/kms_psr2_sf: Check pipe and output
 validity for Selective Fetch test
Date: Tue,  3 Feb 2026 08:10:35 +0200
Message-ID: <20260203061036.21482-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203061036.21482-1-jouni.hogander@intel.com>
References: <20260203061036.21482-1-jouni.hogander@intel.com>
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

v2: rebase and commit message updated

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 134 ++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 56 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 0eae34cbd..776068104 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1084,18 +1084,37 @@ static bool check_pr_psr2_sel_fetch_support(data_t *data)
 	return status;
 }
 
+static bool sel_fetch_pipe_combo_valid(data_t *data)
+{
+	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 14 &&
+	    !IS_ALDERLAKE_S(intel_get_drm_devid(data->drm_fd)) && data->pipe != PIPE_A)
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
@@ -1265,11 +1284,12 @@ int igt_main()
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
 
@@ -1291,11 +1311,12 @@ int igt_main()
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
@@ -1316,12 +1337,12 @@ int igt_main()
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
@@ -1338,12 +1359,12 @@ int igt_main()
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
@@ -1360,12 +1381,12 @@ int igt_main()
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
@@ -1382,12 +1403,12 @@ int igt_main()
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
@@ -1404,12 +1425,12 @@ int igt_main()
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
@@ -1427,12 +1448,12 @@ int igt_main()
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
@@ -1448,12 +1469,12 @@ int igt_main()
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
@@ -1470,12 +1491,12 @@ int igt_main()
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
@@ -1492,11 +1513,12 @@ int igt_main()
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
@@ -1514,12 +1536,12 @@ int igt_main()
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
@@ -1539,12 +1561,12 @@ int igt_main()
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

