Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F44D25B5E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6180810E6DD;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AXyBJFMv";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C210E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2BDB14E422F2;
 Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 022076071F;
 Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12DD5119A8813; Wed, 28 Jan 2026 14:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cACwSlEXSqAm8gQ+d7qOeYuXppQJrscyrLP0+nX9ty0=;
 b=AXyBJFMvDPE/HlW4n+5zn/aTm9kZ5cs7hUDN9jHapWydGPX09nc8xm5wM3aIotYUhsmbBL
 3RgwwgUnwcQ88VAeKgihtSfS5vKgDqPB1dxl0s0wxAHgvMukHH1V4Or1lFqi/YahocRRRT
 bitODpkcEhRlc8UqlMmEJ9z04WhmMXGyCu/mRB88/qQyOFdmn7f43FXr67o08vFEUWRJx9
 rhPC1XkthsT27Ryp2fFrAQ2LtxoIxLRacCTxbVDMROETVXWbzOw/TgrZAlT5r8NHTkrcZU
 5uc4M87/akLu6azNK40HrCLI/Y0cUu8hw+tHecMoTh6PQHnXQVuCnjHShDajgg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:19 +0100
Subject: [PATCH i-g-t v5 48/48] tests/unigraf/unigraf_lt: Add test for link
 training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-48-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6383;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FgFNbAoDCrJBhsoHnT24xrSYd/gD7LyTnivQD7K4laI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvOQgbT8rUvvIKcapbsDEHrQmV1GCwFU3qHd
 JBXdkHORtWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKI3g//WaVsbORgutAhxybLWVWvOUPnv+rsCpI
 Kh+gHEB767nBaGtlOG6bjJDqO/9v9m3mK/DFl2Qizg1+RQ7RTiMm0jZJDIVRI5E48rGhKnFzUSV
 CePpqc9fTacqDc5/N0Ln4S/QyGQcsxME1LkG8hxh30y1clO1qHMX0EYQa4UtZWD/x/FaFmKimdm
 uJh49iCH1QyOZeu0jwbTesOPzHvxJwUY6Wz7rdXi8SHrOcuWXWt1cj7f8DonPVq1kRdFfOiMb+A
 ia4XgM89t7u18NIo6Rm+mI1BFKh9+fPWm4I8TrCXPkUwc84CrcZCln+Dl1PZCuM8JGU/b81ef9a
 A3bNqnuhmmFN0UcQWDmMscuS08FYeDzn74YQG3NyHpRD8lxAfBs+AwAxiYjnAybA0Ol9bthFcS7
 tse6MknlFbFiZ4TnaEt/EuYneOmoSNMcG41dJ37xSa7CvCNPQgx8tdBqlgp39kyLaYyoUnwv8Cd
 8ezpWBczoKlYSv/UgZeqLAWM9qKq6k010W9S3vMnXqXZj11LW/5yRqz7QAVvbAy6XDmgZC1WKGc
 67Md/os9N9ujoVy2C2pMPey+KEKsExJuDzV2h8Xrjj4nTFoCzhjNuhbBXF+LhpkfppHRu0cmlEy
 bzfhQ9Twy9akhvuTZ4enAG8aDfDbgeNH5MxssDxVBHDEZTWGyefI=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

To test link trianing on various situation, add multiple link
training scenarios.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/unigraf/meson.build  |   1 +
 tests/unigraf/unigraf_lt.c | 178 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+)

diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
index 4ef8c32151e4..22e64c0f389d 100644
--- a/tests/unigraf/meson.build
+++ b/tests/unigraf/meson.build
@@ -1,5 +1,6 @@
 unigraf_progs = [
 	'unigraf_connectivity',
+	'unigraf_lt',
 ]
 
 foreach prog : unigraf_progs
diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
new file mode 100644
index 000000000000..ad3f3f91ec3c
--- /dev/null
+++ b/tests/unigraf/unigraf_lt.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: MIT
+
+#include <stdint.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <xf86drm.h>
+#include <xf86drmMode.h>
+
+#include "drm_fourcc.h"
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_dp.h"
+#include "igt_edid.h"
+#include "igt_kms.h"
+#include "unigraf/unigraf.h"
+
+/**
+ * TEST: unigraf link training
+ * Category: Core
+ * Description: Testing DP link training with a unigraf device
+ *
+ * SUBTEST: unigraf-dp-lane-count
+ * Description: Make sure that the link training goes well for different lane count
+ *
+ * SUBTEST: unigraf-dp-link-rate
+ * Description: Make sure that the link training goes well for different link rates
+ */
+
+static void init_output_and_display_pattern(igt_display_t *display, igt_output_t *output)
+{
+	enum pipe pipe;
+	struct igt_fb fb;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int fb_id;
+
+	igt_modeset_disable_all_outputs(display);
+	igt_display_reset(display);
+
+	igt_output_set_crtc(output, 0);
+
+	pipe = igt_get_pipe_for_output(display, output);
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+
+	/* Get the current mode */
+	mode = igt_output_get_mode(output);
+	igt_assert(mode);
+
+	/* Create a framebuffer with a solid color pattern */
+	fb_id = igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
+					    mode->vdisplay, DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR, 0, 0, 0, &fb);
+	igt_assert(fb_id > 0);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_assert(primary);
+
+	igt_plane_set_size(primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, &fb);
+	igt_output_override_mode(output, mode);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* Set the framebuffer to the plane */
+	igt_plane_set_fb(primary, &fb);
+
+	/* Set the plane properties atomically */
+	igt_plane_set_prop_value(primary, IGT_PLANE_FB_ID, fb.fb_id);
+	igt_plane_set_prop_value(primary, IGT_PLANE_CRTC_X, 0);
+	igt_plane_set_prop_value(primary, IGT_PLANE_CRTC_Y, 0);
+	igt_plane_set_prop_value(primary, IGT_PLANE_CRTC_W, mode->hdisplay);
+	igt_plane_set_prop_value(primary, IGT_PLANE_CRTC_H, mode->vdisplay);
+
+	/* Commit the changes atomically */
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+IGT_TEST_DESCRIPTION("Test unigraf device functionality");
+int igt_main()
+{
+	int drm_fd = -1;
+	igt_display_t display;
+	igt_output_t *output;
+	drmModeConnectorPtr connector;
+	int i;
+
+	igt_fixture() {
+		drm_fd = drm_open_driver(DRIVER_ANY);
+		igt_assert(drm_fd >= 0);
+
+		igt_display_require(&display, drm_fd);
+		unigraf_require_device(drm_fd);
+
+		connector = unigraf_get_connector(drm_fd);
+	}
+
+	igt_subtest_with_dynamic("unigraf-dp-lane-count") {
+		int lane_counts[3] = {1, 2, 4};
+		int current_lanes;
+
+		for (i = 0; i < ARRAY_SIZE(lane_counts); i++) {
+			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_counts[i]) {
+				unigraf_reset();
+				unigraf_set_max_lane_count(lane_counts[i]);
+				unigraf_hpd_pulse(500000);
+
+				igt_display_require_output(&display);
+				output = igt_output_from_connector(&display, connector);
+				igt_assert(output);
+				igt_dp_force_link_retrain(drm_fd, output, 2);
+				init_output_and_display_pattern(&display, output);
+
+				current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
+				igt_assert_eq(current_lanes, lane_counts[i]);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("unigraf-dp-link-rate") {
+		int rates[] = {UNIGRAF_RATE_1_62_GHZ,
+			       UNIGRAF_RATE_2_7_GHZ,
+			       UNIGRAF_RATE_5_4_GHZ,
+			       UNIGRAF_RATE_6_75_GHZ,
+			       UNIGRAF_RATE_8_10_GHZ};
+		int current_rate;
+		int max_supported_rate;
+
+		for (i = 0; i < ARRAY_SIZE(rates); i++) {
+			igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]) {
+				unigraf_reset();
+				unigraf_set_max_link_rate(rates[i]);
+				unigraf_hpd_pulse(1000000);
+				igt_display_require_output(&display);
+				igt_display_reset(&display);
+				igt_display_require_output(&display);
+				output = igt_output_from_connector(&display, connector);
+				igt_assert(output);
+				igt_dp_force_link_retrain(drm_fd, output, 2);
+
+				init_output_and_display_pattern(&display, output);
+
+				current_rate = igt_dp_get_max_link_rate(drm_fd, output);
+				max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
+				igt_require(max_supported_rate >= unigraf_rate_to_kbs(rates[i]));
+				igt_assert_eq(current_rate, unigraf_rate_to_kbs(rates[i]));
+			}
+		}
+	}
+
+	igt_subtest("unigraf-dp-link-suspend-resume") {
+		int current_rate, current_lanes;
+
+		unigraf_reset();
+		igt_display_require_output(&display);
+		igt_display_reset(&display);
+		igt_display_require_output(&display);
+		output = igt_output_from_connector(&display, connector);
+		igt_assert(output);
+
+		/* Get initial link parameters */
+		current_rate = igt_dp_get_current_link_rate(drm_fd, output);
+		current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
+
+		/* Suspend the system */
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		/* Verify link parameters are maintained */
+		igt_assert_eq(igt_dp_get_current_link_rate(drm_fd, output), current_rate);
+		igt_assert_eq(igt_dp_get_current_lane_count(drm_fd, output), current_lanes);
+	}
+
+	igt_fixture() {
+		igt_display_fini(&display);
+		close(drm_fd);
+	}
+}

-- 
2.52.0

