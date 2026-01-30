Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B555D49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEB910E9BC;
	Fri, 30 Jan 2026 10:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIyd7suZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E533010E9B4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770401; x=1801306401;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lwSKWrtNphoMvrSrtcv+s41gA7PqJBZ1H+6jBKnksg8=;
 b=IIyd7suZOEeZZ+9F2y41o+5F78tZ9MPu2B4TFxHgEM8v+tWl0pioKtqQ
 +/Hi8jRkcDekHbTzVcpJz2jNoBT2vgG753q9ki6kpZwFUUp5zZbYcPE1h
 66rkOtlkZyHWnoP057BYj93vCpk9sgp7PKlAfRlwIa7BZH8LlrCJAQ5ga
 zR3hneHUxBNSzrH2n5PE0sU0LsrtTxKADFZ19wwltiKz3U4oyzxCCXnyJ
 BSuleXZ/bJsT0J3N7+AgyEo/iUPQluTtT87kG3F2shPvFDzo6Y7ci9V+a
 OxTK+ZfAwrEvbbmBoNho4e5t65vdR6d4AGwIubOR0owcSlfhZICgopbEJ w==;
X-CSE-ConnectionGUID: Nacoy/JwQoC9pHIy8XSg+g==
X-CSE-MsgGUID: 9a38wLNZSfiterYAmLD99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653025"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:21 -0800
X-CSE-ConnectionGUID: tHXvUWd8TYiPECH8axJ3Iw==
X-CSE-MsgGUID: Yp1N5GjDQa62EmSWBb5OdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826822"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:20 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/15] lib/kms: Use for_each_crtc_with_single_output(),
 part 2
Date: Fri, 30 Jan 2026 12:52:31 +0200
Message-ID: <20260130105237.14481-10-ville.syrjala@linux.intel.com>
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

Convert more of the for_each_pipe_with_single_output() uses
over to for_each_crtc_with_single_output(). This covers the
simple use cases.

Done with cocci:
 #include "scripts/iterators.cocci"

@find@
typedef igt_crtc_t;
iterator name for_each_pipe_with_single_output;
iterator name for_each_crtc_with_single_output;
expression DISPLAY, OUTPUT;
identifier PIPE;
type T;
@@
(
- T PIPE;
+ igt_crtc_t *crtc;
|
- T PIPE = PIPE_NONE;
+ igt_crtc_t *crtc;
)
<+...
for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT) { ... }
...+>

@change depends on find@
expression DISPLAY, OUTPUT;
identifier find.PIPE;
@@
- for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT)
+ for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_cursor_overlay.c | 16 ++++++----
 tests/kms_color_pipeline.c        | 12 ++++----
 tests/kms_plane.c                 |  8 ++---
 tests/kms_plane_alpha_blend.c     | 24 +++++++++------
 tests/kms_plane_cursor.c          | 14 +++++----
 tests/kms_properties.c            | 22 +++++++-------
 tests/kms_rmfb.c                  | 10 +++----
 tests/kms_universal_plane.c       | 49 ++++++++++++++++++-------------
 8 files changed, 89 insertions(+), 66 deletions(-)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 76c3003ca432..1d8ffcc86e1d 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -400,7 +400,7 @@ int igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_display_t *display;
 	int i, j, available_overlay_planes;
@@ -478,13 +478,15 @@ int igt_main()
 							DRM_FORMAT_NV12,
 							DRM_FORMAT_MOD_LINEAR));
 
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
+			for_each_crtc_with_single_output(&data.display, crtc,
+							 output) {
 
 				igt_display_reset(display);
 				igt_output_set_crtc(output,
-					igt_crtc_for_pipe(output->display, pipe));
+					crtc);
 
-				available_overlay_planes = get_overlay_planes_count(display, pipe);
+				available_overlay_planes = get_overlay_planes_count(display,
+										    crtc->pipe);
 
 				/* Require at least one overlay plane. */
 				if (!available_overlay_planes)
@@ -500,13 +502,15 @@ int igt_main()
 					igt_skip("%s subtest requires 3 overlay planes with a supported DCN.\n",
 						 tests[i].name);
 
-				test_init(&data, pipe, output, tests[i].flags, available_overlay_planes);
+				test_init(&data, crtc->pipe, output,
+					  tests[i].flags,
+					  available_overlay_planes);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
 
 					igt_dynamic_f("pipe-%s-%s-size-%d",
-						      kmstest_pipe_name(pipe),
+						      igt_crtc_name(crtc),
 						      igt_output_name(output),
 						      size)
 						test_cursor(&data, size, tests[i].flags, tests[i].scale_factor);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index bf8c4734b5fd..1e272671f63d 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -155,7 +155,7 @@ static bool test_plane_colorops(data_t *data,
 static void
 run_tests_for_plane(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output = NULL;
 	static const color_t colors_rgb[] = {
 	        { 1.0, 0.0, 0.0 },
@@ -276,20 +276,22 @@ run_tests_for_plane(data_t *data)
 	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
 		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
 		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
-			for_each_pipe_with_single_output(&data->display, pipe, output) {
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 output) {
 				data->output = output;
 
-				if (!pipe_output_combo_valid(data, pipe))
+				if (!pipe_output_combo_valid(data, crtc->pipe))
 					continue;
 
-				test_setup(data, pipe);
+				test_setup(data, crtc->pipe);
 
 				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
 					test_cleanup(data);
 					continue;
 				}
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_dynamic_f("pipe-%s-%s",
+					       igt_crtc_name(crtc),
 					       igt_output_name(data->output)) {
 					data->color_depth = 8;
 					data->drm_format = DRM_FORMAT_XRGB8888;
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 21d80847cfd1..2be10f03280a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1467,19 +1467,19 @@ static bool is_pipe_limit_reached(int count)
 
 static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int count = 0;
 
-	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
 		igt_output_set_crtc(data->output, NULL);
-		test(data, pipe);
+		test(data, crtc->pipe);
 
 		if (is_pipe_limit_reached(++count))
 			break;
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index c3d53c66c02a..eaa4f8e2ef1b 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -691,31 +691,37 @@ static bool pipe_check(data_t *data, enum pipe pipe,
 static void run_subtests(data_t *data)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
 		igt_describe_f("%s\n", subtests[i].desc);
 
 		igt_subtest_with_dynamic(subtests[i].name) {
-			for_each_pipe_with_single_output(&data->display, pipe, output) {
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 output) {
 				if (!extended &&
-				    pipe != active_pipes[0] &&
-				    pipe != active_pipes[last_pipe])
+				    crtc->pipe != active_pipes[0] &&
+				    crtc->pipe != active_pipes[last_pipe])
 					continue;
 
 				igt_display_reset(&data->display);
 
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(output->display, pipe));
+						    crtc);
 				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
-				prepare_crtc(data, output, pipe);
-				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
+				prepare_crtc(data, output, crtc->pipe);
+				if (!pipe_check(data, crtc->pipe, subtests[i].blend, subtests[i].must_multiply))
 					continue;
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-					run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
+				igt_dynamic_f("pipe-%s-%s",
+					      igt_crtc_name(crtc),
+					      output->name)
+					run_test_on_pipe_planes(data,
+								crtc->pipe,
+								output,
+								subtests[i].blend,
 								subtests[i].must_multiply, subtests[i].test);
 			}
 		}
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 60e757fc701b..8095154718bc 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -290,7 +290,7 @@ int igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_display_t *display;
 	int i, j;
@@ -329,26 +329,28 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
-			for_each_pipe_with_single_output(&data.display, pipe, output) {
+			for_each_crtc_with_single_output(&data.display, crtc,
+							 output) {
 				if ((tests[i].flags & TEST_OVERLAY) &&
-				    !igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				    !igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
 				igt_display_reset(display);
 
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(output->display, pipe));
+						    crtc);
 				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
-				test_init(&data, pipe, output, tests[i].flags);
+				test_init(&data, crtc->pipe, output,
+					  tests[i].flags);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
 
 					igt_dynamic_f("pipe-%s-%s-size-%d",
-						      kmstest_pipe_name(pipe),
+						      igt_crtc_name(crtc),
 						      igt_output_name(output),
 						      size)
 						test_cursor(&data, size, tests[i].flags);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 62e936bc5e51..1d46bca52114 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -348,39 +348,41 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe_with_single_output(display, pipe, output) {
+	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output)) {
-			run_plane_property_tests(display, pipe, output, atomic);
+			run_plane_property_tests(display, crtc->pipe, output,
+						 atomic);
 		}
 	}
 }
 
 static void crtc_properties(igt_display_t *display, bool atomic)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
-	for_each_pipe_with_single_output(display, pipe, output) {
+	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output)) {
-			run_crtc_property_tests(display, pipe, output, atomic);
+			run_crtc_property_tests(display, crtc->pipe, output,
+						atomic);
 		}
 	}
 }
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index d4e0b519bbc4..e71d1b9a6fc4 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -175,20 +175,20 @@ static void
 run_rmfb_test(struct rmfb_data *data, bool reopen)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
 
-	for_each_pipe_with_single_output(display, pipe, output) {
+	for_each_crtc_with_single_output(display, crtc, output) {
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output))
-			test_rmfb(data, output, pipe, reopen);
+			test_rmfb(data, output, crtc->pipe, reopen);
 	}
 }
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 16409a4a55e0..33567597fa88 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -833,62 +833,69 @@ static void
 run_tests(data_t *data)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_with_dynamic("universal-plane-functional") {
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
-			if (!pipe_output_combo_valid(&data->display, pipe, output))
+		for_each_crtc_with_single_output(&data->display, crtc, output) {
+			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				functional_test_pipe(data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				functional_test_pipe(data, crtc->pipe, output);
 		}
 	}
 
 	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
 	igt_subtest_with_dynamic("universal-plane-sanity") {
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
-			if (!pipe_output_combo_valid(&data->display, pipe, output))
+		for_each_crtc_with_single_output(&data->display, crtc, output) {
+			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				sanity_test_pipe(data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				sanity_test_pipe(data, crtc->pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
 		     " and pageflip execution");
 	igt_subtest_with_dynamic("disable-primary-vs-flip") {
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
-			if (!pipe_output_combo_valid(&data->display, pipe, output))
+		for_each_crtc_with_single_output(&data->display, crtc, output) {
+			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				pageflip_test_pipe(data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				pageflip_test_pipe(data, crtc->pipe, output);
 		}
 	}
 
 	igt_describe("Check for cursor leaks after performing cursor operations");
 	igt_subtest_with_dynamic("cursor-fb-leak") {
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
-			if (!pipe_output_combo_valid(&data->display, pipe, output))
+		for_each_crtc_with_single_output(&data->display, crtc, output) {
+			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				cursor_leak_test_pipe(data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				cursor_leak_test_pipe(data, crtc->pipe,
+						      output);
 		}
 	}
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
 	igt_subtest_with_dynamic("universal-plane-pageflip-windowed") {
 		igt_require(is_intel_device(data->drm_fd) && data->display_ver >= 9);
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
-			if (!pipe_output_combo_valid(&data->display, pipe, output))
+		for_each_crtc_with_single_output(&data->display, crtc, output) {
+			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				pageflip_win_test_pipe(data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				pageflip_win_test_pipe(data, crtc->pipe,
+						       output);
 		}
 	}
 }
-- 
2.52.0

