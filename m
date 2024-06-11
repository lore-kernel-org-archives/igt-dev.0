Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD80C27C55
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B56E10E392;
	Tue, 11 Jun 2024 05:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVP8jYka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A3310E392
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082098; x=1749618098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQTi7IGfibXw67uyrW1QpmJiQq7NR6Bjo7fkCiwjFBo=;
 b=bVP8jYka6jJnFktoCuDF8e+j7V1GcuUOCPZo2SLT7eSKa0l2P6DNDEaN
 mzuq7ZHMbNo597n0p0kHK/+8F4JSxqgxKTk37icWv+iv3dVn6g0nDPUO2
 ekrHqPN6oFywnWZPOIJ54LHu7KqarH3W4c9FNC3MxPxUWzWYdhthi1Ygh
 YmK/s+0VknL/V4vBRTGdjftdMG4KyOwhB9hYOkAN9XUAkzxESQE2DmZ4z
 PEV0IwAOHFzmK6UyzQ3Lv6ERbO1rLzDYiuLum2y3TgFfVKv0s9ZRdZ8Uv
 Y/yVUNofBbuj59cJbSgLGG0plDQtYweEWGvp/G4t6SYf6wqfk//tUH9T/ Q==;
X-CSE-ConnectionGUID: 11QxCZLFQcS89vF2qcqwDQ==
X-CSE-MsgGUID: 22U/ANEDRWeYW0gWTOUfuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997489"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:37 -0700
X-CSE-ConnectionGUID: RQPf89cITmChRst3ziziMQ==
X-CSE-MsgGUID: UYMIzK58Tfm+DURB+3g8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981206"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:37 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
Date: Tue, 11 Jun 2024 10:23:43 +0530
Message-ID: <20240611045348.3727239-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

V2:
 - Drop igt_fixture form igt_simple_main

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pwrite_crc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 12add5da6..338c92c3a 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -125,7 +125,6 @@ static void prepare_crtc(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode;
 
-	igt_display_reset(display);
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -161,7 +160,7 @@ static void cleanup_crtc(data_t *data)
 
 	igt_plane_set_fb(data->primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
@@ -196,14 +195,14 @@ static data_t data;
 igt_simple_main
 {
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-
-	data.devid = intel_get_drm_devid(data.drm_fd);
-
 	kmstest_set_vt_graphics_mode();
 
+	igt_display_require(&data.display, data.drm_fd);
+	igt_display_require_output(&data.display);
 	igt_require_pipe_crc(data.drm_fd);
 
-	igt_display_require(&data.display, data.drm_fd);
+	data.devid = intel_get_drm_devid(data.drm_fd);
+	data.pipe_crc = NULL;
 
 	run_test(&data);
 
-- 
2.43.2

