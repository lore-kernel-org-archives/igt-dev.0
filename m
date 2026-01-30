Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA5CD49C9F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108610E9B4;
	Fri, 30 Jan 2026 10:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJcr+Srq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496910E9B4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770382; x=1801306382;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8BL6NEusZssQUj34ro6DnUJ75ecolF62ay+LLxVkpJ4=;
 b=GJcr+SrqAWeJPwJgZGFHcO29PGCVXmxOLfVFPxeixVozPL3/+ZMtefJw
 rw7n3BNZtkyQ6mhJ/86W2PjiH8940RbXUYp8u29Cwd2bY7Tt3DSErGgub
 GMjMDXlAeVTGn515u7oUUI6jUM07hiCIdjIXgpRU8TRP/o1yPuZqPga4r
 Pbv8qzYOTsnyKCQa4y/WbKoNrPr+4KGyFkbRyOAZQt7m+9t6mrpPKANtl
 LcufKQhbhzYlpXpFYuVD74cv5BT0zFuuT0OIerzhOJwSjprz1EFlmFzFF
 vTSnb31zCGcjYXQXUYZISF8djnAnZACLy1pNl0ENNc/82oK999X1P2Mb+ w==;
X-CSE-ConnectionGUID: YEFlo0i9THiE96tT4FaogQ==
X-CSE-MsgGUID: daAp8ivQSbGY/T0n/eQ0DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593154"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:59 -0800
X-CSE-ConnectionGUID: SYGEb5UmRoyJVV2hDZo6Hg==
X-CSE-MsgGUID: gtiUKX8eRhagpDfK7gDpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354762"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/15] tests/kms_color: Convert to for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:26 +0200
Message-ID: <20260130105237.14481-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

Convert tests/kms_color to use the new crtc based iterators
(over the old pipe based ones).

This is another test cased that proved too much for coccinelle
for whatever reason, so the conversion was done manually.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b2ca6975d6a5..a50793651c11 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -955,7 +955,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct {
 		const char *name;
 		void (*test_t) (data_t *data, enum pipe pipe);
@@ -975,10 +975,10 @@ run_invalid_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
-			for_each_pipe(&data->display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					prep_pipe(data, pipe);
-					tests[i].test_t(data, pipe);
+			for_each_crtc(&data->display, crtc) {
+				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+					prep_pipe(data, crtc->pipe);
+					tests[i].test_t(data, crtc->pipe);
 				}
 			}
 		}
@@ -988,7 +988,7 @@ run_invalid_tests_for_pipe(data_t *data)
 static void
 run_tests_for_pipe(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	static const struct {
 		const char *name;
 		bool (*test_t)(data_t*, igt_plane_t*);
@@ -1118,10 +1118,10 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
-			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_gamma_degamma_tests_for_pipe(data, pipe,
+					run_gamma_degamma_tests_for_pipe(data, crtc->pipe,
 									 gamma_degamma_tests[i].test_t);
 			}
 		}
@@ -1130,10 +1130,10 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
-			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_ctm_tests_for_pipe(data, pipe,
+					run_ctm_tests_for_pipe(data, crtc->pipe,
 							       ctm_tests[i].fb_colors,
 							       ctm_tests[i].ctm,
 							       ctm_tests[i].iter);
@@ -1148,8 +1148,8 @@ run_tests_for_pipe(data_t *data)
 
 	igt_describe("Verify that deep color works correctly");
 	igt_subtest_with_dynamic("deep-color") {
-		for_each_pipe(&data->display, pipe) {
-			run_deep_color_tests_for_pipe(data, pipe);
+		for_each_crtc(&data->display, crtc) {
+			run_deep_color_tests_for_pipe(data, crtc->pipe);
 
 			if (igt_run_in_simulation())
 				break;
-- 
2.52.0

