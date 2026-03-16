Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7020EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEC410E28E;
	Mon, 16 Mar 2026 08:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig2BbQ12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EB210E4A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649185; x=1805185185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5GjCrfQTw0mWGFTQlQyWssd1hVpQt3vt7Gka5pEpNdU=;
 b=ig2BbQ12a3KpUnTvlD/FVhv3CO3CMeS0r3DDbS+1ZBjtTmMr8CDiMi1D
 mlahGCrNKB969df+THxUZ0spCkZkSAolOJZWiAVT5dP1tBlRNe7oKcwK2
 kwfWhlQ6s60JfKqqtxMUrJm8fuT70+cpxB4aAalhGcxMq/exdTnT4jpAW
 Npq39Smy7QBnyGAoSwttQdIl/QvTpxNL1Y7uKiK3ry9o5dMYkzoamdiJS
 TqoekzKXeUhI1TTuJg9wXoostPZxjaBAFu3fpIBDp6Qjj8SG1Z05hp8R6
 jp6ahNVWZhIvCkQsujZgVftm0sM0aHNjWMGoKKVBp2YIMtEPkOx/s/Vib Q==;
X-CSE-ConnectionGUID: 3O6LuTFiRv6xEmehHaqaww==
X-CSE-MsgGUID: 15wb9B7aQH2Ox4qJ2aDq4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359442"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:45 -0700
X-CSE-ConnectionGUID: J6VDMv0cTPqQJjllMUUTlw==
X-CSE-MsgGUID: ztV425VZShqEDeAMk3Igcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300714"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:44 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 12/17] tests/kms_pipe_crc_basic: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:16 +0530
Message-ID: <20260316084021.419580-13-sowmiya.s@intel.com>
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
Replace manual stop+free with igt_pipe_crc_cleanup() in test_read_crc(),
test_compare_crc() and test_disable_crc_after_crtc().
Remove now-redundant igt_require_pipe_crc() call from fixture setup.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_pipe_crc_basic.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e141545..f9164fd57 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -175,8 +175,7 @@ static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 			igt_wait_for_vblank_count(crtc,
 						  N_CRCS);
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS+1, &crcs);
-			igt_pipe_crc_stop(pipe_crc);
-			igt_pipe_crc_free(pipe_crc);
+			igt_pipe_crc_cleanup(&pipe_crc);
 
 			/* allow a one frame difference */
 			igt_assert_lte(N_CRCS, n_crcs);
@@ -189,8 +188,7 @@ static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
 
-			igt_pipe_crc_stop(pipe_crc);
-			igt_pipe_crc_free(pipe_crc);
+			igt_pipe_crc_cleanup(&pipe_crc);
 
 			igt_assert_eq(n_crcs, N_CRCS);
 		}
@@ -278,10 +276,10 @@ static void test_compare_crc(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit(display);
 
 	igt_pipe_crc_collect_crc(pipe_crc, &crc);
-	igt_assert_crc_equal(&crc, &ref_crc);
+	igt_assert_crc_equal_stop_on_fail(pipe_crc, &crc, &ref_crc);
 
 	/* Clean-up */
-	igt_pipe_crc_free(pipe_crc);
+	igt_pipe_crc_cleanup(&pipe_crc);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
@@ -326,10 +324,10 @@ static void test_disable_crc_after_crtc(data_t *data, igt_crtc_t *crtc,
 	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
 				   DRM_MODE_DPMS_ON);
 	igt_pipe_crc_collect_crc(pipe_crc, &crc[1]);
-	igt_assert_crc_equal(&crc[0], &crc[1]);
+	igt_assert_crc_equal_stop_on_fail(pipe_crc, &crc[0], &crc[1]);
 
 	/* Clean-up */
-	igt_pipe_crc_free(pipe_crc);
+	igt_pipe_crc_cleanup(&pipe_crc);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
 	igt_display_commit(display);
@@ -403,7 +401,6 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		igt_require_pipe_crc(data.drm_fd);
 
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 
-- 
2.43.0

