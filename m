Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0619C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F6510E486;
	Mon, 10 Jun 2024 16:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hb/HCx59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2010E486
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037771; x=1749573771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rnOYPNWts/D/lnkKdH8WlWU5LH0a/ndPma/YwUeDTpA=;
 b=Hb/HCx594HeWe/0UEtMRJBx0qh6HnVA8lH2g5wBlqD8ubBjqkiXkED+L
 EAk3A7PF+KNX23FWoRgLvU/el8mGHmFItBCm7ATA9bsEYyAV10dBTICh0
 m0IxEJ+ie6cgjKB5wPSYPk0neiAxKDZ0+ocg4Ou7K8qKNuky7f6WAP+qg
 rvbAVbj8ghvQuhvkMP+5VApBdQ7DOdq3VwFN4ZmffRwc1LDHHwg07bGzw
 a9UBXNL/wk3N+Txgvcj4SJ8yxCpHT4ln48/k2HCmQzvRVAJzgzl8Dv2Om
 astMNtI1Pg6fdLQz+demjMpgthItdIeAHBm5oZ0FgQ32zQw+4pWLtt+72 Q==;
X-CSE-ConnectionGUID: NxjLLbZ7TjqBcgPTBdiNYg==
X-CSE-MsgGUID: sTInx1K8SD2NlM6Nh0i5UA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819697"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:51 -0700
X-CSE-ConnectionGUID: EySI4nBiQgSzdhQgyDm9bw==
X-CSE-MsgGUID: K6MoRYtsSeaSvJ4bN6MFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681334"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:50 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/9] tests/intel/kms_pwrite_crc: Test cleanup
Date: Mon, 10 Jun 2024 22:04:51 +0530
Message-ID: <20240610163457.3711476-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pwrite_crc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 12add5da6..c6e4a29fa 100644
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
@@ -195,18 +194,22 @@ static data_t data;
 
 igt_simple_main
 {
-	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		kmstest_set_vt_graphics_mode();
 
-	data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.drm_fd);
 
-	kmstest_set_vt_graphics_mode();
-
-	igt_require_pipe_crc(data.drm_fd);
-
-	igt_display_require(&data.display, data.drm_fd);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.pipe_crc = NULL;
+	}
 
 	run_test(&data);
 
-	igt_display_fini(&data.display);
-	drm_close_driver(data.drm_fd);
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
 }
-- 
2.43.2

