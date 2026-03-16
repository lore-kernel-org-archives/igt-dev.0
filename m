Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D7EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C946D10E2F2;
	Mon, 16 Mar 2026 08:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6mED66B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC1910E4AB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649187; x=1805185187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oxJaVCJjQDED82uI+WWMyU7nqpeViSwpyjxEglJJI/s=;
 b=h6mED66BqDRLcxuQJIzPp9qYHMX2mq3UmSiNAWDQb0TpdjhBPCRaeDyK
 3yZzAZ3kRKTnaxE2OHoal8jf3KVMJ2uJ+bmypAdhWNclQSTQ2vkMIGOMX
 eWkbYr/VeVni8q2iuQaCYZ3dSFqtlKH/eNlUtSBxON9y1+dLez8lP9zJO
 t3n2hq2j0UQuofkE3MpOssL+ctWZnwC4u1lG3ZaZYYOObg+2V9m3TI8HQ
 TMB4uN2PrOAkingm3nOg2v/zTcO9JGS3wMmL5ElL7289QAgvctIdyWsXy
 R6FBJHq1xXtX8r1kIDc3C0l++62JVFvOZlVWtPE6CuOGFf2OjugpOCsto A==;
X-CSE-ConnectionGUID: AA+DCkUSTVmWOuzVYHZKQg==
X-CSE-MsgGUID: ymBvx38UQ2+A1r/RV6JElg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359446"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:47 -0700
X-CSE-ConnectionGUID: 5qIkiAWSQ1efBy8tDB6AMA==
X-CSE-MsgGUID: uHKLhHRsSq+pKH3dqrcOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300724"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:46 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 13/17] tests/kms_plane: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:17 +0530
Message-ID: <20260316084021.419580-14-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
MIME-Version: 1.0
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Replace manual free+NULL patterns with igt_pipe_crc_cleanup() in
test_init(), test_fini(), test_planar_settings() and fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_plane.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d9cd04e6a..3ebb7f87d 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -148,8 +148,7 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
 static void test_init(data_t *data, igt_crtc_t *crtc)
 {
 	igt_require(crtc->n_planes > 0);
-	if (data->pipe_crc)
-		igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
@@ -157,8 +156,7 @@ static void test_init(data_t *data, igt_crtc_t *crtc)
 
 static void test_fini(data_t *data)
 {
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 }
 
 enum {
@@ -360,7 +358,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_wait_for_vblank(crtc);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(reference_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, reference_crc, &crc);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(data->drm_fd,
@@ -373,7 +371,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc2);
 
-	igt_assert_crc_equal(&crc, &crc2);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &crc2);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_fb(sprite, NULL);
@@ -486,7 +484,7 @@ test_plane_panning_with_output(data_t *data, igt_crtc_t *crtc,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
-	igt_assert_crc_equal(ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, ref_crc, &crc);
 
 	igt_plane_set_fb(primary, NULL);
 
@@ -1500,11 +1498,9 @@ static void test_planar_settings(data_t *data)
 				       crtc,
 				       0xffff);
 
-			igt_pipe_crc_free(data->pipe_crc);
-			data->pipe_crc = NULL;
-
 			igt_remove_fb(data->drm_fd, &fb_ref);
-			igt_assert_crc_equal(&crc_ref, &crc);
+			igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc_ref, &crc);
+			igt_pipe_crc_cleanup(&data->pipe_crc);
 		}
 
 		igt_remove_fb(data->drm_fd, &fb);
@@ -1667,6 +1663,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 	run_tests_for_pipe_plane(&data);
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

