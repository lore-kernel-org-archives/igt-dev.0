Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F03BEC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1B310E8A4;
	Thu,  5 Feb 2026 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yvm+UVtx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFED10E8A5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298251; x=1801834251;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MNJxFLdDmOgQ5vHU5+BZV5rNb1DmTPHe7e3OtbaLLmU=;
 b=Yvm+UVtxNpKmWmMrF5DtUwP3xza6QyCnAefSXP/IzSqpOyNX38IrrwwN
 3xNQIDoO7xDwUI+Sh3fJk5MTExh6F3VCta6Pq1rthZTaThdgvR5Wqvu2w
 0cY/9ZKXh3UTBoAhpKm75x3yxGiJLf5XfwTXvn0YqIjKdMpqTKJwgnuh2
 bkspW3MfKmVA/+6O+50NYELsuQCTfb1gkF67JjWmijYea7HCT0SZRE+Zz
 ZxCiw4OGsKNbPS1vOmX0KPwJ7PsHeaoN49c45fVea/sxasUl0wlSBPW1e
 bbcPL7eG5PHeAJmZkGTldv9fqvlTIDKjtUTk0wPfRJhI6BG7LpGNiuN+B w==;
X-CSE-ConnectionGUID: eqfrp4GkQZyLAFuPiv7VxQ==
X-CSE-MsgGUID: Qj5W3AF+QdC+H44pUfAZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71390623"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71390623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:34 -0800
X-CSE-ConnectionGUID: LMET+C+lSmK2IAgNyulQcw==
X-CSE-MsgGUID: JP6tfbLORHSJzQB1uW3NUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215021057"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/12] tests/kms: Convert problematic tests to use
 for_each_crtc()
Date: Thu,  5 Feb 2026 15:30:10 +0200
Message-ID: <20260205133019.9161-4-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc().

Take care of specific tests that are problemtic for
coccinelle. The conversion is done mostly with cocci
but I did not manage to add the new 'crtc' iterator
declarations without hitting some pathological
performance problems in cocci. So that part was
done manually on top of the semantic patch.

 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe;
iterator name for_each_crtc;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY;
@@
- for_each_pipe(DISPLAY, PIPE)
+ for_each_crtc(DISPLAY, crtc)
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

@@
identifier CRTC;
expression P, C;
@@
for_each_crtc(..., CRTC)
{
...
(
	P = CRTC->pipe
|
-	P = PIPE_A + CRTC->pipe
+	P = CRTC->pipe
)
...
-	C = igt_crtc_for_pipe(..., P)
+	C = CRTC
<...
(
-	C
+	CRTC
|
-	P
+	CRTC->pipe
)
...>
}

@@
identifier CRTC;
expression P, C;
@@
for_each_crtc(..., CRTC)
{
...
(
	P = CRTC->pipe
|
-	P = PIPE_A + CRTC->pipe
+	P = CRTC->pipe
)
...
-	C = igt_crtc_for_pipe(..., P)
+	C = CRTC
<...
(
-	C
+	CRTC
|
-	P
+	CRTC->pipe
)
...>
}

@depends on change@
identifier PIPE;
expression E;
@@
(
- int PIPE;
|
- enum pipe PIPE;
|
- int PIPE = E;
|
- enum pipe PIPE = E;
)
... when != PIPE

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_dp_dsc.c  | 191 ++++++++++++++++++++-----------------
 tests/amdgpu/amd_hotplug.c |  68 +++++++------
 tests/amdgpu/amd_plane.c   |  37 +++----
 tests/amdgpu/amd_subvp.c   |  32 +++----
 tests/kms_bw.c             |  29 +++---
 5 files changed, 190 insertions(+), 167 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 266211dda81f..a4352a59691b 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -47,10 +47,10 @@ typedef struct data {
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_pipe_crc_free(data->pipe_crc[i]);
+	for_each_crtc(display, crtc) {
+		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
@@ -61,16 +61,16 @@ static void test_fini(data_t *data)
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
 	int i, n;
 
-	for_each_pipe(display, i) {
-		data->pipe_id[i] = PIPE_A + i;
-		data->crtc[i] = igt_crtc_for_pipe(&data->display,
-						  data->pipe_id[i]);
-		data->primary[i] = igt_crtc_get_plane_type(data->crtc[i],
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[i] =
-				igt_crtc_crc_new(data->crtc[i],
+	for_each_crtc(display, crtc) {
+		data->pipe_id[crtc->pipe] = crtc->pipe;
+		data->crtc[crtc->pipe] = crtc;
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->pipe] =
+				igt_crtc_crc_new(crtc,
 						 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
@@ -116,26 +116,27 @@ static void test_dsc_enable(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_fb_t ref_fb;
-	int i, test_conn_cnt = 0;
+	int test_conn_cnt = 0;
+	igt_crtc_t *crtc;
 
 	test_init(data);
 	igt_enable_connectors(data->fd);
 
-	for_each_pipe(&data->display, i) {
+	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[i];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
+		output = data->output[crtc->pipe];
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[i].hdisplay,
-				      data->mode[i].vdisplay,
+				      data->mode[crtc->pipe].hdisplay,
+				      data->mode[crtc->pipe].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -146,7 +147,7 @@ static void test_dsc_enable(data_t *data)
 		/* Force enable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
 
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		/* Check if DSC is enabled */
@@ -155,13 +156,13 @@ static void test_dsc_enable(data_t *data)
 		/* Revert DSC to automatic state */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
 		/* Revert DSC back to automatic mechanism by disabling state overwrites */
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 
@@ -263,26 +264,27 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	int num_slices[] = { 1, 2, 4, 8 };
 	int h_addressable, v_addressable;
 	bool ret_slice_height = false, ret_slice_width = false;
-	int i, test_conn_cnt = 0;
+	int test_conn_cnt = 0;
+	igt_crtc_t *crtc;
 
 	test_init(data);
 	igt_enable_connectors(data->fd);
 
-	for_each_pipe(&data->display, i) {
+	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[i];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
+		output = data->output[crtc->pipe];
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[i].hdisplay,
-				      data->mode[i].vdisplay,
+				      data->mode[crtc->pipe].hdisplay,
+				      data->mode[crtc->pipe].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -298,27 +300,31 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		/* Force enable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_ON);
 
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		/* Check if DSC is enabled */
 		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 
 		if (dsc_on) {
-			ret_slice_height = update_slice_height(data, v_addressable, num_slices, output, i, ref_fb);
-			ret_slice_width = update_slice_width(data, h_addressable, num_slices, output, i, ref_fb);
+			ret_slice_height = update_slice_height(data, v_addressable, num_slices, output,
+							       crtc->pipe,
+							       ref_fb);
+			ret_slice_width = update_slice_width(data, h_addressable, num_slices, output,
+							     crtc->pipe,
+							     ref_fb);
 		}
 
 		/* Force disable DSC */
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
 		/* Revert DSC back to automatic mechanism by disabling state overwrites */
-		igt_plane_set_fb(data->primary[i], &ref_fb);
+		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 
@@ -344,7 +350,8 @@ static void test_dsc_link_settings(data_t *data)
 	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
 	int lane_count[4], link_rate[4], link_spread[4];
 	igt_display_t *display = &data->display;
-	int i, lc, lr;
+	igt_crtc_t *crtc;
+	int lc, lr;
 	bool dsc_on;
 	const enum dc_lane_count lane_count_vals[] = {
 		LANE_COUNT_TWO,
@@ -360,39 +367,41 @@ static void test_dsc_link_settings(data_t *data)
 	test_init(data);
 
 	/* Setup all outputs */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-				      data->mode[i].hdisplay,
-				      data->mode[i].vdisplay,
+				      data->mode[crtc->pipe].hdisplay,
+				      data->mode[crtc->pipe].vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      0,
-				      &ref_fb[i]);
+				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
+				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+		igt_plane_set_fb(data->primary[crtc->pipe],
+				 &ref_fb[crtc->pipe]);
 	}
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Collect reference CRCs */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
 			continue;
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+					 &ref_crc[crtc->pipe]);
 	}
 
 	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
 		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
 			/* Write new link_settings */
-			for_each_pipe(&data->display, i) {
-				output = data->output[i];
+			for_each_crtc(&data->display, crtc) {
+				output = data->output[crtc->pipe];
 				if (!output || !igt_output_is_connected(output) ||
-				    !is_dsc_capable(&data->mode[i]))
+				    !is_dsc_capable(&data->mode[crtc->pipe]))
 					continue;
 
 				/* Write lower link settings */
@@ -408,10 +417,10 @@ static void test_dsc_link_settings(data_t *data)
 			/* Trigger commit after writing new link settings */
 			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-			for_each_pipe(&data->display, i) {
-				output = data->output[i];
+			for_each_crtc(&data->display, crtc) {
+				output = data->output[crtc->pipe];
 				if (!output || !igt_output_is_connected(output) ||
-				    !is_dsc_capable(&data->mode[i]))
+				    !is_dsc_capable(&data->mode[crtc->pipe]))
 					continue;
 
 				/* Verify lower link settings */
@@ -427,24 +436,26 @@ static void test_dsc_link_settings(data_t *data)
 				/* Log current mode and DSC status */
 				dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 				igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-					 data->mode[i].hdisplay,
-					 data->mode[i].vdisplay,
-					 data->mode[i].vrefresh,
+					 data->mode[crtc->pipe].hdisplay,
+					 data->mode[crtc->pipe].vdisplay,
+					 data->mode[crtc->pipe].vrefresh,
 					 dsc_on ? "ON" : "OFF");
 
-				igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
-				igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
+				igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+							 &new_crc[crtc->pipe]);
+				igt_assert_crc_equal(&ref_crc[crtc->pipe],
+						     &new_crc[crtc->pipe]);
 			}
 		}
 	}
 
 	/* Cleanup all fbs */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
-		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[crtc->pipe]))
 			continue;
 
-		igt_remove_fb(data->fd, &ref_fb[i]);
+		igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
 	}
 
 	test_fini(data);
@@ -456,87 +467,91 @@ static void test_dsc_bpc(data_t *data)
 	igt_fb_t ref_fb[MAX_PIPES];
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
-	int i, bpc, max_supported_bpc[MAX_PIPES];
+	int bpc, max_supported_bpc[MAX_PIPES];
 	bool dsc_on;
 	const int bpc_vals[] = { 12, 10, 8 };
+	igt_crtc_t *crtc;
 
 	test_init(data);
 
 	/* Find max supported bpc */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 		igt_info("Checking bpc support of conn %s\n", output->name);
-		max_supported_bpc[i] = igt_get_output_max_bpc(data->fd, output->name);
+		max_supported_bpc[crtc->pipe] = igt_get_output_max_bpc(data->fd, output->name);
 	}
 
 	/* Setup all outputs */
 	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
 		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
 
-		for_each_pipe(&data->display, i) {
-			output = data->output[i];
+		for_each_crtc(&data->display, crtc) {
+			output = data->output[crtc->pipe];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[i] < bpc_vals[bpc]) {
-				igt_info("Display doesn't support bpc of %d, max is %d. Skipping to next bpc value.\n", bpc_vals[bpc], max_supported_bpc[i]);
+			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc]) {
+				igt_info("Display doesn't support bpc of %d, max is %d. Skipping to next bpc value.\n", bpc_vals[bpc],
+					 max_supported_bpc[crtc->pipe]);
 				continue;
 			}
 			igt_info("Setting bpc = %d\n", bpc_vals[bpc]);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc_vals[bpc]);
 			igt_create_pattern_fb(data->fd,
-					      data->mode[i].hdisplay,
-					      data->mode[i].vdisplay,
+					      data->mode[crtc->pipe].hdisplay,
+					      data->mode[crtc->pipe].vdisplay,
 					      DRM_FORMAT_XRGB8888,
 					      0,
-					      &ref_fb[i]);
+					      &ref_fb[crtc->pipe]);
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-			igt_plane_set_fb(data->primary[i], &ref_fb[i]);
+					    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+			igt_plane_set_fb(data->primary[crtc->pipe],
+					 &ref_fb[crtc->pipe]);
 		}
 
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
-		for_each_pipe(&data->display, i) {
-			output = data->output[i];
+		for_each_crtc(&data->display, crtc) {
+			output = data->output[crtc->pipe];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[i] < bpc_vals[bpc])
+			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc])
 				continue;
 
 			/* Check that crc is non-zero */
-			igt_pipe_crc_collect_crc(data->pipe_crc[i], &test_crc);
+			igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+						 &test_crc);
 			igt_assert(test_crc.crc[0] && test_crc.crc[1] && test_crc.crc[2]);
 
 			/* Check current bpc */
 			igt_info("Verifying display %s has correct bpc\n", output->name);
 			igt_assert_output_bpc_equal(data->fd,
-						    data->pipe_id[i],
+						    data->pipe_id[crtc->pipe],
 						    output->name,
 						    bpc_vals[bpc]);
 
 			/* Log current mode and DSC status */
 			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 			igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-				 data->mode[i].hdisplay,
-				 data->mode[i].vdisplay,
-				 data->mode[i].vrefresh,
+				 data->mode[crtc->pipe].hdisplay,
+				 data->mode[crtc->pipe].vdisplay,
+				 data->mode[crtc->pipe].vrefresh,
 				 dsc_on ? "ON" : "OFF");
 		}
 
 		/* Cleanup all fbs */
-		for_each_pipe(&data->display, i) {
-			output = data->output[i];
+		for_each_crtc(&data->display, crtc) {
+			output = data->output[crtc->pipe];
 			if (!output || !igt_output_is_connected(output))
 				continue;
 
-			if (max_supported_bpc[i] < bpc_vals[bpc])
+			if (max_supported_bpc[crtc->pipe] < bpc_vals[bpc])
 				continue;
 
-			igt_remove_fb(data->fd, &ref_fb[i]);
+			igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
 		}
 	}
 
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 5aaf97bc812a..3672da047b1a 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -52,20 +52,20 @@ static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int i, n, max_pipes = igt_display_n_crtcs(display);
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		data->pipe_id[i] = PIPE_A + i;
-		data->crtc[i] = igt_crtc_for_pipe(&data->display,
-						  data->pipe_id[i]);
-		data->primary[i] = igt_crtc_get_plane_type(data->crtc[i],
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[i] = igt_crtc_get_plane_type_index(data->crtc[i],
-								 DRM_PLANE_TYPE_OVERLAY,
-								 0);
-		data->cursor[i] = igt_crtc_get_plane_type(data->crtc[i],
-							  DRM_PLANE_TYPE_CURSOR);
-		data->pipe_crc[i] =
-			igt_crtc_crc_new(data->crtc[i],
+	for_each_crtc(display, crtc) {
+		data->pipe_id[crtc->pipe] = crtc->pipe;
+		data->crtc[crtc->pipe] = crtc;
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
+		data->overlay[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  0);
+		data->cursor[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								   DRM_PLANE_TYPE_CURSOR);
+		data->pipe_crc[crtc->pipe] =
+			igt_crtc_crc_new(crtc,
 					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
@@ -94,10 +94,10 @@ static void test_init(data_t *data)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_pipe_crc_free(data->pipe_crc[i]);
+	for_each_crtc(display, crtc) {
+		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
@@ -150,31 +150,35 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	igt_fb_t ref_fb[MAX_PIPES];
 	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
 	igt_display_t *display = &data->display;
-	int i = 0;
+	igt_crtc_t *crtc;
 
 	test_init(data);
 
 	/* Setup all outputs */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
-		igt_create_pattern_fb(data->fd, data->w[i], data->h[i],
-				      DRM_FORMAT_XRGB8888, 0, &ref_fb[i]);
+		igt_create_pattern_fb(data->fd, data->w[crtc->pipe],
+				      data->h[crtc->pipe],
+				      DRM_FORMAT_XRGB8888, 0,
+				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
+				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+		igt_plane_set_fb(data->primary[crtc->pipe],
+				 &ref_fb[crtc->pipe]);
 	}
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Collect reference CRCs */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+					 &ref_crc[crtc->pipe]);
 	}
 
 	if (suspend) {
@@ -188,16 +192,18 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	}
 
 	/* Trigger hotplug and confirm reference image is the same. */
-	for_each_pipe(&data->display, i) {
-		output = data->output[i];
+	for_each_crtc(&data->display, crtc) {
+		output = data->output[crtc->pipe];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
 		igt_amd_trigger_hotplug(data->fd, output->name);
 
-		igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
-		igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
-		igt_remove_fb(data->fd, &ref_fb[i]);
+		igt_pipe_crc_collect_crc(data->pipe_crc[crtc->pipe],
+					 &new_crc[crtc->pipe]);
+		igt_assert_crc_equal(&ref_crc[crtc->pipe],
+				     &new_crc[crtc->pipe]);
+		igt_remove_fb(data->fd, &ref_fb[crtc->pipe]);
 	}
 
 	test_fini(data);
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 7c57a5e0934d..da51bc03ae49 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -153,22 +153,23 @@ static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int i, n, max_pipes = igt_display_n_crtcs(display);
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		data->pipe_id[i] = PIPE_A + i;
-		data->crtc[i] = igt_crtc_for_pipe(display, data->pipe_id[i]);
-		data->primary[i] = igt_crtc_get_plane_type(data->crtc[i],
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[i] = igt_crtc_get_plane_type_index(data->crtc[i],
-								 DRM_PLANE_TYPE_OVERLAY,
-								 0);
-		data->overlay2[i] = igt_crtc_get_plane_type_index(data->crtc[i],
-								  DRM_PLANE_TYPE_OVERLAY,
-								  1);
-		data->cursor[i] = igt_crtc_get_plane_type(data->crtc[i],
-							  DRM_PLANE_TYPE_CURSOR);
-		data->pipe_crc[i] =
-			igt_crtc_crc_new(data->crtc[i],
+	for_each_crtc(display, crtc) {
+		data->pipe_id[crtc->pipe] = crtc->pipe;
+		data->crtc[crtc->pipe] = crtc;
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
+		data->overlay[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  0);
+		data->overlay2[crtc->pipe] = igt_crtc_get_plane_type_index(crtc,
+									   DRM_PLANE_TYPE_OVERLAY,
+									   1);
+		data->cursor[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								   DRM_PLANE_TYPE_CURSOR);
+		data->pipe_crc[crtc->pipe] =
+			igt_crtc_crc_new(crtc,
 					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
@@ -197,10 +198,10 @@ static void test_init(data_t *data)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_pipe_crc_free(data->pipe_crc[i]);
+	for_each_crtc(display, crtc) {
+		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index bfb747bf35a4..989193d68ded 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -59,18 +59,18 @@ static void force_output_mode(struct data *d, igt_output_t *output,
 static void test_init(struct data *data)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
 	int i, n;
 	bool subvp_capable = false;
 	bool subvp_en = false;
 
-	for_each_pipe(display, i) {
-		data->pipe_id[i] = PIPE_A + i;
-		data->crtc[i] = igt_crtc_for_pipe(&data->display,
-						  data->pipe_id[i]);
-		data->primary[i] = igt_crtc_get_plane_type(data->crtc[i],
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[i] = igt_crtc_crc_new(data->crtc[i],
-						     IGT_PIPE_CRC_SOURCE_AUTO);
+	for_each_crtc(display, crtc) {
+		data->pipe_id[crtc->pipe] = crtc->pipe;
+		data->crtc[crtc->pipe] = crtc;
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->pipe] = igt_crtc_crc_new(crtc,
+							      IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0,
@@ -106,10 +106,10 @@ static void test_init(struct data *data)
 static void test_fini(struct data *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		igt_pipe_crc_free(data->pipe_crc[i]);
+	for_each_crtc(display, crtc) {
+		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
@@ -122,14 +122,14 @@ static void test_subvp(struct data *data)
 	igt_fb_t rfb;
 	bool subvp_supp, subvp_en;
 	igt_output_t *output;
-	int i;
+	igt_crtc_t *crtc;
 
 	test_init(data);
 	igt_enable_connectors(data->fd);
 
-	for_each_pipe(&data->display, i) {
+	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[i];
+		output = data->output[crtc->pipe];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
@@ -141,8 +141,8 @@ static void test_subvp(struct data *data)
 					&rfb);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
-		igt_plane_set_fb(data->primary[i], &rfb);
+				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+		igt_plane_set_fb(data->primary[crtc->pipe], &rfb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	}
 
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 646210ae653a..1ff5f9c1ce3a 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -121,16 +121,17 @@ static void test_init(data_t *data, bool physical)
 	igt_display_t *display = &data->display;
 	int i, max_pipes = igt_display_n_crtcs(display);
 	igt_output_t *output;
+	igt_crtc_t *crtc;
+
 	data->connected_outputs = 0;
 
-	for_each_pipe(display, i) {
-		data->pipe_id[i] = i;
-		data->crtc[i] = igt_crtc_for_pipe(&data->display,
-						  data->pipe_id[i]);
-		data->primary[i] = igt_crtc_get_plane_type(data->crtc[i],
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[i] =
-			igt_crtc_crc_new(data->crtc[i],
+	for_each_crtc(display, crtc) {
+		data->pipe_id[crtc->pipe] = crtc->pipe;
+		data->crtc[crtc->pipe] = crtc;
+		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
+								    DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->pipe] =
+			igt_crtc_crc_new(crtc,
 					 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
@@ -161,11 +162,11 @@ static void test_init(data_t *data, bool physical)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i;
+	igt_crtc_t *crtc;
 
-	for_each_pipe(display, i) {
-		if (data->pipe_crc[i])
-			igt_pipe_crc_free(data->pipe_crc[i]);
+	for_each_crtc(display, crtc) {
+		if (data->pipe_crc[crtc->pipe])
+			igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
 	}
 
 	igt_display_reset(display);
@@ -194,12 +195,12 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
 	int i = 0, num_pipes = 0;
-	enum pipe p;
+	igt_crtc_t *crtc;
 	int ret;
 
 	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
-	for_each_pipe(display, p) num_pipes++;
+	for_each_crtc(display, crtc) num_pipes++;
 
 	igt_skip_on_f(pipe >= num_pipes,
                       "ASIC does not have %d pipes\n", pipe + 1);
-- 
2.52.0

