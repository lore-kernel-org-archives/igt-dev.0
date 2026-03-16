Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD147F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D88F10E28E;
	Mon, 16 Mar 2026 08:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzfSrYK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82D10E37F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649193; x=1805185193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kZg9zMIqsZC0kIAgPkHhZ+uDw0r6COCXakPbtHjF+C8=;
 b=YzfSrYK1wVaIfNrat3pwG+3vksihtyNE9GpT8x3xI+B/P1d4L7JPoqTw
 2idIiL/oCgo1VwUc5V2SwuU4YXbPymOyN+cA8Jv4hWduz5CrIkZ6dOnHf
 c/wXUY2NF7SEZr95bRsKo72mQbxPGHMvuNW0IHMpBONT+1ey0R/9xhWb9
 6nHQzxYRnU6etQuTInbSVM4jARSkPjzEbW8jlL3Ze7/HoWY1TQ/jJzq0f
 PevS5ZZKuOPrxtk9KiHPg50oAXeHkorctbvkuv7HhO0yP6dA3zYpcDfre
 M6+khzzb5jbS1+6JAI7G5s+Io2YpmZ0Y+hE74CrZuGaJRm7auo8FPr/et Q==;
X-CSE-ConnectionGUID: QzyP1ZDnRKSTOZ8h8n1cnQ==
X-CSE-MsgGUID: m7qIiOpgQAqC8nYgwnHUow==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359459"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:52 -0700
X-CSE-ConnectionGUID: JktLcwjTTGGipROUOcuoHw==
X-CSE-MsgGUID: +7kdFeFyRai/SZdK4vGl+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300757"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:51 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 16/17] tests/kms_plane_multiple: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:20 +0530
Message-ID: <20260316084021.419580-17-sowmiya.s@intel.com>
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
Replace manual stop+free+NULL patterns with igt_pipe_crc_cleanup() in
test_fini(), test_fini_2_display() and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_plane_multiple.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index d8a32d952..062473dcb 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -122,8 +122,7 @@ static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 	/* reset the constraint on the pipe */
 	igt_output_set_crtc(output, NULL);
 
-	igt_pipe_crc_free(data->pipe_crc1);
-	data->pipe_crc1 = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc1);
 
 	free(data->plane1);
 	data->plane1 = NULL;
@@ -392,7 +391,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_pipe_crc_start(data->pipe_crc1);
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc);
-		igt_assert_crc_equal(&data->ref_crc1, &crc);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc1, &data->ref_crc1, &crc);
 		igt_pipe_crc_stop(data->pipe_crc1);
 
 		for_each_plane_on_crtc(crtc,
@@ -452,13 +451,8 @@ static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
 
 static void test_fini_2_display(data_t *data)
 {
-	igt_pipe_crc_stop(data->pipe_crc1);
-	igt_pipe_crc_stop(data->pipe_crc2);
-
-	igt_pipe_crc_free(data->pipe_crc1);
-	igt_pipe_crc_free(data->pipe_crc2);
-	data->pipe_crc1 = NULL;
-	data->pipe_crc2 = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc1);
+	igt_pipe_crc_cleanup(&data->pipe_crc2);
 
 	free(data->plane1);
 	free(data->plane2);
@@ -518,8 +512,8 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc1);
 	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2, &crc2);
 
-	igt_assert_crc_equal(&data->ref_crc1, &crc1);
-	igt_assert_crc_equal(&data->ref_crc2, &crc2);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc1, &data->ref_crc1, &crc1);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc2, &data->ref_crc2, &crc2);
 }
 
 #define for_each_connected_output_local(display, output)		\
@@ -706,6 +700,8 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc1);
+		igt_pipe_crc_cleanup(&data.pipe_crc2);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

