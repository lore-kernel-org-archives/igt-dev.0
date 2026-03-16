Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE36F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5533F10E2F2;
	Mon, 16 Mar 2026 08:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3pv/f+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B8510E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649173; x=1805185173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZ/GUI7IQkjjUR/K40U1WReyyH8QZ5TFW1fkkyHUPUw=;
 b=F3pv/f+908y/Xh36mdVZuAUiM2kxakO1BolwsR3A62fJdL5GRioOu7jF
 4SGfmTkwbCtAuO1I69nEzrJIQvXOXNBC7CKhgOgFFUc3luDX3Qh+//2TU
 OZP6Cn6C181dEGRhQrYfipqKDsBTzZVqfCVbD6OCF639N2n3at6NHqt9r
 dyz6jA8XYZGSsJKrlYFtzC2nJi/ChHAk1fxVAEA4fBMjhchmXrNw76xVg
 2OxSEinhBL/GULKY3NZyWpAHkmgO8baTHiNtMVVufDggXTKPV7JIOLNxS
 LoJ8y32VL0h8o6AdNHT+/wF4wHIgeKbyCbay+iaADwbi0U2XoEgE44OdZ w==;
X-CSE-ConnectionGUID: iH9WDbanRA6Z4Xp1t5Kt0w==
X-CSE-MsgGUID: xK7L/BP3Qb2tfHQc8jhMxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359403"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:33 -0700
X-CSE-ConnectionGUID: lE5W30RBTjulRQ/hTzJ/pQ==
X-CSE-MsgGUID: qau7pJChSsehDtG7KQMTnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300638"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:32 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 05/17] tests/intel/kms_flip_tiling: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:09 +0530
Message-ID: <20260316084021.419580-6-sowmiya.s@intel.com>
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
Replace local pipe_crc_free() helper and manual free+NULL patterns
with igt_pipe_crc_cleanup() in test_cleanup(), error path and fixture
teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_flip_tiling.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index b732cd55c..2fbd7d67f 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -57,16 +57,6 @@ typedef struct {
 	bool flipevent_in_queue; // if test fails may need to handle rogue event
 } data_t;
 
-static void pipe_crc_free(data_t *data)
-{
-	if (!data->pipe_crc)
-		return;
-
-	igt_pipe_crc_stop(data->pipe_crc);
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
-}
-
 static void crtc_crc_new(data_t *data, igt_crtc_t *crtc)
 {
 	if (data->pipe_crc)
@@ -163,7 +153,7 @@ test_flip_tiling(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 
 	/* Get a crc and compare with the reference. */
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&reference_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &reference_crc, &crc);
 
 	igt_remove_fb(data->drm_fd, &data->old_fb[0]);
 	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
@@ -176,7 +166,7 @@ static void test_cleanup(data_t *data, igt_output_t *output)
 
 	/* Clean up. */
 	igt_plane_set_fb(primary, NULL);
-	pipe_crc_free(data);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	igt_output_set_crtc(output, NULL);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
@@ -233,7 +223,7 @@ int igt_main()
 			igt_plane_t *plane;
 
 			igt_display_reset(&data.display);
-			pipe_crc_free(&data);
+			igt_pipe_crc_cleanup(&data.pipe_crc);
 
 			igt_output_set_crtc(output,
 					    crtc);
@@ -279,6 +269,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

