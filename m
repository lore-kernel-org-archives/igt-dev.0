Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43D5C3DA50
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99510E5D1;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ThScAkYy";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142B10E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77EA92000D;
 Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mt8Jg4qsvZGatJMXnTCVUxnxBc5u5rHjzMKREZ7BYfY=;
 b=ThScAkYyuAMYKZ3tBIIlCtPMKzYYPUrX/ucp0llPQlY7rhOicZZLHaVdWzSGgavBueFsnU
 Kh/EvIHuFL0Zmc+JBAZda4Zx9eSXFtwhS+IoR1KLY+eXrXEw/5VIMF0eNO/x3GnEVewS82
 rmQVsIPMs/A+nwcyxXEE92QvQy6kcPRPvs6vddnMmkJR+Iz2HR5lxE/WRxNEf41KuCE3Du
 2Imhcp9X6/Gu94qqz8cJ6daMMKYtPHvx6ywY2S6K8S/jKTkNT8fqys1afq1lfTR/wwDO2d
 n68cIoVPvg6oVqmaikAXONMA0/m5MUuP8roBDOz3KL9InQHdm0emv6ob9X4L8g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:51 +0200
Subject: [PATCH i-g-t v2 35/39] tests/chamelium/v3: Implement test for DRM
 device resolution
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-35-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gpSVl0ZCr4/axVN1XN3lF0/n3W1aSA1gRgbOFaIGBjo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVia5GzD2lOAdp6XVM4HGEfnHqvRPWyJ1DoY/
 BMZ1c0wRxeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4tUPEACprIHTp1etrSJanZn0lICPmnCOJp5gTyT7N8+GkbWbDadBzQ0ckM+ZvyJQ4AymV9MkFZY
 qIf0p0ZuOz/M1EKgOc1Hz3xEAfFSuYHyCFeFeMQfA1xBDaGus5ZKAi6jLNTl40oNXuvtdIyzHzN
 JRTfYai4N3wUFUDp5fRAXFQoAPmB2O2s/iJK4FHlsvCiEGZksVHQl/YSAmG07VfyM/CSceLIfbe
 NSbT65TsaYmWTOgLTDO3lUQqA3Dn4Wdh1qPzAlb1ehDo00VUphujffO3MLcfdV7kou74GVzIK3m
 uqywOvW/1u0g8faMYwS1MDquPITNh99/dN1eIwYN7lK4F1mRcTwZaSkkiW8Rv3vxypK0H0LQe+C
 bes4eesSraQzLBW9i/tCKe/i+e30q97BTZiMcpvXkoj9FPsHvSb6zyD+ap6xHFFCcjxlaTSILaG
 uvnheUdlhzbk14QBJoiTqw7MLUpv57xonDuzrLgLriBfJlmgzwpeJ80+YbxU0/b6Qin5UAfg3/F
 PtjrS/pnsQusoASlWC9wppUXpv4t21eJhPGFjuV1IP1zU5DNfHbbaPEj/hnN/ry/c8wp5uAfDm+
 C/JqlDp1RGChrtb5OFyhmflPMAQdGymdhWAatmdlbzEwM3DDZ/f2vmFyfLoZSA3jgm6J/LdXXQp
 sk1srFNeXZIG/Xw==
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

This commit introduces a new test to verify that the resolution listed and
used by the DRM device is accurate according to the EDID.

The test is inspired by the v2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 104 +++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index b6660769897f..c03829b43aca 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -69,6 +69,90 @@ static void edid_stress_resolution(int drm_fd, struct igt_chamelium_v3 *chameliu
 	}
 }
 
+static void edid_resolution_list(int drm_fd, struct igt_chamelium_v3 *chamelium,
+				 struct chamelium_v3_port_mapping *port_mapping)
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
+	uint32_t connector_id;
+
+	chamelium_v3_reset(chamelium);
+
+	edid_id = chamelium_v3_create_edid(chamelium,
+					   igt_kms_get_custom_edid(IGT_CUSTOM_EDID_BASE));
+	chamelium_v3_apply_edid(chamelium, port_mapping->port_id, edid_id);
+
+	chamelium_v3_plug(chamelium, port_mapping->port_id);
+
+	connector_id = chamelium_v3_port_mapping_get_connector_id(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+
+	connector = chamelium_v3_port_mapping_get_connector(port_mapping, drm_fd);
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
+		is_video_stable = chamelium_v3_port_wait_video_input_stable(chamelium,
+									    port_mapping->port_id,
+									    10);
+		igt_assert(is_video_stable);
+
+		chamelium_v3_port_get_resolution(chamelium, port_mapping->port_id, &screen_res_w,
+						 &screen_res_h);
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
 igt_main
 {
 	struct igt_chamelium_v3 *chamelium;
@@ -163,6 +247,26 @@ igt_main
 		}
 	}
 
+	igt_describe("Set a basic EDID and check if resolution are correct");
+	igt_subtest_with_dynamic("edid-resolution-list") {
+		struct chamelium_v3_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_v3_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				igt_require(!chamelium_v3_is_mst(chamelium, port->port_id));
+
+				name = chamelium_v3_get_port_name(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				edid_resolution_list(drm_fd, chamelium, port);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_v3_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.44.2

