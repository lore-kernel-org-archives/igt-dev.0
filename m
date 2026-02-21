Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E054E9A049
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFF210E109;
	Sat, 21 Feb 2026 03:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcwTJCgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8FD10E865
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644058; x=1803180058;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y27a1vfb47qeCK56hvOWUBQWhio2A1rcmA3wXMWyviU=;
 b=XcwTJCgs8jsxA+vWYzhY+qZxtbPWHrvJej6Na9dEGRjaj+CPVTpm6q5q
 sAXpN+Rjls2P6134SOstpd161i3iYDREq7hNaACFKyDfgm76cjzYND1N/
 Myth2mdIDUE10k/YsnmEpkI3u1LPuARk8QbcYG7G8KuDMEK+bXKSJHg74
 6FejXtW+JrrpATrwQqC0GyzoS8VL89C3ahEw8Q5bYZPLGitTYJNXzXReS
 etJ+Jz7Vo2PcU/ZC4Y+UCeMe3lmYffceQduIIBzecnIa3pj1C/QmD9Njl
 9wq9AzMGxRjyJr0UxGuFreNqjBOGQy30j+ZClVDRiwkwysikgSM0uwqyq A==;
X-CSE-ConnectionGUID: uD2aznKwQ5eospwOEXx2rA==
X-CSE-MsgGUID: oEXkRSSqSUqhSklBFokQgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84187208"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84187208"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:57 -0800
X-CSE-ConnectionGUID: fsRnAY+VT9GqdVGQ8uSHeg==
X-CSE-MsgGUID: xDzuRKFkT1OFT84Z9gpYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214256402"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:57 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 13/23] tests/intel/kms_psr2_sf: Convert pipes[] to
 crtcs[]
Date: Sat, 21 Feb 2026 05:19:52 +0200
Message-ID: <20260221032003.30936-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert the pipes[] array to crtcs[] in kms_psr2_sf. The
remainder of the pipe->crtc conversions will be handled
with cocci.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr2_sf.c | 66 +++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index f79d9b0b751e..ff63a3c84f10 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1157,8 +1157,8 @@ int igt_main()
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int i, y, z;
-	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int n_pipes = 0;
+	igt_crtc_t *crtcs[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	int n_crtcs = 0;
 	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	const char *append_fbc_subtest[2] = {
 		"",
@@ -1212,14 +1212,14 @@ int igt_main()
 			if (!output_supports_pr_psr2_sel_fetch)
 				continue;
 
-			pipes[n_pipes] = data.pipe;
-			outputs[n_pipes] = data.output;
+			crtcs[n_crtcs] = crtc;
+			outputs[n_crtcs] = data.output;
 
-			coexist_features[n_pipes] = 0;
+			coexist_features[n_crtcs] = 0;
 			if (is_dsc_supported_by_sink(data.drm_fd, data.output))
-				coexist_features[n_pipes] |= FEATURE_DSC;
+				coexist_features[n_crtcs] |= FEATURE_DSC;
 
-			n_pipes++;
+			n_crtcs++;
 			pr_psr2_sel_fetch_supported = true;
 		}
 		igt_require_f(pr_psr2_sel_fetch_supported,
@@ -1244,8 +1244,8 @@ int igt_main()
 						   append_fbc_subtest[y],
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1265,8 +1265,8 @@ int igt_main()
 							   append_fbc_subtest[y],
 							   append_psr_subtest[z],
 							   op_str(data.op)) {
-					for (i = 0; i < n_pipes; i++) {
-						data.pipe = pipes[i];
+					for (i = 0; i < n_crtcs; i++) {
+						data.pipe = crtcs[i]->pipe;
 						data.output = outputs[i];
 
 						if (!pipe_output_combo_valid(&data))
@@ -1286,8 +1286,8 @@ int igt_main()
 						   append_fbc_subtest[y],
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1303,8 +1303,8 @@ int igt_main()
 			igt_describe("Test that selective fetch works on cursor plane");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1320,8 +1320,8 @@ int igt_main()
 				     "moving cursor plane (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1337,8 +1337,8 @@ int igt_main()
 				     "plane exceeding partially visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1354,8 +1354,8 @@ int igt_main()
 				     "exceeding fully visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1372,8 +1372,8 @@ int igt_main()
 			igt_describe("Test that selective fetch works on moving overlay plane");
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1388,8 +1388,8 @@ int igt_main()
 				     "plane (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1405,8 +1405,8 @@ int igt_main()
 				     "plane partially exceeding visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1422,8 +1422,8 @@ int igt_main()
 				     "fully exceeding visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1440,8 +1440,8 @@ int igt_main()
 				     "with blended overlay plane");
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1460,8 +1460,8 @@ int igt_main()
 			igt_describe("Test that selective fetch works on overlay plane");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
-- 
2.52.0

