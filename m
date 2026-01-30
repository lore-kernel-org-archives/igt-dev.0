Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79718D49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D65D10E9B4;
	Fri, 30 Jan 2026 10:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXAWHUnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B19F10E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770405; x=1801306405;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fR2iurP02f8wM1xQq4D2Ss0+P62j6yFpwyTmZ6v7Q3w=;
 b=UXAWHUnw5Ey4m2OCOCWIwyBXD1XHPfYuy+QVqep0/6HArQkrM4bDBouX
 kxsbyQDr26MvIvhSfuyxm14dvR7WlFBz1M7E1JNNbeEXV5DHUUT7T59fv
 SmuMiD1JN1aca8UheRTeUhlYjOm/5dYjUquwYBelZYYcGFMpGKFLww280
 fl/H+Y/WY5zhKDbLYuX9JXcRuqz0LBfHXraltNXU2Hy7k8GylX8bPWjlT
 /SLTLx6Rh3VhkfV/RlkVpV+C7onca/cUHb8tg4B+bFXzdf0YirQhh4roW
 zMGUU+CL7ghHLierNLEe0ubZCwgZNoDSuvgym0sQQ+GXei1nBDqhVbL3b Q==;
X-CSE-ConnectionGUID: 3psEz5CGTSaxuioKhCivHA==
X-CSE-MsgGUID: kC/AnSpTT/mMnTy5QC2qsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653032"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:25 -0800
X-CSE-ConnectionGUID: O7ckk/mXSZ6puT4IYGo1tQ==
X-CSE-MsgGUID: A8BWhgdjS3qlrF0lWVf3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826825"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/15] lib/kms: Use for_each_crtc_with_single_output(),
 part 3
Date: Fri, 30 Jan 2026 12:52:32 +0200
Message-ID: <20260130105237.14481-11-ville.syrjala@linux.intel.com>
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
simple use cases that weren't converted by the previous
attempt (due to coccinelle performance falling off a cliff
with the more straightforward semantic patch).

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe_with_single_output;
iterator name for_each_crtc_with_single_output;
typedef igt_crtc_t;
enum pipe PIPE;
expression DISPLAY, OUTPUT;
@@
- for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT)
+ for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
{
<+...
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
...+>
}

@depends on change@
identifier FUNC;
@@
FUNC(...)
{
+ igt_crtc_t *crtc;
<+...
for_each_crtc_with_single_output(...) { ... }
...+>
}

@depends on change@
identifier FUNC, PIPE;
expression E;
@@
FUNC(...)
{
...
(
- enum pipe PIPE;
|
- enum pipe PIPE = E;
)
... when != PIPE
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_atomic.c     | 147 ++++++++++++++++++++++-------------------
 tests/kms_cursor_crc.c |  86 +++++++++++++-----------
 2 files changed, 128 insertions(+), 105 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index c78b6b7d7e8b..fa321cc3c7a1 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1455,7 +1455,7 @@ static const char *help_str =
 
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
-	enum pipe pipe = PIPE_NONE;
+	igt_crtc_t *crtc;
 	igt_output_t *output = NULL;
 	data_t data = { 0 };
 
@@ -1470,20 +1470,21 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
 		     "the legacy and atomic interfaces.");
 	igt_subtest_with_dynamic("plane-overlay-legacy") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			igt_plane_t *overlay =
-				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_OVERLAY);
 			uint32_t format = plane_get_igt_format(overlay);
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 			if (!overlay || !format)
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				plane_overlay(&data, output, overlay, format);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1493,13 +1494,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
 		     "the legacy and atomic interfaces.");
 	igt_subtest_with_dynamic("plane-primary-legacy") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				plane_primary(&data);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1509,15 +1511,15 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Verify that the overlay plane can cover the primary one (and "\
 		     "vice versa) by changing their zpos property.");
 	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			igt_plane_t *overlay =
-				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_OVERLAY);
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 
-			atomic_setup(&data, pipe, output);
+			atomic_setup(&data, crtc->pipe, output);
 			if (!overlay)
 				continue;
 			if (!has_mutable_zpos(data.primary) || !has_mutable_zpos(overlay))
@@ -1525,10 +1527,11 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (!igt_plane_has_format_mod(data.primary, DRM_FORMAT_ARGB8888, 0x0) ||
 			    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
 				plane_primary_overlay_mutable_zpos(&data, output, overlay,
 								   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1538,17 +1541,19 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
 	igt_subtest_with_dynamic("plane-immutable-zpos") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			int n_planes = igt_crtc_for_pipe(&data.display, pipe)->n_planes;
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			int n_planes = crtc->n_planes;
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 			if (n_planes < 2)
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
-				plane_immutable_zpos(&data, output, pipe, n_planes);
-				atomic_clear(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
+				plane_immutable_zpos(&data, output,
+						     crtc->pipe, n_planes);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1558,20 +1563,21 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
 		     "the free-standing state objects and nothing else.");
 	igt_subtest_with_dynamic("test-only") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			uint32_t format;
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 
-			atomic_setup(&data, pipe, output);
+			atomic_setup(&data, crtc->pipe, output);
 			format = plane_get_igt_format(data.primary);
 
 			if (!format)
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_clear(&data, pipe, output);
-				test_only(&data, output, pipe, format);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_clear(&data, crtc->pipe, output);
+				test_only(&data, output, crtc->pipe, format);
 			}
 			if (!all_pipes)
 				break;
@@ -1581,19 +1587,20 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
 		     "legacy and atomic interfaces.");
 	igt_subtest_with_dynamic("plane-cursor-legacy") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			igt_plane_t *cursor =
-				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_CURSOR);
 
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 			if (!cursor)
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				plane_cursor(&data, output, cursor);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1602,13 +1609,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				plane_invalid_params(&data, output);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1617,13 +1625,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params-fence") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				plane_invalid_params_fence(&data, output);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1632,13 +1641,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				crtc_invalid_params(&data, output);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1647,13 +1657,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				crtc_invalid_params_fence(&data, output);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1664,13 +1675,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "various invalid conditions which the libdrm wrapper won't "
 		     "allow us to create.");
 	igt_subtest_with_dynamic("atomic-invalid-params") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-				atomic_setup(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
+				atomic_setup(&data, crtc->pipe, output);
 				atomic_invalid_params(&data, output);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
@@ -1679,17 +1691,18 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
 	igt_subtest_with_dynamic("atomic-plane-damage") {
-		for_each_pipe_with_single_output(&data.display, pipe, output) {
-			if (!pipe_output_combo_valid(&data.display, pipe, output))
+		for_each_crtc_with_single_output(&data.display, crtc, output) {
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 				continue;
 
-			atomic_setup(&data, pipe, output);
+			atomic_setup(&data, crtc->pipe, output);
 
 			if (!igt_plane_has_prop(data.primary, IGT_PLANE_FB_DAMAGE_CLIPS))
 				continue;
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output)) {
 				atomic_plane_damage(&data);
-				atomic_clear(&data, pipe, output);
+				atomic_clear(&data, crtc->pipe, output);
 			}
 			if (!all_pipes)
 				break;
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 4dcf63025687..10e51b457a15 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -959,7 +959,7 @@ static void test_size_hints(data_t *data)
 
 static void run_size_tests(data_t *data, int w, int h)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct {
 		const char *name;
 		void (*testfunc)(data_t *);
@@ -1006,11 +1006,12 @@ static void run_size_tests(data_t *data, int w, int h)
 				}
 			}
 
-			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-				if (execution_constraint(pipe))
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 data->output) {
+				if (execution_constraint(crtc->pipe))
 					continue;
 
-				data->pipe = pipe;
+				data->pipe = crtc->pipe;
 
 				if (!valid_pipe_output_combo(data))
 					continue;
@@ -1021,7 +1022,8 @@ static void run_size_tests(data_t *data, int w, int h)
 				}
 
 				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), igt_output_name(data->output))
+					      igt_crtc_name(crtc),
+					      igt_output_name(data->output))
 					run_test(data, size_tests[i].testfunc, w, h);
 			}
 		}
@@ -1033,7 +1035,7 @@ static void run_size_tests(data_t *data, int w, int h)
 
 static void run_tests_on_pipe(data_t *data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int cursor_size;
 
 	igt_fixture() {
@@ -1045,17 +1047,18 @@ static void run_tests_on_pipe(data_t *data)
 		     "flight to smaller ones to see that the size is applied "
 		     "correctly.");
 	igt_subtest_with_dynamic("cursor-size-change") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_cursor_size,
 					 data->cursor_max_w, data->cursor_max_h);
@@ -1065,17 +1068,18 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully opaque cursor "
 		     "plane, i.e., alpha channel equal to 1.0.");
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_cursor_opaque,
 					 data->cursor_max_w, data->cursor_max_h);
@@ -1085,17 +1089,18 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully transparent cursor "
 		     "plane, i.e., alpha channel equal to 0.0.");
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_cursor_transparent,
 					 data->cursor_max_w, data->cursor_max_h);
@@ -1114,17 +1119,18 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Validate cursor updates don't cause tearing with framebuffer changes");
 	igt_subtest_with_dynamic("cursor-tearing-framebuffer-change") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-					  kmstest_pipe_name(pipe),
+					  igt_crtc_name(crtc),
 					  data->output->name)
 				run_test(data, test_crc_cursors,
 					  data->cursor_max_w, data->cursor_max_h);
@@ -1133,17 +1139,18 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Validate cursor updates don't cause tearing with position changes");
 	igt_subtest_with_dynamic("cursor-tearing-position-change") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-					  kmstest_pipe_name(pipe),
+					  igt_crtc_name(crtc),
 					  data->output->name)
 				run_test(data, test_crc_pos_cursors,
 					  data->cursor_max_w, data->cursor_max_h);
@@ -1159,18 +1166,19 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with DPMS.");
 	igt_subtest_with_dynamic("cursor-dpms") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 			data->flags = TEST_DPMS;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_crc_random,
 					 data->cursor_max_w, data->cursor_max_h);
@@ -1180,18 +1188,19 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with suspend.");
 	igt_subtest_with_dynamic("cursor-suspend") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 			data->flags = TEST_SUSPEND;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_crc_random,
 					 data->cursor_max_w, data->cursor_max_h);
@@ -1204,17 +1213,18 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
 	igt_subtest_with_dynamic("cursor-size-hints") {
-		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
-			if (execution_constraint(pipe))
+		for_each_crtc_with_single_output(&data->display, crtc,
+						 data->output) {
+			if (execution_constraint(crtc->pipe))
 				continue;
 
-			data->pipe = pipe;
+			data->pipe = crtc->pipe;
 
 			if (!valid_pipe_output_combo(data))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
+				      igt_crtc_name(crtc),
 				      data->output->name)
 				run_test(data, test_size_hints,
 					 data->cursor_max_w, data->cursor_max_h);
-- 
2.52.0

