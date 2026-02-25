Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50DBFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C210E355;
	Wed, 25 Feb 2026 12:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esboBCxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40110E355
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023879; x=1803559879;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8we//IKyzMavs58Iv3xe/ZBbxgSDKtZ8hFqThOAIhII=;
 b=esboBCxHSGmBtp38JSi4vrWvo7M7kzErqfGUruFfhHMRIf1iupykXez3
 zbrT1wF+TkMJA8A/Ol6NyL/gvuAwjfST8ToLM9M0aZt5BQmabXDW1UUQ/
 t4AG17aYpHv3noF4KtFdB6bC72l9asHkp6wrrjta/4b8gPL0lI5aUNOI4
 t3MctGAGyUZbTsAFY5FQfW4rGQTjRJm2iAcjnsHajLufliw4zsc362An7
 rCOXOvKeQrIPSKkUMO3VTUHX2zc3FbzvdLdUrG9Eo7a44I4qUYIX+ywcw
 EhQ5ZWOwaVqNDeZDDtmclWFPQ+VJ/rb7M50IhG00oKN56Sr00k9bm9MsQ A==;
X-CSE-ConnectionGUID: b0NZgQm9RNeaY0IATYAstg==
X-CSE-MsgGUID: OspiCvqMQpi5tZWjzNXVnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73102102"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73102102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:19 -0800
X-CSE-ConnectionGUID: w83PoPirS8SksbG94yBDRw==
X-CSE-MsgGUID: 0nHZPjwQRcabK8nF0X7zVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215451450"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:17 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/19] tests/kms_async_flips: Remove redundant
 data.crtc_id
Date: Wed, 25 Feb 2026 14:50:51 +0200
Message-ID: <20260225125108.31119-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

kms_async_flips already tacks the entire crtc as data.crtc.
data.crtc_id is completely redundant, and just serves to
confuse things. Get rid of it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 014b7f3476be..53990917c9e4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -124,7 +124,6 @@ IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
 
 typedef struct {
 	int drm_fd;
-	uint32_t crtc_id;
 	uint32_t refresh_rate;
 	struct igt_fb bufs[NUM_FBS];
 	struct igt_fb bufs_overlay[NUM_FBS];
@@ -299,11 +298,9 @@ static void test_init(data_t *data)
 
 	mode = igt_output_get_mode(data->output);
 
-	data->crtc_id = data->crtc->crtc_id;
 	data->refresh_rate = mode->vrefresh;
 
-	igt_output_set_crtc(data->output,
-		            data->crtc);
+	igt_output_set_crtc(data->output, data->crtc);
 
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	if (data->overlay_path)
@@ -398,7 +395,7 @@ static int perform_flip(data_t *data, int frame, int flags)
 	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
 
 	if (!data->atomic_path) {
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+		ret = drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
 				     bufs[frame % NUM_FBS].fb_id, flags, data);
 	} else {
 		igt_plane_set_fb(plane, &bufs[frame % NUM_FBS]);
@@ -555,9 +552,8 @@ static void test_async_flip(data_t *data)
 
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
-	int crtc_index = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
-		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc_index),
+		.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(data->crtc->crtc_index),
 		.request.sequence = 1,
 	};
 
@@ -581,7 +577,7 @@ static void test_timestamp(data_t *data)
 	 * So flip timestamp can be verified only from the second flip.
 	 * The first async flip just enables the async address update.
 	 */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+	ret = drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
 			      data->bufs[0].fb_id,
 			      flags, data);
 
@@ -591,7 +587,7 @@ static void test_timestamp(data_t *data)
 
 	wait_for_vblank(data, &vbl_time, &seq);
 
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+	ret = drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
 			      data->bufs[0].fb_id,
 			      flags, data);
 
@@ -639,7 +635,7 @@ static void test_cursor(data_t *data)
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
 	cur.flags = DRM_MODE_CURSOR_BO;
-	cur.crtc_id = data->crtc_id;
+	cur.crtc_id = data->crtc->crtc_id;
 	cur.width = width;
 	cur.height = height;
 	cur.handle = cursor_fb.gem_handle;
@@ -700,13 +696,13 @@ static void test_invalid(data_t *data)
 	 */
 	if (!data->atomic_path) {
 		/* first async flip is expected to allow modifier changes */
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flags, data);
+		ret = drmModePageFlip(data->drm_fd, data->crtc->crtc_id, fb[1].fb_id, flags, data);
 		igt_assert_eq(ret, 0);
 
 		wait_flip_event(data);
 
 		/* subsequent async flips should reject modifier changes */
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flags, data);
+		ret = drmModePageFlip(data->drm_fd, data->crtc->crtc_id, fb[0].fb_id, flags, data);
 		igt_assert(ret == -EINVAL);
 	} else {
 		igt_plane_set_fb(data->plane, &fb[1]);
@@ -728,10 +724,9 @@ static void test_invalid(data_t *data)
 
 static void queue_vblank(data_t *data)
 {
-	int crtc_index = kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
 		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
-			kmstest_get_vbl_flag(crtc_index),
+			kmstest_get_vbl_flag(data->crtc->crtc_index),
 		.request.sequence = 1,
 		.request.signal = (long)data,
 	};
@@ -827,7 +822,6 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
 
 static void test_crc(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	unsigned int frame = 0;
 	unsigned int start;
 	int ret, width, height;
@@ -847,12 +841,11 @@ static void test_crc(data_t *data)
 	paint_fb(data, &data->bufs[frame], width, height, 0xff0000ff);
 	paint_fb(data, &data->bufs[!frame], width, height, 0xff0000ff);
 
-	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
+	ret = drmModeSetCrtc(data->drm_fd, data->crtc->crtc_id, data->bufs[frame].fb_id, 0, 0,
 			     &data->output->config.connector->connector_id, 1, mode);
 	igt_assert_eq(ret, 0);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id)),
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_crtc_crc_new(data->crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
-- 
2.52.0

