Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B27C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB24910E53E;
	Wed,  5 Jun 2024 14:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fzhp+3h9";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C5A10E620
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0E8C40018;
 Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=137D52UMu3wXBNMpDXQ/aiOuvs7E2TIwcsEP8F+gX7I=;
 b=fzhp+3h988JAfa1swMI3+f6RN00PmxLS1ULwOY9Jry8/+QE68V6KXsT1c2tsdD+cLUHejh
 n/T4opoW4SFu9mj2LCw/x1exUX2gxWtZKRDxBg2wQKshRk2yj1oW8zpAkgt17/B03E1pDd
 oxKkn0nhN5vywg9X46dAxt8qgdIRbhp9EZQ16GIG+nLyX11T7XmedACx5TnCsTZQWqMCJY
 kvWTjd+ibNGjSO1sXSKQnxNDTV5O8JZyghmKMSNtweJomLUEqgq+QLPfDAxcLjl+R31LE7
 9Nf+/iHdDSm3Y5Q2U7xyVA/DHWLwch0Nm0b7+deUnlN0WX6m7QMZfd0ra8N/Tw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:24 +0200
Subject: [PATCH i-g-t RFC 12/13] tests/chamelium: Introduce test sleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-12-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3809;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=68Ab477aMDaKg0PPhrBbpEolKw/Bw9jqYEP+cNKkHIY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ5dASRTESQQ+dTH8GC6MMFBO5M2DSt5zsJW
 8mnzTFmZU2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eQAKCRAgrS7GWxAs
 4sIcEADQODtP/AQEPx+iqoWY0Yws8+3L3wv2GrWWsZPgGfdhdf+Tpl9cX9y/QiXVQYU8vLg3iN1
 116l1OdiOwDhzWbzy14LZhqdLVbTSAdAnWZthOweKeAW7xBeAWdCNTLTj5sODVnqIW3KIgba2ld
 WUJ0+90mk6zVbpmJDzz+B8w/vPHgcWtv+5Q/EtH+gQhFPZoTFXSj336RxgYNrW/Wx7VoX4/71ei
 VSHh90lSw6J2qyofaaHKsmsWiEzxm3pyLvlftBna6WqdLwlYMh3gak4GIomENVt7nizkbhNBVrb
 Y5c02RoTMB1ONTC247/lVFAUjs+5HUH9+U80kfOXRe4TP1Pf6vvqpI2CBOOjkHHt5qR0SLSfylO
 IXKHE2MRP31c2nUWNXWpjwqIO1ZyiAL+Uvug7HNWaK1nJ8sXXWmNFgNFAUhNatgI704UpYuV+U6
 jgIpVyAeIgrtRwHszBOKZyRdPaQ9kZVxCktsLiiKtG4Mw7MHvMSozZtPEnp8KMWF8cIvGgF1ZwG
 DK3URegouf81xsEHpgS7EEfLrVW5LBI/eNQ187AmHOWpXzTv3TwVLOTqD2VpHwfqGox2x6axcIv
 fyg6KpLGPU+TruXx7xijIbVnni89a/7aRY6rcrIbpMiQuVQ+qPcxiAgat8UCgl05n3VzyzGD77p
 l6M5BiDdBBlbU6Q==
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

Introduce a new test to ensures that if the display is changed during a
sleep, the new one is properly detected.

This is inspired from the v2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.h   |  3 +-
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 56 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index ff5672058816..3e91cee423b8 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -12,8 +12,9 @@
 #define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
 
 #include <stdint.h>
+#include "igt.h"
 
-#include "chamelium/v2/igt_chamelium.h"
+struct chamelium_edid;
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
 #define EDID_NAME_MAX_LEN 28
diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index a85091a3c660..efd53b392f4f 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -154,6 +154,45 @@ static void edid_resolution_list(int drm_fd, struct igt_chamelium_rpc *chamelium
 	drmModeFreeConnector(connector);
 }
 
+static void test_suspend_resume_edid_change(int drm_fd, struct igt_chamelium_rpc *chamelium,
+					    struct chamelium_rpc_port_mapping *port_mapping,
+					    enum igt_suspend_state state,
+					    enum igt_suspend_test test)
+{
+	chamelium_edid_id base_edid, alt_edid;
+	drmModeConnectorPtr connector;
+
+	chamelium_reset_rpc(chamelium);
+
+	base_edid = chamelium_create_edid_rpc(chamelium, igt_kms_get_base_edid());
+	igt_assert(base_edid);
+	alt_edid = chamelium_create_edid_rpc(chamelium, igt_kms_get_alt_edid());
+	igt_assert(alt_edid);
+
+	chamelium_apply_edid_rpc(chamelium, port_mapping->port_id, base_edid);
+	chamelium_plug_rpc(chamelium, port_mapping->port_id);
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector->connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+	drmModeFreeConnector(connector);
+	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_base_edid());
+
+	chamelium_apply_edid_rpc(chamelium, port_mapping->port_id, alt_edid);
+
+	// Schedule the hpd pulse during the sleep state
+	chamelium_schedule_hpd_toggle_rpc(chamelium, port_mapping->port_id,
+					  igt_get_autoresume_delay(state) * 1000 / 2,
+					  true);
+	igt_system_suspend_autoresume(state, test);
+
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector->connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+	drmModeFreeConnector(connector);
+
+	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_alt_edid());
+}
+
 
 igt_main {
 	struct igt_chamelium_rpc *chamelium;
@@ -260,6 +299,23 @@ igt_main {
 		}
 	}
 
+	igt_describe("Check if hotplug during sleeping are correctly handled");
+	igt_subtest_with_dynamic("edid-edid-suspend-mem") {
+		struct chamelium_rpc_port_mapping *port, *tmp;
+		igt_list_for_each_entry_safe(port, tmp, chamelium_rpc_get_port_mapping(chamelium), link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				name = chamelium_get_port_name_rpc(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				test_suspend_resume_edid_change(drm_fd, chamelium, port, SUSPEND_STATE_MEM,
+								SUSPEND_TEST_NONE);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_rpc_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.43.2

