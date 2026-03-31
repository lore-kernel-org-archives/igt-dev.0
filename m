Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AFF10F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512710ED4C;
	Tue, 31 Mar 2026 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sx8F9hu1";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9146410EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7DA9C4E4288A;
 Tue, 31 Mar 2026 17:11:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 552AD6029D;
 Tue, 31 Mar 2026 17:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B541104505DF; 
 Tue, 31 Mar 2026 19:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3jDn4Ddbs6yLmzQCIMm4XPnlFV4TLEc8eEUohBey+G8=;
 b=sx8F9hu1/I4BsD1xMBt/qDbeAT08YunKhs9NbFpIJu2Cc7fIFE5XhcPiwgjJsIdzqRqlh6
 uEs1usMAY2cZg9Lp6xQSCUO7LRceR09dtdiG1+kBNghXPVmJmj9Zw7z2lkYZzdZhO8NT+U
 7+I51Gy40HdSXwqFRFlnGwoNg0EDPjTC3MWrn35a/muOZrpYhXQlJk95hiuxRvy9BfBuSi
 eQecVOPo71gXiQspQMmf4jml5cewn5qXcmzZe7sMeVZGc7LzJlZlCUFC0qVR2Vuc+EtPtw
 uedJAYsyZ0sGx9aB1104NCD5n6RlsfTuUT1oxIm1BUvDFYQUyHEWbuAtX8Xe/A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:06 +0200
Subject: [PATCH i-g-t v10 49/49] tests/unigraf/unigraf_lt: Add test for
 link training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-unigraf-integration-v10-49-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6519;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uZIy3Eev5ZDPksmM1li7duNvPbpbIgPaTtiS165alS4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABCG03vbVuBXzrkGeGr1vg3jVfhomMJvZyNP
 RAiXgpeemaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJfSw//dh++JhNFWdcEttq4OndWjJtZFTDJBXd
 uJLeNPdGXLcUga6EQCprLHnwiJwxOIRdAkTmqCrMQ0jFvwGwFESTC7+dlu0NuuBbs2XSO9pOhnb
 1tU0vM2mBaXgDD29EcrxyPhTpENykwa+fQdP9rs2Y02kT7wt5J8t8uyGlY4SbCW5LfcmU+A3nIX
 4su4FR1eTc6qrs+TmWEILRhTF9wELYAMeut6+vqtJLeWDSLsr0vPasyD04PtMvoC4dsVM+t6klC
 /ANAD/YfSgIZz6RR+AXD2nZmg+cLSoR57yYBZYxLUHbfnz/t/EJM3/6nXwzNNmaPEJDCdX3HD+d
 8xKD9+gd26O7PBH0Jpu9O1Dkj137CtA3EWthtp+8BAr44++eY5p1ij0Rpdy6T+LFAAShKkC096k
 qrlj0Tzz3c74JcAhnwTay0+N6O9EbgP5MGuBZFIbkSM4UvMjDeUxLZ3rUD7eu89gVBhCK4K+gOR
 ULV+d4mXSVeWc9q6UQ411rBFZLDCZTHdef8yYrrEyBAEyULgpVo/OKw40IrwWw7CzV4xORHArcH
 DdhnfvRVG1Elr5TP54RabkK5wuJbcAk3nKWTovRj+ILp6COv1o+GFLjTSXNHcrduYvSTBOkzC4N
 hAAYW0F13C8gt0ROYcAQfReMaaBNUGyal4Bd8k+FfkvkuABdnHY0=
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

To test link training on various situation, add multiple link
training scenarios.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/unigraf/meson.build  |   1 +
 tests/unigraf/unigraf_lt.c | 183 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

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
index 000000000000..81e6ecd3fae4
--- /dev/null
+++ b/tests/unigraf/unigraf_lt.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
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
+	igt_crtc_t *crtc;
+	struct igt_fb fb;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int fb_id;
+
+	igt_modeset_disable_all_outputs(display);
+	igt_display_reset(display);
+
+	igt_output_set_crtc(output, 0);
+	crtc = igt_get_crtc_for_output(display, output);
+	igt_output_set_crtc(output, crtc);
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

