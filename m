Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D65FC27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 08:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26D010E18A;
	Fri, 14 Jun 2024 08:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj7P1rr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F2010EC94
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718353069; x=1749889069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+Ux8AvDeSHSGX+97aXjLxO72uHKC8URHgJae2uTiOM=;
 b=Hj7P1rr01jqjdHJ71byI3vr1wFDSLj8ofAm2PX7eN6YaDhF1Cnl3M93p
 BGYO1p1Z9Rblp1oPDKUJqmNhH2cZzYUeDOh6miRJHzVW5Il3mAku7QaEt
 7PdIPnEfI3pCFaXQmtMC4ElFpDSSqSBOgsMdXoj1oeIfPrHZKt0n2rtEn
 RoftB9a7APDw8nrsnM02caqmwAnIc/trvDGEfpsC/K3w3joOCRb0rIrwD
 O+pyxAyZdaykgQu2r7+9ls7U/OJ5wn76oaN0iXqfiUURVievH2Pi8fu0b
 xSQg8RJnzU6T05p5Vt8ZVhzgDtBZYkZRXyG3XbmE9WBq/HCvnaq+AgPx2 g==;
X-CSE-ConnectionGUID: xPKbST+CT1yeCNRiQEdXkw==
X-CSE-MsgGUID: WeWveFy/T9C3uO9TIgZ34Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25902571"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="25902571"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:17:49 -0700
X-CSE-ConnectionGUID: O3iXYCHeSmyKR4TxwAWh5w==
X-CSE-MsgGUID: fCF7jzb9QlGu+0ooukp3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40921793"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:17:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V2 5/8] tests/kms_tiled_display: Test cleanup
Date: Fri, 14 Jun 2024 13:39:58 +0530
Message-ID: <20240614080958.3869795-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-6-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-6-bhanuprakash.modem@intel.com>
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

V2: - Drop few complex fixes

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_tiled_display.c | 77 +++++++++++++++------------------------
 1 file changed, 30 insertions(+), 47 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 3ffd6a9a4..2c9d63799 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -79,7 +79,6 @@ typedef struct {
 	igt_fb_t fb_test_pattern;
 	igt_display_t display;
 	data_connector_t *conns;
-	enum igt_commit_style commit;
 	struct timeval first_ts;
 	int linetime_us;
 
@@ -188,23 +187,10 @@ reset_plane(igt_output_t *output)
 	igt_plane_set_fb(primary, NULL);
 }
 
-static void reset_output(igt_output_t *output)
-{
-	igt_output_set_pipe(output, PIPE_NONE);
-}
-
 static void reset_mode(data_t *data)
 {
-	int count;
-	igt_output_t *output;
-	data_connector_t *conns = data->conns;
-
-	for (count = 0; count < data->num_h_tiles; count++) {
-		output = igt_output_from_connector(&data->display,
-						   conns[count].connector);
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
-	igt_display_commit2(&data->display, data->commit);
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void test_cleanup(data_t *data)
@@ -215,11 +201,11 @@ static void test_cleanup(data_t *data)
 	for (count = 0; count < data->num_h_tiles; count++) {
 		if (conns[count].output) {
 			reset_plane(conns[count].output);
-			reset_output(conns[count].output);
+			igt_output_set_pipe(conns[count].output, PIPE_NONE);
 		}
 	}
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
-	igt_display_commit2(&data->display, data->commit);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
 }
 
@@ -529,7 +515,6 @@ static void override_edid(data_t *data)
 	igt_output_t *output;
 	int num_outputs = 0;
 	int num_tiles = 0;
-	drmModeResPtr res;
 
 	igt_require(data->display.n_pipes >= 2);
 
@@ -551,10 +536,7 @@ static void override_edid(data_t *data)
 	num_tiles = min(num_outputs, data->display.n_pipes);
 
 	/* disable everything so that we are sure to get a full modeset */
-	res = drmModeGetResources(data->drm_fd);
-	igt_require(res);
-	kmstest_unset_all_crtcs(data->drm_fd, res);
-	drmModeFreeResources(res);
+	igt_display_reset(&data->display);
 
 	for (int i = 0; i < num_tiles; i++)
 		force_edid_with_tile(data, outputs[i],
@@ -563,28 +545,28 @@ static void override_edid(data_t *data)
 
 static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
 {
-		int ret;
-
-		get_number_of_h_tiles(data);
-		igt_debug("Number of Horizontal Tiles: %d\n",
-			  data->num_h_tiles);
-		igt_require(data->num_h_tiles > 0);
-		data->conns = calloc(data->num_h_tiles,
-				     sizeof(data_connector_t));
-		igt_assert(data->conns);
-
-		get_connectors(data);
-		setup_mode(data);
-		setup_framebuffer(data);
-		timerclear(&data->first_ts);
-		igt_display_commit_atomic(&data->display,
-			DRM_MODE_ATOMIC_NONBLOCK |
-			DRM_MODE_PAGE_FLIP_EVENT, data);
-		while (!got_all_page_flips(data)) {
-			ret = poll(pfd, 1, 1000);
-			igt_assert(ret == 1);
-			drmHandleEvent(data->drm_fd, drm_event);
-		}
+	int ret;
+
+	get_number_of_h_tiles(data);
+	igt_debug("Number of Horizontal Tiles: %d\n",
+		  data->num_h_tiles);
+	igt_require(data->num_h_tiles > 0);
+	data->conns = calloc(data->num_h_tiles,
+			     sizeof(data_connector_t));
+	igt_assert(data->conns);
+
+	get_connectors(data);
+	setup_mode(data);
+	setup_framebuffer(data);
+	timerclear(&data->first_ts);
+	igt_display_commit_atomic(&data->display,
+		DRM_MODE_ATOMIC_NONBLOCK |
+		DRM_MODE_PAGE_FLIP_EVENT, data);
+	while (!got_all_page_flips(data)) {
+		ret = poll(pfd, 1, 1000);
+		igt_assert(ret == 1);
+		drmHandleEvent(data->drm_fd, drm_event);
+	}
 }
 
 igt_main
@@ -596,14 +578,15 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+
 		igt_display_reset(&data.display);
 
 		pfd.fd = data.drm_fd;
 		pfd.events = POLLIN;
 		drm_event.version = 3;
 		drm_event.page_flip_handler2 = page_flip_handler;
-		data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
-		igt_require(data.commit == COMMIT_ATOMIC);
 
 		get_number_of_h_tiles(&data);
 		igt_debug("Number of real horizontal tiles: %d\n", data.num_h_tiles);
-- 
2.43.2

