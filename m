Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5521AD49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753A10E9BC;
	Fri, 30 Jan 2026 10:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8zg562r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610F710E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770413; x=1801306413;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MDVlmsDZGl+a2v9zGrpKCUIwxpAFLu74pi9w/O+FFIs=;
 b=X8zg562rWqB2wgmkfZQPSdu0nz8RUvGn5KPqdABme71Ov9H+FBc5sE+/
 TL/iZcRXbxBav0RsXdukBIPNEiNDRS8nzpKIK4hmm2P8XsK10xLzQPvWX
 0XMB7CL3xXEnQOmRxlPZxH541qfn6Z4fToPCmabpb4zOXzM+X2SY3IZCm
 ZlBB6nB47cfNtxRPejBpwJuf3MHcbLa/Hx9W57JBopQvOw+r7lwAqFutf
 uLM3ya5pn0i3K8wifBS69+6nVzOFe7BIvWZz8Kt0ct7EAxgncl1opqQXh
 +5t+gXPvIjeWQWrMHdpcPBUgewpP1SIwGyXxKo0hsCk1uA19wcVqfqsHg Q==;
X-CSE-ConnectionGUID: Pfk9c3rYSpuWHrmCHRp1wg==
X-CSE-MsgGUID: on8G1lDVSG6B92o3/ADH4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653043"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:33 -0800
X-CSE-ConnectionGUID: MLGYhaXbSkmDeWRoXq/Zug==
X-CSE-MsgGUID: +rLvISLRSIiugvr4bAPKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826868"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/15] lib/kms: Use for_each_crtc_with_valid_output(),
 part 2
Date: Fri, 30 Jan 2026 12:52:34 +0200
Message-ID: <20260130105237.14481-13-ville.syrjala@linux.intel.com>
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

Convert some uses of for_each_pipe_with_valid_output()
to for_each_crtc_with_valid_output(). Take care of the
cases where we (presumably) still have to keep some
kind of 'data->pipe' thingy still up to date.

Eventually we should probably replace 'data->pipe' with
'data->crtc' but I didn't want to go that far here.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe_with_valid_output;
iterator name for_each_crtc_with_valid_output;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY, OUTPUT, X;
@@
- for_each_pipe_with_valid_output(DISPLAY, X->PIPE, OUTPUT)
+ for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
{
+ X->PIPE = crtc->pipe;
<...
(
- igt_crtc_for_pipe(..., X->PIPE)
+ crtc
|
- kmstest_pipe_name(X->PIPE)
+ igt_crtc_name(crtc)
|
- X->PIPE
+ crtc->pipe
)
...>
}

@depends on change@
identifier FUNC;
@@
FUNC(...)
{
+ igt_crtc_t *crtc;
<+...
for_each_crtc_with_valid_output(...) { ... }
...+>
}

@@
identifier CRTC;
@@
igt_crtc_t *CRTC;
...
- igt_crtc_t *CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c       |  6 ++++--
 tests/intel/kms_ccs.c          | 19 +++++++++++------
 tests/intel/kms_fb_coherency.c |  6 ++++--
 tests/intel/kms_pwrite_crc.c   |  6 ++++--
 tests/kms_async_flips.c        | 23 +++++++++++++--------
 tests/kms_vblank.c             | 37 +++++++++++++++++++++++-----------
 6 files changed, 65 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 415508213e55..3946c7c00dfd 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -685,6 +685,7 @@ max_hw_stride_async_flip_test(data_t *data)
 
 static void test_scanout(data_t *data)
 {
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 
 	igt_require(data->format == DRM_FORMAT_C8 ||
@@ -708,11 +709,12 @@ static void test_scanout(data_t *data)
 	max_fb_size(data, &data->big_fb_width, &data->big_fb_height,
 		    data->format, data->modifier);
 
-	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		igt_display_reset(&data->display);
 
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(&data->display))
 			continue;
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ea23b6581b06..85d1e16cafe3 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1125,6 +1125,7 @@ static bool valid_modifier_test(u64 modifier, const enum test_flags flags)
 
 static void test_output(data_t *data, const int testnum)
 {
+	igt_crtc_t *crtc;
 	uint16_t dev_id;
 
 	igt_fixture()
@@ -1150,15 +1151,18 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
-			for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+			for_each_crtc_with_valid_output(&data->display, crtc,
+							data->output) {
+				data->pipe = crtc->pipe;
 				igt_display_reset(&data->display);
 
 				igt_output_set_crtc(data->output,
-						    igt_crtc_for_pipe(data->output->display, data->pipe));
+						    crtc);
 				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe),
+				igt_dynamic_f("pipe-%s-%s",
+							    igt_crtc_name(crtc),
 							    data->output->name) {
 					int valid_tests = 0;
 
@@ -1166,9 +1170,12 @@ static void test_output(data_t *data, const int testnum)
 						igt_info("Testing with seed %d\n", data->seed);
 
 					if (data->flags & TEST_ALL_PLANES) {
-						igt_display_require_output_on_pipe(&data->display, data->pipe);
+						igt_display_require_output_on_pipe(&data->display,
+										   crtc->pipe);
 
-						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+						for_each_plane_on_pipe(&data->display,
+								       crtc->pipe,
+								       data->plane) {
 							if (skip_plane(data, data->plane))
 								continue;
 
@@ -1186,7 +1193,7 @@ static void test_output(data_t *data, const int testnum)
 					igt_require_f(valid_tests > 0,
 						      "no valid tests for %s on pipe %s\n",
 						      ccs_modifiers[i].str,
-						      kmstest_pipe_name(data->pipe));
+						      igt_crtc_name(crtc));
 				}
 			}
 		}
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index e6d043c114d5..2f917e97b792 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -222,13 +222,15 @@ static void test_legacy_mmap_wc(data_t *data)
 
 static void select_valid_pipe_output_combo(data_t *data)
 {
+	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
 
-	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe));
+				    crtc);
 		if (intel_pipe_output_combo_valid(display))
 			return;
 	}
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 64c167ad3f44..4a214d34e53b 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -169,13 +169,15 @@ static void cleanup_crtc(data_t *data)
 
 static void run_test(data_t *data)
 {
+	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
 
-	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 993ad37530b0..8539d31efded 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -903,16 +903,18 @@ static void require_linear_modifier(data_t *data)
 
 static void run_test(data_t *data, void (*test)(data_t *))
 {
+	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
-	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -923,7 +925,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		else
 			data->modifier = default_modifier(data);
 
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+			      data->output->name) {
 			/*
 			 * FIXME: joiner+async flip is busted currently in KMD.
 			 * Remove this check once the issues are fixed in KMD.
@@ -969,11 +972,13 @@ static bool skip_async_format_mod(data_t *data,
 
 static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data_t *))
 {
+	igt_crtc_t *crtc;
 	struct igt_vec tested_formats;
 
 	igt_vec_init(&tested_formats, sizeof(struct format_mod));
 
-	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		test_init(data);
 
 		igt_assert_f(data->plane->async_format_mod_count > 0,
@@ -990,7 +995,7 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 					   IGT_MODIFIER_FMT " on %s.%u\n",
 					   IGT_FORMAT_ARGS(f.format),
 					   IGT_MODIFIER_ARGS(f.modifier),
-					   kmstest_pipe_name(data->pipe),
+					   igt_crtc_name(crtc),
 					   data->plane->index);
 				continue;
 			}
@@ -999,7 +1004,7 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 			data->plane_format = f.format;
 			data->async_mod_formats = true;
 
-			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
+			igt_dynamic_f("pipe-%s-%s-%s-%s", igt_crtc_name(crtc),
 				      data->output->name,
 				      igt_fb_modifier_name(data->modifier),
 				      igt_format_str(data->plane_format)) {
@@ -1022,10 +1027,12 @@ static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data
 
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
+	igt_crtc_t *crtc;
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
-	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+	for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
+		data->pipe = crtc->pipe;
 		test_init(data);
 
 		igt_require_f(data->plane->async_format_mod_count > 0,
@@ -1042,7 +1049,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 
 			data->modifier = modifier;
 
-			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
+			igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
 				      data->output->name,
 				      igt_fb_modifier_name(modifier)) {
 				      /*
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 1e4ccd83b554..ecbd85d031a6 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -476,6 +476,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 
 static void run_subtests(data_t *data)
 {
+	igt_crtc_t *crtc;
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -515,17 +516,23 @@ static void run_subtests(data_t *data)
 
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
-				for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
-					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
+				for_each_crtc_with_valid_output(&data->display,
+								crtc,
+								data->output) {
+					data->pipe = crtc->pipe;
+					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->output))
 						continue;
 
-					if (!all_pipes && data->pipe != active_pipes[0] &&
-					    data->pipe != active_pipes[last_pipe]) {
-						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
+					if (!all_pipes && crtc->pipe != active_pipes[0] &&
+					    crtc->pipe != active_pipes[last_pipe]) {
+						igt_info("Skipping pipe %s\n",
+							 igt_crtc_name(crtc));
 						continue;
 					}
 
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+					igt_dynamic_f("pipe-%s-%s",
+						      igt_crtc_name(crtc),
+						      data->output->name) {
 						data->flags = m->flags | NOHANG;
 						run_test(data, f->func);
 					}
@@ -541,17 +548,23 @@ static void run_subtests(data_t *data)
 				igt_hang_t hang;
 
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
-				for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
-					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
+				for_each_crtc_with_valid_output(&data->display,
+								crtc,
+								data->output) {
+					data->pipe = crtc->pipe;
+					if (!pipe_output_combo_valid(&data->display, crtc->pipe, data->output))
 						continue;
 
-					if (!all_pipes && data->pipe != active_pipes[0] &&
-					    data->pipe != active_pipes[last_pipe]) {
-						igt_info("Skipping pipe %s\n", kmstest_pipe_name(data->pipe));
+					if (!all_pipes && crtc->pipe != active_pipes[0] &&
+					    crtc->pipe != active_pipes[last_pipe]) {
+						igt_info("Skipping pipe %s\n",
+							 igt_crtc_name(crtc));
 						continue;
 					}
 
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+					igt_dynamic_f("pipe-%s-%s",
+						      igt_crtc_name(crtc),
+						      data->output->name) {
 						data->flags = m->flags;
 						run_test(data, f->func);
 					}
-- 
2.52.0

