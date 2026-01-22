Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72587D46977
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2636D10E9A1;
	Thu, 22 Jan 2026 12:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbFL9rfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93B310E9A1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086792; x=1800622792;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i4yV9NbYzjrIER1/XFg9ry8Yxx4HnTfTm+SvWKrOE3A=;
 b=dbFL9rfWbE2Y8890FET/CZ91nSs5jU0xtuPNQrPQs3GadAXYzlx5a9Rl
 KXIbUPKWsbHQDQkBeZkNbZxo/sobjZkdUhiHJyOmkcpXMcAhNgKa82UFP
 pq78aiDVprARu3tObwz7YeWCL9j/af7EbMML3AhJ++kKFcB2WLiU4FZWE
 cfPqWuFQd+1e5PSdDoB92mCqflHwb0ZTZ24atHS4J3XqYDSsGEIcz4hVK
 g1KU1r91mEpY6/KK1ClJzvUmmSX8rGhDbFuCN2JExmMHc0H+t3JktIRAi
 +jtNZPzIHe68u5O94IWj1esLwqR/jwfKVGyYamjEWzGms6BiNftzYFP9Q A==;
X-CSE-ConnectionGUID: 8RNYyhG1TZWHnbRvJhStag==
X-CSE-MsgGUID: nCalv+ZxTwyopJVM1f4WZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045330"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:52 -0800
X-CSE-ConnectionGUID: NGsw40x3TYSyhFvN4epGxQ==
X-CSE-MsgGUID: Ovcz2SauTcamngYvB3JMDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987064"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/10] lib/kms:
 s/igt_output_get_driving_pipe()/igt_output_get_driving_crtc()/
Date: Thu, 22 Jan 2026 14:59:29 +0200
Message-ID: <20260122125937.10807-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

Rename igt_output_get_driving_pipe() to igt_output_get_driving_crtc()
to reflect the fact that it returns the igt_crtc_t.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
@@
- igt_output_get_driving_pipe
+ igt_output_get_driving_crtc
  (...)
{ ... }

@@
@@
- igt_output_get_driving_pipe
+ igt_output_get_driving_crtc
  (...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                  | 14 +++++++-------
 lib/igt_kms.h                  |  2 +-
 tests/intel/gem_pxp.c          |  2 +-
 tests/intel/kms_pm_lpsp.c      |  2 +-
 tests/intel/xe_pxp.c           |  2 +-
 tests/kms_atomic_transition.c  |  4 ++--
 tests/kms_content_protection.c |  2 +-
 tests/kms_cursor_legacy.c      |  2 +-
 tests/kms_debugfs.c            |  2 +-
 tests/kms_feature_discovery.c  |  2 +-
 tests/kms_plane_scaling.c      |  2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ec6a71f9da2a..31013f36f705 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3529,7 +3529,7 @@ report_dup:
 	}
 }
 
-igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
+igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
 	enum pipe pipe;
@@ -5267,7 +5267,7 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
  */
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
 
 	if (mode)
 		output->override_mode = *mode;
@@ -5337,7 +5337,7 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 	igt_assert(output->name);
 
 	if (output->pending_pipe != PIPE_NONE)
-		old_pipe = igt_output_get_driving_pipe(output);
+		old_pipe = igt_output_get_driving_crtc(output);
 
 	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
 	    igt_crtc_name(pipe_obj));
@@ -5518,7 +5518,7 @@ igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
 {
 	igt_crtc_t *pipe;
 
-	pipe = igt_output_get_driving_pipe(output);
+	pipe = igt_output_get_driving_crtc(output);
 	igt_assert(pipe);
 
 	return igt_crtc_get_plane(pipe, plane_idx);
@@ -5538,7 +5538,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
 {
 	igt_crtc_t *pipe;
 
-	pipe = igt_output_get_driving_pipe(output);
+	pipe = igt_output_get_driving_crtc(output);
 	igt_assert(pipe);
 
 	return igt_crtc_get_plane_type(pipe, plane_type);
@@ -5555,7 +5555,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
  */
 int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
 	igt_assert(pipe);
 
 	return igt_crtc_count_plane_type(pipe, plane_type);
@@ -5574,7 +5574,7 @@ int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
 	igt_assert(pipe);
 
 	return igt_crtc_get_plane_type_index(pipe, plane_type, index);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ef2654dd3948..a20cc9fd4021 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -588,7 +588,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
-igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
+igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
 const char *igt_output_name(igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index b1bd094798b7..a3b4bc4d0b41 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1244,7 +1244,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_output_get_driving_pipe(output);
+		pipe = igt_output_get_driving_crtc(output);
 		pipe_crc = igt_crtc_crc_new(pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index e65597b9fded..eef10e54ab3d 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -139,7 +139,7 @@ static void test_cleanup(data_t *data)
 {
 	igt_plane_t *primary;
 
-	if (!data->output || igt_output_get_driving_pipe(data->output) == NULL)
+	if (!data->output || igt_output_get_driving_crtc(data->output) == NULL)
 		return;
 
 	primary = igt_output_get_plane_type(data->output,
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 3aee74b849a0..6e3ef9275eb9 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -845,7 +845,7 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_output_get_driving_pipe(output);
+		pipe = igt_output_get_driving_crtc(output);
 		pipe_crc = igt_crtc_crc_new(pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 07889fe87caa..24af925332d3 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -840,7 +840,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		event_mask |= 1 << pipe;
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			if (igt_output_get_driving_pipe(output) != NULL)
+			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
@@ -933,7 +933,7 @@ retry:
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
-			if (igt_output_get_driving_pipe(output) != NULL)
+			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 16b174266a33..5928266f2fe4 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -397,7 +397,7 @@ static bool igt_crtc_is_free(igt_crtc_t *crtc)
 	int i;
 
 	for (i = 0; i < display->n_outputs; i++)
-		if (igt_output_get_driving_pipe(&display->outputs[i]) == crtc)
+		if (igt_output_get_driving_crtc(&display->outputs[i]) == crtc)
 			return false;
 
 	return true;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index dbcb4bbf243c..a3499b246c90 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -439,7 +439,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 	for_each_pipe(display, pipe) {
 		for_each_valid_output_on_pipe(display, pipe, *output) {
-			if (igt_output_get_driving_pipe(*output) != NULL)
+			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
 			igt_output_set_crtc(*output,
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index e2e7daf44e24..228a54cd1a35 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -45,7 +45,7 @@ static void igt_display_all_on(igt_display_t *display)
 			igt_plane_t *primary;
 			drmModeModeInfo *mode;
 
-			if (igt_output_get_driving_pipe(output) != NULL)
+			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index b63af75cdac3..a2af0e2dfc2a 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -99,7 +99,7 @@ int igt_main() {
 				/* this is what most of the 2x tests are doing */
 				for_each_pipe(&display, pipe) {
 					for_each_valid_output_on_pipe(&display, pipe, output) {
-						if (igt_output_get_driving_pipe(output) == NULL) {
+						if (igt_output_get_driving_crtc(output) == NULL) {
 							igt_output_set_crtc(output,
 									    igt_crtc_for_pipe(output->display, pipe));
 							output_count++;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index eea557e7a0c2..bed8ec1581bc 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -851,7 +851,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 	for_each_pipe(display, pipe) {
 		for_each_valid_output_on_pipe(display, pipe, *output) {
-			if (igt_output_get_driving_pipe(*output) != NULL)
+			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
 			igt_output_set_crtc(*output,
-- 
2.52.0

