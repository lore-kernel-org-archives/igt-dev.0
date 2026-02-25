Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFDEFD239
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 09:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745510E72C;
	Wed, 25 Feb 2026 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="cFOkaZ6w";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDEA10E72C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772012578;
 bh=IWTFxaQuf74bFZG5ykfkiZVNHQc2vG47VU0HRUWv7Q0=;
 h=From:To:Cc:Subject:Date:From;
 b=cFOkaZ6wUqjK0J4x8nSa1HgehKHqJeWU9ZEqc44UaeWw2XSD9LiV1F+BXrpHzhG1i
 bMai4vhXUXikbqbm8YCtc78v7JLeWXIV7P9MAmutvR2yoVdksW/wfB5f3ptLezigTD
 Iy0CszvGstYG7EDA5ADQdLfFhVwI2MK06g/IC4r8KqvTMcHNLI9WxBO19W3hTTqL/u
 7wUhcogy+Wu8Z1Q9usFwy1O5eb2rm+6WB9ZQoOdQf1n31B67qxRPLLkY+AgAqmoTQp
 yYF5CSSwDJnLsNDKVQVIbLesxTP1V3UzRee/8VoWpfO5fUuEpVkm/OoDFMgP0iULV+
 PcCShR/4S32hQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t] tests/intel/xe_module_load: Add subtest to test with
 active fd teardown
Date: Wed, 25 Feb 2026 10:42:56 +0100
Message-ID: <20260225094255.10335-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

Create an evil testcase to ensure we also unload when the device is
still sort of active.

igt_create_fb will create a framebuffer and probably a backing BO,
while I also saw a crash related to property blobs.

This tests that we can teardown with buffer objects,
property blobs and framebuffers on the list.

There should probably be another test for a VM and engine too,
but this should be enough for a first attempt.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 tests/intel/xe_module_load.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 0c75c4ebc1..4be7b44482 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -91,6 +91,27 @@ static void load_and_check_xe(const char *opts)
 	drm_close_driver(drm_fd);
 }
 
+static void display_opened_unload(void)
+{
+	igt_display_t display;
+	int drm_fd;
+	struct igt_fb fb;
+	uint32_t blob_id;
+
+	/* drm_open_driver loads xe module if needed */
+	drm_fd = drm_open_driver(DRIVER_XE);
+	igt_display_require(&display, drm_fd);
+
+	/* Create a property blob and a FB, hopefully with a separate backing BO */
+	igt_create_fb(drm_fd, 640, 480, DRM_FORMAT_XRGB8888, 0, &fb);
+	igt_assert_eq(0, drmModeCreatePropertyBlob(drm_fd, &fb, sizeof(fb), &blob_id));
+
+	/* Unbind, close, unload, check for booms */
+	igt_kmod_unbind("xe", NULL);
+	drm_close_driver(drm_fd);
+	igt_xe_driver_unload();
+}
+
 static const char * const unwanted_drivers[] = {
 	"xe",
 	"i915",
@@ -107,6 +128,9 @@ static const char * const unwanted_drivers[] = {
  * SUBTEST: unload
  * Description: Unload the Xe driver
  *
+ * SUBTEST: display-opened-unload
+ * Description: Test behavior of xe driver unloading while fd is still opened.
+ *
  * SUBTEST: reload
  * Description: Reload the Xe driver
  *
@@ -132,6 +156,10 @@ int igt_main()
 		igt_xe_driver_unload();
 	}
 
+	igt_subtest("display-opened-unload") {
+		display_opened_unload();
+	}
+
 	igt_subtest("force-load") {
 		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
 			igt_intel_driver_unload(unwanted_drivers[i]);
-- 
2.51.0

