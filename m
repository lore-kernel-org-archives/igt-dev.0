Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8535C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9221710E7E8;
	Fri, 20 Feb 2026 14:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUl0SjZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852610E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596166; x=1803132166;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IeEBpwBpx7sRAQ7FIHRqDS6vd+yUZWdxg5nIch4vLQo=;
 b=lUl0SjZ8kaVao0VJV4FVud20pdTRwFxpwFAx2TlS1QII7deS9Xf++AB6
 MVBTUJcnjWki66Tu7GrlBYdDdM4sUYS5DVif/hGpIYQewoooxRLIey8di
 9GQilXC9bxZo8wiNKVU7CEYlo5QCOsTR9FAe7k2a8vzxhwG26FGAx7fVH
 0yrqSQJz9NBIBdY8etq8qvHOS+N0O4RpYiGolv5Agh89jBgnuiirvmAEE
 ibGueXZeygzTxgxXfloGT9S4Hig1+5UG3yVv5RJvJ+P2zGvGkQFwkgnu6
 tQu3NUlf52KSTEEGUtaCPmwaZlxYpShOw/dBLR30vPZhbAiZhkrqBttan w==;
X-CSE-ConnectionGUID: pqULALzmTy22jhwKP1EXhA==
X-CSE-MsgGUID: NzoFhQ6KR7uVhvzLTqSnyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72388987"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72388987"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:46 -0800
X-CSE-ConnectionGUID: OdUf8wEORkeCIpZzGMgTig==
X-CSE-MsgGUID: JHd4bbBiRpmizGL37jutag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252543940"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:44 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/21] tests/intel/kms_psr2_sf: Convert pipes[] to
 crtcs[]
Date: Fri, 20 Feb 2026 16:01:43 +0200
Message-ID: <20260220140154.4138-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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
index 31db6760c73e..cb2f2fe70f80 100644
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
@@ -1209,14 +1209,14 @@ int igt_main()
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
@@ -1241,8 +1241,8 @@ int igt_main()
 						   append_fbc_subtest[y],
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1262,8 +1262,8 @@ int igt_main()
 							   append_fbc_subtest[y],
 							   append_psr_subtest[z],
 							   op_str(data.op)) {
-					for (i = 0; i < n_pipes; i++) {
-						data.pipe = pipes[i];
+					for (i = 0; i < n_crtcs; i++) {
+						data.pipe = crtcs[i]->pipe;
 						data.output = outputs[i];
 
 						if (!pipe_output_combo_valid(&data))
@@ -1283,8 +1283,8 @@ int igt_main()
 						   append_fbc_subtest[y],
 						   append_psr_subtest[z],
 						   op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1300,8 +1300,8 @@ int igt_main()
 			igt_describe("Test that selective fetch works on cursor plane");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1317,8 +1317,8 @@ int igt_main()
 				     "moving cursor plane (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1334,8 +1334,8 @@ int igt_main()
 				     "plane exceeding partially visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1351,8 +1351,8 @@ int igt_main()
 				     "exceeding fully visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1369,8 +1369,8 @@ int igt_main()
 			igt_describe("Test that selective fetch works on moving overlay plane");
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1385,8 +1385,8 @@ int igt_main()
 				     "plane (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1402,8 +1402,8 @@ int igt_main()
 				     "plane partially exceeding visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1419,8 +1419,8 @@ int igt_main()
 				     "fully exceeding visible area (no update)");
 			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1437,8 +1437,8 @@ int igt_main()
 				     "with blended overlay plane");
 			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
 						   append_psr_subtest[z], op_str(data.op)) {
-				for (i = 0; i < n_pipes; i++) {
-					data.pipe = pipes[i];
+				for (i = 0; i < n_crtcs; i++) {
+					data.pipe = crtcs[i]->pipe;
 					data.output = outputs[i];
 
 					if (!pipe_output_combo_valid(&data))
@@ -1457,8 +1457,8 @@ int igt_main()
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

