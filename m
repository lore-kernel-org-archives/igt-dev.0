Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645B5EA4FB7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028A110E387;
	Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1YszWIKI";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23DA10E374
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D6D244E41030;
 Mon, 23 Feb 2026 12:09:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A43075FD43;
 Mon, 23 Feb 2026 12:09:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9808310368F8A; Mon, 23 Feb 2026 13:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=az8qN0k8W0VG8+VZXskwOxb81B8wtLRjqTsKscrFQSE=;
 b=1YszWIKIXG5ri0l1lhdQCXT/SNzukTU7Kqxqa8WEWNtB+QnXgM3Q5TL7mSwK3aqPg1UamT
 4sHRHGARfaQXEZtpLrjDP4pKACNsPAV1w1mP9UIUSZxS71a0lc0Qr3uHFmKDnMy22JGkdY
 oX+0PsYTxua+EStP1w6zHcM7Y1MfPbEi4tLPfyYPFlY3/mXP9rXA3H8eoFl+sLYYBuRHgz
 bMoQ60gs4XBSbh6ibaZTZGQpyvkQPsslxjxbv4aTk2foY3uiM/4YSwGLraKVWVV+Cm95e8
 0OMNQTwzbZTIfQqxM5r2Qzh2fE4ZQ4kFa8xLTw6EUp/aL+3onLFjEB1bxA+1xA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:37 +0100
Subject: [PATCH i-g-t v7 30/48] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-unigraf-integration-v7-30-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5824;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8N0lnzGdvrETRgn5ImaLE1VI9iIrZs1jI0D40BANnDk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqRtyQU7d3xjWg0/r9YuUfi35IWjfkyJYI6
 8unb9uTrzSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIJKxAAomHo48v+tyXSHhugCQ3UKA880rlhVPQ
 8nca+4DTy1EK2s547AZUCSwPRn10FaK5LyvQQTPZVCAYhhj7XWgArDHYWMaBtgH3VugLpBBC4pC
 N/4nOE9mCJVPRdZsv3XOK9Kc25YcLMwYpsUa+N3JaG6ytGt85paY15TjQuUM3Az0OVscq3cBAbU
 jGILoIJBSyvruipvFdK/ZbtMDHS1lARKih2jEs+bUItoSJVDQI+aMsRi6IUdwV/4Xo0TSugnqqT
 zdqx7WIMoQ3ZMuBnQBu63Vw78RdFAE/3EWKX1aEn853xjP/sjj145N1AtW2vSgCLiTtNgk2SfpR
 k9MTBXH/CJydP9W06HrFkt90uMdvdRIN+iAtPC9Z1MzOCM7OcqGu/U2qgMlOFHFNwo/QsVb5g36
 wBHYYj7ZOjk8ROZBONeLDfBlineKZv2aeD2qIaqwPDb5Zf69AQLhlC/5HmmcpihpTuVQJdtIzUM
 IoT58XWBFnSmjbowPAHc5oi1K4Z3W7gkd6JvcbD30nX+Ej9ereulbVcm/MeLuarkeXew5Kvybcz
 Ma1rIiNfrJm31YRTTuxOVpYu+qkrHax8Wq8IDw6aLcmNhXUpHp2XCZCHsALxMuswjXeEsrVAoP8
 bJEMdX5+fTVAnKr+arTHQm/plaCrug9BctR5iKMAdiEt9PXrNZhk=
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

Adds two tests to validate unigraf communication.

unigraf-connect checks if the device is connected and if the EDID is
properly applied.

ungiraf-reconnect checks if the device can be connected/reconnected
using SST and MST configurations.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/meson.build                    |   4 ++
 tests/unigraf/meson.build            |  12 ++++
 tests/unigraf/unigraf_connectivity.c | 135 +++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9be91..4b56c862c6bc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -472,6 +472,10 @@ foreach prog : intel_progs
 	endif
 endforeach
 
+if libtsi.found()
+	subdir('unigraf')
+endif
+
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
new file mode 100644
index 000000000000..4ef8c32151e4
--- /dev/null
+++ b/tests/unigraf/meson.build
@@ -0,0 +1,12 @@
+unigraf_progs = [
+	'unigraf_connectivity',
+]
+
+foreach prog : unigraf_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : unigrafdir,
+				       install_rpath : unigraf_rpathdir,
+				       install : true)
+	test_list += join_paths('unigraf', prog)
+endforeach
diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
new file mode 100644
index 000000000000..0fc777078d9c
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
+
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <xf86drmMode.h>
+
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "unigraf/unigraf.h"
+
+/**
+ * TEST: unigraf connectivity
+ * Category: Core
+ * Description: Testing connectivity with a unigraf device
+ *
+ * SUBTEST: unigraf-connect-edid
+ * Description: Verify that the unigraf device is properly connected to the DUT
+ *              and that the correct EDID is detected and read.
+ *
+ * SUBTEST: unigraf-connect-mst
+ * Description: Ensure that the DUT can correctly detect and handle the unigraf device
+ *              when it is configured to operate in MST mode.
+ */
+
+IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
+int igt_main()
+{
+	int drm_fd;
+
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+	}
+
+	igt_describe("Make sure that the unigraf device is connected to the DUT and EDID is properly detected");
+	igt_subtest("unigraf-connect-edid") {
+		drmModePropertyBlobPtr edid_blob = NULL;
+		struct igt_display display;
+		uint64_t edid_blob_id;
+		igt_output_t *output;
+		uint32_t unigraf_edid_len;
+		void *unigraf_edid;
+		bool found = false;
+
+		// Sleep are required to allow hardware to configure/detect the current configuration
+		unigraf_require_device(drm_fd);
+		unigraf_hpd_deassert();
+		sleep(igt_default_display_detect_timeout());
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+		sleep(igt_default_display_detect_timeout());
+		igt_display_require(&display, drm_fd);
+		sleep(igt_default_display_detect_timeout());
+
+		unigraf_edid = unigraf_read_edid(0, &unigraf_edid_len);
+
+		for_each_connected_output(&display, output) {
+			if (output->config.connector->connector_type ==
+			    DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_assert(kmstest_get_property(drm_fd,
+								output->config.connector->connector_id,
+								DRM_MODE_OBJECT_CONNECTOR, "EDID",
+								NULL, &edid_blob_id, NULL));
+				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+				if (!edid_blob)
+					continue;
+
+				if (!memcmp(unigraf_edid, edid_blob->data,
+					    min(edid_blob->length, unigraf_edid_len)))
+					found = true;
+
+				drmModeFreePropertyBlob(edid_blob);
+
+				if (found)
+					break;
+			}
+		}
+		igt_assert_f(found, "No output with the correct EDID was found\n");
+
+		free(unigraf_edid);
+	}
+
+	igt_describe("Make sure that the unigraf device can be used as a MST device");
+	igt_subtest("ungiraf-connect-mst") {
+		int newly_connected_count, already_connected_count, diff_len;
+		uint32_t *newly_connected = NULL, *already_connected = NULL, *diff = NULL;
+		int max_count;
+
+		unigraf_require_device(drm_fd);
+		max_count = unigraf_get_mst_stream_max_count();
+
+		unigraf_hpd_deassert();
+
+		already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+		igt_debug("Already connected count: %d\n", already_connected_count);
+
+		// i = 0 is SST so we need to process max_count + 1 streams
+		for (int i = 0; i <= max_count; i++) {
+			unigraf_hpd_deassert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			unigraf_set_mst_stream_count(max(i, 1));
+			if (!i)
+				unigraf_set_sst();
+			else
+				unigraf_set_mst();
+
+			unigraf_hpd_assert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+									    already_connected,
+									    already_connected_count,
+									    drm_fd);
+
+			diff_len = get_list_diff(newly_connected, newly_connected_count,
+						 already_connected, already_connected_count, &diff);
+
+			igt_assert_f(diff_len == max(i, 1),
+				     "Invalid connected connector count, expected %d found %d\n",
+				     max(i, 1), diff_len);
+		}
+	}
+}

-- 
2.52.0

