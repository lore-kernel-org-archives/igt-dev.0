Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA430E7717F
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 03:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0D10E183;
	Wed, 11 Dec 2024 03:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m7a2AzDv";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F96310E183
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 03:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vfYGdXkfYWp9gqcQsseJWWY2ZjpFGX1Wt+4Kummibko=; b=m7a2AzDv4WUZI4SmS4PU+Sl6e+
 iY1isOgYXNqCy6bGXXWcSDhm/gMoohJOOX9QcJB3zKsEqBZjc0aAs+0+FxN75DEwHKQ9RCCbGuHWs
 k2dGZfCRlbUL+EGgwygO1eudncDBF2mAcYikyVEe/HFrNbdstRHH9tkGQzUc+WdCegWhneoVpMi7n
 KONwrqQn9StbK0aQ5+eW2Pz0tHT+ZTp1ySYj9qB/EhhedZUEtV7C0vsfK5SUXR1K6UtAwGPg6p8K3
 FFAe77xT8sQF0ofwR/Gk7Mrb5dBdEmx5WKNuBxT/aFwI4BpwSgf4+22TX0fAW5I1q2IjrtO2p95zM
 XKfw5Pug==;
Received: from [179.118.189.35] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tLDFA-001lgN-6J; Wed, 11 Dec 2024 04:18:32 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org,
	Jeevan B <jeevan.b@intel.com>
Cc: kernel-dev@igalia.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Create subtest for overlay planes
Date: Wed, 11 Dec 2024 00:18:20 -0300
Message-ID: <20241211031820.115844-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

amdgpu can perform async flips in overlay planes as well, so create a
test for that.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 tests/kms_async_flips.c | 42 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 6e00be3de..10a416cfb 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -109,12 +109,14 @@ typedef struct {
 	uint32_t crtc_id;
 	uint32_t refresh_rate;
 	struct igt_fb bufs[NUM_FBS];
+	struct igt_fb bufs_overlay[NUM_FBS];
 	igt_display_t display;
 	igt_output_t *output;
 	unsigned long flip_timestamp_us;
 	double flip_interval;
 	uint64_t modifier;
 	igt_plane_t *plane;
+	igt_plane_t *overlay_plane;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc;
 	int flip_count;
@@ -126,6 +128,7 @@ typedef struct {
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
+	bool overlay_path;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -226,6 +229,8 @@ static void test_init(data_t *data)
 	igt_output_set_pipe(data->output, data->pipe);
 
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	if (data->overlay_path)
+		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
 }
 
 static void test_init_fbs(data_t *data)
@@ -246,16 +251,27 @@ static void test_init_fbs(data_t *data)
 		prev_modifier = data->modifier;
 
 		if (data->bufs[0].fb_id) {
-			for (i = 0; i < NUM_FBS; i++)
+			for (i = 0; i < NUM_FBS; i++) {
 				igt_remove_fb(data->drm_fd, &data->bufs[i]);
+				if (data->overlay_path)
+					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
+			}
 		}
 
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
 			make_fb(data, &data->bufs[i], width, height, i);
+			if (data->overlay_path)
+				make_fb(data, &data->bufs_overlay[i], width, height, i);
+		}
 	}
 
 	igt_plane_set_fb(data->plane, &data->bufs[0]);
 	igt_plane_set_size(data->plane, width, height);
+
+	if (data->overlay_path) {
+		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
+		igt_plane_set_size(data->overlay_plane, width, height);
+	}
 }
 
 static bool async_flip_needs_extra_frame(data_t *data)
@@ -283,12 +299,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
 static int perform_flip(data_t *data, int frame, int flags)
 {
 	int ret;
+	igt_plane_t *plane;
+	struct igt_fb *bufs;
+
+	plane = data->overlay_path ? data->overlay_plane : data->plane;
+	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
 
 	if (!data->atomic_path) {
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
+				     bufs[frame % NUM_FBS].fb_id, flags, data);
 	} else {
-		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
+		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
 		ret = igt_display_try_commit_atomic(&data->display, flags, data);
 	}
 
@@ -758,6 +779,7 @@ igt_main
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			data.alternate_sync_async = false;
 			data.atomic_path = false;
+			data.overlay_path = false;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -769,6 +791,7 @@ igt_main
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
 			data.alternate_sync_async = false;
 			data.atomic_path = true;
+			data.overlay_path = false;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -779,6 +802,7 @@ igt_main
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			data.alternate_sync_async = true;
 			data.atomic_path = false;
+			data.overlay_path = false;
 			run_test(&data, test_async_flip);
 		}
 
@@ -786,7 +810,17 @@ igt_main
 		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
 			data.alternate_sync_async = true;
 			data.atomic_path = true;
+			data.overlay_path = false;
+			run_test(&data, test_async_flip);
+		}
+
+		igt_describe("Verify overlay planes with async flips in atomic API");
+		igt_subtest_with_dynamic("overlay-atomic") {
+			igt_require(is_amdgpu_device(data.drm_fd));
+			data.atomic_path = true;
+			data.overlay_path = true;
 			run_test(&data, test_async_flip);
+			data.overlay_path = false;
 		}
 
 		igt_describe("Verify that the async flip timestamp does not "
-- 
2.47.1

