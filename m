Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A970EC1EB6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03D010E8A7;
	Thu,  5 Feb 2026 13:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFG+b6z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2167F10E8A7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298255; x=1801834255;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6HbXCk1jm9RET6Iy9gk6KSI2IJvBXxJaFcM1aCS5w98=;
 b=oFG+b6z59TDR9OzVZDMHIWDd7+c6aJKhRqhO2JDhPVC7r/x2MWhJdyRR
 nrLrO7uIrweBTPCX2jzmVRPPYw/wA1RPmvPJ+q0+pu3uh6+LwUxbXICJ9
 IF5B+b4k3f8brzpWyvu0WJn5GXtmtYxlRVdYb36+EOI3ts/9KvBXFwJAt
 IGIdbr0QUSkE0Xm3z/OML5MxugAGW1r8WNqPDHbUe+c0OJzkH9Y8nefvh
 fMU0ryZFP9vxJsdArZjPIRO1gaHDXpEzs7xJgd3tdbW9Rrc+SQavma0NF
 tuvqY8Oq1Rh3COxdfEvU8QfXoq+4zwcSBNFiWgTAG7cXHf5UT9CMBZBGo w==;
X-CSE-ConnectionGUID: WMC6cI8tQxewn3DVVLyPjw==
X-CSE-MsgGUID: H7wWGorsQvaLhNv8KuhYaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693535"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693535"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:55 -0800
X-CSE-ConnectionGUID: MONsBynPTD6bIltwddi7Pw==
X-CSE-MsgGUID: m7qdG2CtQs6ChaSKDqDx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499309"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/12] tests/kms: Convert to for_each_crtc(), part 4
Date: Thu,  5 Feb 2026 15:30:16 +0200
Message-ID: <20260205133019.9161-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc(). In
these cases we already have a local 'igt_crtc_t*' variable
within the loop, so we'll just hoist that upwards to be the
loop iterator instead.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe;
iterator name for_each_crtc;
typedef igt_crtc_t;
identifier PIPE, CRTC;
expression DISPLAY;
type T;
@@
+ igt_crtc_t *CRTC;
  T PIPE;
<+...
- for_each_pipe(DISPLAY, PIPE)
+ for_each_crtc(DISPLAY, CRTC)
{
- igt_crtc_t *CRTC = igt_crtc_for_pipe(..., PIPE);
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...>
}
...+>

@depends on change@
identifier change.PIPE;
type change.T;
@@
{
...
(
- T PIPE;
|
- T PIPE = ...;
)
... when != PIPE
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                           | 36 +++++++++++--------------
 tests/amdgpu/amd_multidisplay_modeset.c | 22 +++++++--------
 tests/kms_atomic_transition.c           | 12 +++++----
 tests/kms_content_protection.c          |  7 +++--
 4 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 97b41778a52a..8508230a6142 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2785,7 +2785,7 @@ static void igt_output_reset(igt_output_t *output)
  */
 void igt_display_reset(igt_display_t *display)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	int i;
 
 	/*
@@ -2794,11 +2794,10 @@ void igt_display_reset(igt_display_t *display)
 	 */
 	display->first_commit = true;
 
-	for_each_pipe(display, pipe) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, pipe, plane)
+		for_each_plane_on_pipe(display, crtc->pipe, plane)
 			igt_plane_reset(plane);
 
 		igt_crtc_reset(crtc);
@@ -2915,6 +2914,7 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
  */
 void igt_display_reset_outputs(igt_display_t *display)
 {
+	igt_crtc_t *crtc;
 	int i;
 	drmModeRes *resources;
 
@@ -2968,14 +2968,13 @@ void igt_display_reset_outputs(igt_display_t *display)
 	 * display. */
 	igt_display_reset(display);
 
-	for_each_pipe(display, i) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
-		if (!igt_pipe_has_valid_output(display, i))
+		if (!igt_pipe_has_valid_output(display, crtc->pipe))
 			continue;
 
-		output = igt_get_single_output_for_pipe(display, i);
+		output = igt_get_single_output_for_pipe(display, crtc->pipe);
 
 		if (crtc->num_primary_planes > 1) {
 			igt_plane_t *old_primary = &crtc->planes[0];
@@ -4791,7 +4790,7 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 {
 
 	int ret = 0, i;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	drmModeAtomicReq *req;
 	igt_output_t *output;
 
@@ -4799,8 +4798,7 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		return -1;
 	req = drmModeAtomicAlloc();
 
-	for_each_pipe(display, pipe) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
 		/*
@@ -4809,7 +4807,7 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		if (crtc->changed)
 			igt_atomic_prepare_crtc_commit(crtc, req);
 
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			/* skip planes that are handled by another pipe */
 			if (plane->ref->crtc != crtc)
 				continue;
@@ -4849,10 +4847,9 @@ static void
 display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 {
 	int i;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, pipe) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
 		if (s == COMMIT_ATOMIC) {
@@ -4874,7 +4871,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 			}
 		}
 
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, crtc->pipe, plane) {
 			if (s == COMMIT_ATOMIC) {
 				int fd;
 				plane->changed = 0;
@@ -4945,7 +4942,7 @@ static int do_display_commit(igt_display_t *display,
 			     bool fail_on_error)
 {
 	int i, ret = 0;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	LOG_INDENT(display, "commit");
 
 	/* someone managed to bypass igt_display_require, catch them */
@@ -4956,10 +4953,7 @@ static int do_display_commit(igt_display_t *display,
 	if (s == COMMIT_ATOMIC) {
 		ret = igt_atomic_commit(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	} else {
-		for_each_pipe(display, pipe) {
-			igt_crtc_t *crtc = igt_crtc_for_pipe(display,
-								 pipe);
-
+		for_each_crtc(display, crtc) {
 			ret = igt_crtc_commit(crtc, s, fail_on_error);
 			if (ret)
 				break;
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 000053933e8c..2c92c7b822f2 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -144,6 +144,7 @@ static void set_all_output_pipe_to_none(struct data_t *data)
 static void test_init(struct data_t *data)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
 	int i;
 	bool ret = false;
 	uint8_t dpcd_246h = 0;
@@ -151,18 +152,17 @@ static void test_init(struct data_t *data)
 	for (i = 0; i < MAX_PIPES; i++)
 		data->pipe_crc_dprx[i] = NULL;
 
-	for_each_pipe(display, i) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
 		/* For each valid pipe, get one connected display.
 		 * This will let displays connected to MST hub be
 		 * tested
 		 */
-		output = igt_get_single_output_for_pipe(display, i);
-		data->primary[i] = igt_crtc_get_plane_type(crtc,
+		output = igt_get_single_output_for_pipe(display, crtc->pipe);
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 							   DRM_PLANE_TYPE_PRIMARY);
-		data->output[i] = output;
+		data->output[crtc->pipe] = output;
 
 		/* dp rx crc only available for eDP, SST DP, MST DP */
 		if ((output->config.connector->connector_type ==
@@ -173,24 +173,24 @@ static void test_init(struct data_t *data)
 			ret = dpcd_read_byte(data->fd, output->config.connector,
 				DPCD_TEST_SINK_MISC, &dpcd_246h);
 			if (ret && ((dpcd_246h & 0x20) != 0x0))
-				data->pipe_crc_dprx[i] = igt_crtc_crc_new(crtc,
+				data->pipe_crc_dprx[crtc->pipe] = igt_crtc_crc_new(crtc,
 									  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 		}
 
-		data->pipe_crc_otg[i] = igt_crtc_crc_new(crtc,
+		data->pipe_crc_otg[crtc->pipe] = igt_crtc_crc_new(crtc,
 							 IGT_PIPE_CRC_SOURCE_AUTO);
 		/* disable eDP PSR */
-		if (data->output[i]->config.connector->connector_type ==
+		if (data->output[crtc->pipe]->config.connector->connector_type ==
 				DRM_MODE_CONNECTOR_eDP) {
 			kmstest_set_connector_dpms(display->drm_fd,
-				data->output[i]->config.connector,
+				data->output[crtc->pipe]->config.connector,
 				DRM_MODE_DPMS_OFF);
 
 			igt_amd_disallow_edp_enter_psr(data->fd,
-				data->output[i]->name, true);
+				data->output[crtc->pipe]->name, true);
 
 			kmstest_set_connector_dpms(display->drm_fd,
-				data->output[i]->config.connector,
+				data->output[crtc->pipe]->config.connector,
 				DRM_MODE_DPMS_ON);
 		}
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index ece95961cdf2..01d739c759f1 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -898,6 +898,7 @@ static void collect_crcs_mask(igt_pipe_crc_t **pipe_crcs, unsigned mask, igt_crc
 
 static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool fencing)
 {
+	igt_crtc_t *crtc;
 	int i, j;
 	unsigned iter_max;
 	igt_output_t *output;
@@ -920,8 +921,7 @@ retry:
 	igt_create_color_pattern_fb(data->drm_fd, width, height,
 				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &data->fbs[1]);
 
-	for_each_pipe(&data->display, i) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, i);
+	for_each_crtc(&data->display, crtc) {
 		igt_plane_t *plane = igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
@@ -930,10 +930,11 @@ retry:
 		j += 1;
 
 		if (is_intel_device(data->drm_fd))
-			data->pipe_crcs[i] = igt_crtc_crc_new(crtc,
+			data->pipe_crcs[crtc->pipe] = igt_crtc_crc_new(crtc,
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
-		for_each_valid_output_on_pipe(&data->display, i, output) {
+		for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+					      output) {
 			if (igt_output_get_driving_crtc(output) != NULL)
 				continue;
 
@@ -943,7 +944,8 @@ retry:
 				mode = igt_output_get_mode(output);
 
 				igt_info("(pipe %s + %s), mode:",
-					 kmstest_pipe_name(i), igt_output_name(output));
+					 igt_crtc_name(crtc),
+					 igt_output_name(output));
 				kmstest_dump_mode(mode);
 
 				break;
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 5928266f2fe4..67710dad1beb 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -862,6 +862,7 @@ test_content_protection_mst(int content_type)
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
 	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
+	igt_crtc_t *crtc;
 	enum pipe pipe;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
@@ -876,11 +877,9 @@ test_content_protection_mst(int content_type)
 			continue;
 
 		pipe_found = false;
-		for_each_pipe(display, pipe) {
-			igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
-
+		for_each_crtc(display, crtc) {
 			if (igt_crtc_is_free(crtc) &&
-			    igt_pipe_connector_valid(pipe, output)) {
+			    igt_pipe_connector_valid(crtc->pipe, output)) {
 				pipe_found = true;
 				break;
 			}
-- 
2.52.0

