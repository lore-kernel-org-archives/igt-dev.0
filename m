Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBF2E73163
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 13:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D42810E2B2;
	Mon,  2 Feb 2026 13:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="coCQ7abz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7A210E2B2
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770038208; x=1801574208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/bb5EjX6KQTz/7+G8R063p0r0yf2n32XrFev30kdrY=;
 b=coCQ7abzHEVWRAluR3KZF/3D0fTD0PpHyd+rfUJLlNF7w6tK5nRnivi8
 4nkWSN16BKxhKxjN70wjklcHkQ1/u1OdxKyCIvHrT8izpPg8WvMHHiKDk
 cQKFbD81ZxDle05lwF0aIbasYrIOq75fu8CVKHqiNB+T5VIW7HGn+WtsP
 mJDHerOsTB9gYlDx3RzG2fsMGKXyR0HbTJvNEGYpc1JsHJWmBg760IOpx
 Ba5qBuYKnZvkYPrYkZuUdwfta63RAPwhms8mwU6hu6OjtTkfQJGTG/x8U
 /RcgbfInkuHV3gzmBElNSEHnBT1/tm3ivCnTBNazf4c5dqMF84oCwB28f A==;
X-CSE-ConnectionGUID: Nz7mSCJCQe+5UpcPoyUFxw==
X-CSE-MsgGUID: lCBCHMVjSJmKBuJn9MLedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75044384"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75044384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:48 -0800
X-CSE-ConnectionGUID: LTFz+XQMR8ikQ0XXMIzrVg==
X-CSE-MsgGUID: E/IIItbgRr23NUJrPCfdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214050803"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:47 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/3] kms_psr2_sf: Check pipe and output validity for
 Selective Fetch test
Date: Mon,  2 Feb 2026 15:16:21 +0200
Message-ID: <20260202131622.1369539-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202131622.1369539-1-jouni.hogander@intel.com>
References: <20260202131622.1369539-1-jouni.hogander@intel.com>
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

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 134 ++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 56 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 47a878d56..c004d58b9 100644
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
 
-	igt_output_set_pipe(output, pipe);
-	if (!intel_pipe_output_combo_valid(display))
+	igt_output_set_pipe(data->output, data->pipe);
+	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
-	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_set_pipe(data->output, PIPE_NONE);
 
 	return ret;
 }
@@ -1264,11 +1283,12 @@ igt_main
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
 
@@ -1290,11 +1310,12 @@ igt_main
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
@@ -1315,12 +1336,12 @@ igt_main
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
@@ -1337,12 +1358,12 @@ igt_main
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
@@ -1359,12 +1380,12 @@ igt_main
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
@@ -1381,12 +1402,12 @@ igt_main
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
@@ -1403,12 +1424,12 @@ igt_main
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
@@ -1426,12 +1447,12 @@ igt_main
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
@@ -1447,12 +1468,12 @@ igt_main
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
@@ -1469,12 +1490,12 @@ igt_main
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
@@ -1491,11 +1512,12 @@ igt_main
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
@@ -1513,12 +1535,12 @@ igt_main
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
@@ -1538,12 +1560,12 @@ igt_main
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

