Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D609DD49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862C910E9BF;
	Fri, 30 Jan 2026 10:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZ6so6Zd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DBB10E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770388; x=1801306388;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=17dq0Qd2QB6Z3jldcIr15PELGj+HXZ8ZLi74UmjtpOI=;
 b=kZ6so6ZdWEhp7LFD494MxtOhtyuyPxVgaJ5iWTTaYVPG7RVqROL6bmD3
 jQ1CoallhH4thEm1aIfuL+9u7sLToTNKdMkRuLgJm//o9l3ClXt8yvtWb
 7Rtsxb2zvNHbhVnrdH8kF92QOx57FSy0PLc/CycVyBRDjuBDU797g3AeW
 goxDUzN6kfo/t7IdwiCkcT0en9KuZ4p0xo4UJCYa8Ms8w9xlDzUvL5Y2i
 YQJ25Xsu94IC5lOGuQlhbpRs+YbEfrgME1X5Tzbo9sFIDMfuzoboyD115
 BfrypUk7P93vOu7EIf4HNSNsA7RzzkZBmZnG9KGNi3hh6bf7Iq018IRdy g==;
X-CSE-ConnectionGUID: 7QYJSGcbQ0aZuizd4PSDpw==
X-CSE-MsgGUID: WNZrBWA4TS+kf79KCOUvFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593167"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:08 -0800
X-CSE-ConnectionGUID: WNxyv6zBRQqSpn7mXjc1yg==
X-CSE-MsgGUID: qExncZcyTTKgcGy65KaP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354783"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:07 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/15] tests/kms_rotation_crc: Use for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:28 +0200
Message-ID: <20260130105237.14481-7-ville.syrjala@linux.intel.com>
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

Convert tests/kms_rotation_crc to use the new crtc based
iteratros (over the old pipe based stuff).

The conversion was done manually due to coccinelle not
wanting to cooperate with me for whatever random reason.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_rotation_crc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index abd87508045e..4ba6a19b5862 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -587,7 +587,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int pipe_count = 0, connected_outputs = 0;
 	bool found = false;
 
@@ -603,14 +603,13 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 	for_each_connected_output(&data->display, output)
 		connected_outputs++;
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_plane_t *plane;
 		int i, j, c;
 
 		igt_display_reset(display);
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -648,13 +647,12 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			break;
 		pipe_count++;
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+		igt_output_set_crtc(output, crtc);
 
 		plane = igt_output_get_plane_type(output, plane_type);
 		igt_require(plane_rotation_requirements(data, plane));
 
-		prepare_crtc(data, output, pipe, plane, true);
+		prepare_crtc(data, output, crtc->pipe, plane, true);
 
 		for (i = 0; i < num_rectangle_types; i++) {
 			/* Unsupported on intel */
@@ -686,13 +684,13 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 					if (!test_format(data, &tested_formats, format))
 						continue;
 
-					test_single_case(data, pipe, output, plane, i,
+					test_single_case(data, crtc->pipe, output, plane, i,
 							 format, test_bad_format);
 				}
 
 				igt_vec_fini(&tested_formats);
 			} else {
-				test_single_case(data, pipe, output, plane, i,
+				test_single_case(data, crtc->pipe, output, plane, i,
 						 data->override_fmt, test_bad_format);
 			}
 		}
@@ -1349,17 +1347,16 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 */
 	igt_describe("This test intends to check for fence leaks exhaustively");
 	igt_subtest_f("exhaust-fences") {
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 		igt_output_t *output;
 
 		igt_require_intel(data.gfx_fd);
 		igt_display_require_output(&data.display);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			igt_plane_t *primary = &igt_crtc_for_pipe(&data.display,
-								  pipe)->planes[0];
+		for_each_crtc_with_valid_output(&data.display, crtc, output) {
+			igt_plane_t *primary = &crtc->planes[0];
 
-			test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
+			test_plane_rotation_exhaust_fences(&data, crtc->pipe, output, primary);
 			break;
 		}
 	}
-- 
2.52.0

