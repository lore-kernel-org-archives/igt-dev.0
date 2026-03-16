Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA14EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347A810E28E;
	Mon, 16 Mar 2026 08:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/wgA+h9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED3510E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649171; x=1805185171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ZK3aleOqQvFJk9NpK++exdYj9IT3L3HQosuGC+gzc8=;
 b=e/wgA+h9iRaAQhW8we2Pp2pd3zsnNsOjPZtXMa2gCYk5yvd/W6SAglDh
 RA04Ff2MiK2TXqzvzwEjYwrqky+gTRF3URgaI43fKRlQss2dc+S73O5I9
 4OF3D3SEelwsnr4pi8vhA86aLKu7BNia75evo0wWy2bRxDFZZT1BqHXYB
 xFaA5p2rVnGmUm02taMkySxQxYb1O9f2X9N2E8w0Y+MNeCcUGrkyKcL6y
 yHHFCVzZRcAMmdQtoQLOKHXv4FQjWS62uGhrGgsK48NgkymIpVzw+avr4
 4+Fj5sASbnS+SY9RxEHWRWkJ87Vr/QRe1Dh8oXmmS4bfLaBauWr8Zt3QB w==;
X-CSE-ConnectionGUID: u2UIIiwxRNW6T0+/yjRIOA==
X-CSE-MsgGUID: rrwbPDrdRIGzlyVlUeZxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359388"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:31 -0700
X-CSE-ConnectionGUID: X04bgZW2SgyC/jXBn7Ibuw==
X-CSE-MsgGUID: MP0YdwdKR62nA69eHdl26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300626"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:30 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 04/17] tests/intel/kms_flip_scaled_crc: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:08 +0530
Message-ID: <20260316084021.419580-5-sowmiya.s@intel.com>
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
Replace manual stop+free+NULL patterns with igt_pipe_crc_cleanup()
in test function and fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 18e7b4b5a..0e0026266 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -773,10 +773,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	set_lut(data, crtc);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	if (data->pipe_crc) {
-		igt_pipe_crc_stop(data->pipe_crc);
-		igt_pipe_crc_free(data->pipe_crc);
-	}
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -819,11 +816,9 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &big_crc);
-	igt_assert_crc_equal(&small_crc, &big_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &small_crc, &big_crc);
 
-	igt_pipe_crc_stop(data->pipe_crc);
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 
 	clear_lut(data, crtc);
 
@@ -963,11 +958,7 @@ int igt_main()
 
 	igt_fixture() {
 		free_fbs(&data);
-		if (data.pipe_crc) {
-			igt_pipe_crc_stop(data.pipe_crc);
-			igt_pipe_crc_free(data.pipe_crc);
-			data.pipe_crc = NULL;
-		}
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		kmstest_set_vt_text_mode();
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

