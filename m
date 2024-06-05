Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F993C27C6E
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B610E65A;
	Wed,  5 Jun 2024 14:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g96QlfcK";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49A10E277
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73F8240016;
 Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4UTA+B7a08mC51p4xPcuOWbn8Ce50JK4D0PQUZvemc=;
 b=g96QlfcKL0MTLEathmWXzKgJH4SiJDEadNKdQE2aNOuhyB+056rSfJTp08jbdf0imuNyEM
 EbOPhzmmmoFPbp8iUkLCZP6MUkFBRhfMXG6GisoOEJLkqvH5uUrgmrlpFwbK7e/DmSoxo/
 e48t6/OE82iHqAX08KjNKIHPbB96iB5WJgkWCrRR5oMwzIEsvgC9zFtIxC1pmnTbyqnUM3
 jMMM9t6wczetYwtYxfnILdhUFcNm+OctU7+0etNxysnDM5qgBVHWCoa71Z9VoxmxAg99Cx
 Wg84MD6ZE0fNIHiJ376PBMAJ5nAfauZseTs9+hdl2QDH/B9polY4Evf4V5htTA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:23 +0200
Subject: [PATCH i-g-t RFC 11/13] tests/chamelium: Introduce test resolution
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-11-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4785;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BountJbIMBIgvPPV64VF5IUUnoqaGfgdl5EejhZDGZs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ5zsDQWTQoVJwUEzXu7XXjMFDjDW/wC4I/R
 WUvwAkAiI2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eQAKCRAgrS7GWxAs
 4uK8D/9V4rKaLBy1vEGsnCc4e7Ew4tPRvfg+22oX5Nm4ilg13z7UtpCcctlArDexYUZzvhUDkDQ
 /qc3V2Gzu4AGBefylOanec/iehiyaPn8YocHA3AZ9lQelufMoeghRI9HYoLK4wItcj0DR2Sg9ZM
 JFUuo3mz3zYJwFOpYbb7OM4KxKN073vVIHwhd0wFD5TMKR9us3JKCgOx6mOZCCrUgsm/hOHJ9fa
 Kov7MJewKXqyhPuzdMunhisaReeatEajJMPIzuf1IJtHMnPP/J67ZqFCdbr3vEMAWj7y6YzN3GY
 dQdXBEFWvwQxaRPxk8ZjSHjTB9UiMTWk8yodq7W//MT8J9x1gDCbpUPd4F0ClQb/6xMxdsQKliS
 iVpzR++bQMGRY//kN26m5b/YVrB2BrMrWy4ds1WB7NSZ1w24aTcDLu1utpTmcKjZok+qD6tcl+q
 4UJrTj+DUZhVnTnYpSXpix6ewoPdZTJRViRrs+p0zGIIwy8gAboSGxhn7fCIB+Iz6zED8JLI+PX
 6FYQuYl3OOLOAocbMoocKdgK6T1KmfOdXT+ok9yLDlg4U/dwtGFqKXSR+cwb1C3vTCvwt6YlWgk
 IgZ5jNBGb1CdmmkptxVHylWk5EUQYEGTQE/zegQnTciXgfSA0uqihLusoLX6Iv+JLS3oVIEyxVE
 cP88JU3piH+WsoA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Introduce a new tests to ensures that the resolution listed and used by
the DRM device is correct according to the EDID.

This is inspired from the v2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 103 ++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index 836086f2dc13..a85091a3c660 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include <igt.h>
+
 #include "monitor_edids/monitor_edids_helper.h"
 #include "chamelium/v3/igt_chamelium.h"
 
@@ -70,6 +71,89 @@ static void edid_stress_resolution(int drm_fd, struct igt_chamelium_rpc *chameli
 	}
 }
 
+static void edid_resolution_list(int drm_fd, struct igt_chamelium_rpc *chamelium,
+				 struct chamelium_rpc_port_mapping *port_mapping)
+{
+	int screen_res_w, screen_res_h;
+	drmModeConnector *connector;
+	chamelium_edid_id edid_id;
+	drmModeModeInfoPtr modes;
+	struct igt_fb fb = {0};
+	igt_display_t display;
+	bool is_video_stable;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	int count_modes, i;
+	enum pipe pipe;
+
+	chamelium_reset_rpc(chamelium);
+
+	edid_id = chamelium_create_edid_rpc(chamelium,
+					    igt_kms_get_custom_edid(IGT_CUSTOM_EDID_BASE));
+	chamelium_apply_edid_rpc(chamelium, port_mapping->port_id, edid_id);
+
+	chamelium_plug_rpc(chamelium, port_mapping->port_id);
+
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	assert(igt_wait_for_connector_status(drm_fd, connector->connector_id, 10.0,
+					     DRM_MODE_CONNECTED));
+	drmModeFreeConnector(connector);
+
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	modes = connector->modes;
+	count_modes = connector->count_modes;
+
+	igt_display_require(&display, drm_fd);
+	igt_require(display.is_atomic);
+	igt_display_require_output(&display);
+
+	for (i = 0; i < count_modes; ++i)
+		igt_debug("#%d %s %uHz\n", i, modes[i].name, modes[i].vrefresh);
+
+	for (i = 0; i < count_modes; ++i) {
+		igt_info("Testing #%d %s %uHz\n", i, modes[i].name,
+			 modes[i].vrefresh);
+
+		igt_display_reset(&display);
+
+		output = igt_output_from_connector(&display, connector);
+		igt_assert(output);
+		pipe = igt_get_pipe_for_output(&display, output);
+		igt_output_set_pipe(output, pipe);
+
+		/* Set the screen mode with the one we chose. */
+		igt_create_color_fb(drm_fd, modes[i].hdisplay, modes[i].vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fb);
+
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(primary);
+
+		igt_plane_set_fb(primary, &fb);
+		igt_fb_set_size(&fb, primary, modes[i].hdisplay, modes[i].vdisplay);
+		igt_plane_set_size(primary, modes[i].hdisplay, modes[i].vdisplay);
+
+		igt_output_override_mode(output, &modes[i]);
+
+		igt_display_commit2(output->display, COMMIT_ATOMIC);
+
+		is_video_stable = chamelium_port_wait_video_input_stable_rpc(chamelium,
+									     port_mapping->port_id,
+									     10);
+		igt_assert(is_video_stable);
+
+		chamelium_port_get_resolution_rpc(chamelium, port_mapping->port_id, &screen_res_w, &screen_res_h);
+		igt_assert_eq(screen_res_w, modes[i].hdisplay);
+		igt_assert_eq(screen_res_h, modes[i].vdisplay);
+
+		igt_remove_fb(drm_fd, &fb);
+	}
+
+	igt_modeset_disable_all_outputs(&display);
+
+	igt_display_fini(&display);
+	drmModeFreeConnector(connector);
+}
+
 
 igt_main {
 	struct igt_chamelium_rpc *chamelium;
@@ -78,7 +162,7 @@ igt_main {
 	igt_fixture {
 		chamelium = chamelium_rpc_init_from_config();
 		igt_assert(chamelium);
-		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		drm_fd = drm_open_driver(DRIVER_ANY);
 		igt_assert(drm_fd);
 		chamelium_rpc_fill_port_mapping(chamelium, drm_fd);
 	}
@@ -159,6 +243,23 @@ igt_main {
 		}
 	}
 
+	igt_describe("Set a basic EDID and check if resolution are correct");
+	igt_subtest_with_dynamic("edid-resolution-list") {
+		struct chamelium_rpc_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_rpc_get_port_mapping(chamelium), link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				name = chamelium_get_port_name_rpc(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				edid_resolution_list(drm_fd, chamelium, port);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_rpc_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.43.2

